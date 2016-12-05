module ft232h(rst_n, clk, tx_almost_empty, rx_almost_full,
	avalon_address, avalon_read, avalon_readdata, avalon_waitrequest, avalon_write, avalon_writedata,
	clock, data, oe_n, rd_n, rxf_n, siwu, txe_n, wr_n);

	// module signal
	input rst_n, clk;
	output tx_almost_empty, rx_almost_full;

	// avalon signal
	input [7:0] avalon_address;
	input avalon_read, avalon_write;
	output avalon_waitrequest;
	output [31:0] avalon_readdata;
	input [31:0] avalon_writedata;

	// usb signal
	input clock;
	inout [7:0] data;
	output oe_n, rd_n, wr_n, siwu;
	input rxf_n, txe_n;

	parameter READ_DATA = 0;
	parameter WRITE_DATA = 1;
	parameter RX_FIFO_COUNTER = 2;
	parameter TX_FIFO_COUNTER = 3;
	parameter RX_ALMOST_FULL_THRESHOLD = 4;
	parameter TX_ALMOST_EMPTY_THRESHOLD = 5;
	parameter CLEAR_IRQ = 6; // writing 1 to bit 0 clears rx_almost_full, writing 1 to bit 1 clears tx_almost_empty
	parameter CONTROL = 7; // bit 0 - rx_almost_full enabled, bit 1 - tx_almost_empty enabled
	// parameter CLEAR_FIFO = 8; // writing 0 clears rx fifo, writing 1 clears tx fifo

	// inter-connection
	wire write_rdempty, write_wrfull;
	wire [9:0] write_rdusedw;
	wire [9:0] write_wrusedw;
	wire write_wrreq;
	wire write_rdreq;

	/* not implemented for now

	wire read_rdempty, read_wrfull;
	wire [12:0] read_rdusedw;
	wire [12:0] read_wrusedw;

	*/

	// data reg
	reg [31:0] avalon_readdata;
	reg last_txe_n;
	reg [9:0] rx_fifo_threshold;
	reg [9:0] tx_fifo_threshold;
	reg [9:0] last_write_wrusedw;
	reg tx_almost_empty, rx_almost_full;
	reg [7:0] clear_irq;
	reg [7:0] control;

	// usb logic
	assign oe_n = 1'b0;
	assign siwu = 1'b1;

	// reading from usb is not implmented for now
	// REMOVE THIS BEFORE IMPLEMENTING USB READING!!
	assign rd_n = 1'b1;

	always @(negedge rst_n or posedge clock)
	if (~rst_n)
		last_txe_n <= 1'b1;
	else
		last_txe_n <= txe_n;	
	
	// tx IRQ logic
	always @(negedge rst_n or posedge clk)
	if (~rst_n)
		tx_almost_empty <= 1'b0;
	else if (control[1]) // irq turned on
		if (tx_almost_empty) // irq already triggered
			begin
			if (avalon_write & (avalon_address == CLEAR_IRQ) & avalon_writedata[1])
				tx_almost_empty <= 1'b0;
			end
		else // irq not triggered
			begin
			if (write_wrusedw <= tx_fifo_threshold)
				tx_almost_empty <= 1'b1;
			end
	else // irq turned off
		tx_almost_empty <= 1'b0;
		
	// write regs
	always @(negedge rst_n or posedge clk)
	if (~rst_n)
		begin	
		rx_fifo_threshold <= 10'b1000000000; // 512
		tx_fifo_threshold <= 10'b1000000000; // 512
		clear_irq <= 8'b0;
		control <= 8'b0;
		end
	else if (avalon_write)	
		if (avalon_address == RX_ALMOST_FULL_THRESHOLD)
			rx_fifo_threshold <= avalon_writedata[9:0];
		else if (avalon_address == TX_ALMOST_EMPTY_THRESHOLD)
			tx_fifo_threshold <= avalon_writedata[9:0];
		else if (avalon_address == CONTROL)
			control <= avalon_writedata[1:0];		

	// read regs
	always @(negedge rst_n or posedge clk)
	if (~rst_n)
		avalon_readdata <= 32'b0;
	else if (avalon_read)
		if (avalon_address == TX_FIFO_COUNTER)
			avalon_readdata <= {22'b0, write_wrusedw};
		/*
		else if (avalon_address == RX_FIFO_COUNTER)
			avalon_readdata <= {22'b0, read_rdusedw};
		*/
		
	assign avalon_waitrequest = (~rst_n) |
		(avalon_write & (avalon_address == WRITE_DATA) & write_wrfull); // |
		// (avalon_read & (avalon_address == READ_DATA) & read_rdempty);

	// write fifo logic
	assign write_wrreq = avalon_write & (avalon_address == WRITE_DATA) & (~write_wrfull);

	assign wr_n = (~rst_n) | txe_n | write_rdempty;

	// use combinational logic to deassert rdreq ASAP when txe_n deasserts
	// last_txe_n is synced to clock so there's still 1 clock delay for rdreq when txe_n asserts
	assign write_rdreq = rst_n & (~last_txe_n) & (~txe_n) & (~write_rdempty);

	// avalon -> write_fifo -> usb
	fifo	write_fifo (
		.data(avalon_writedata[7:0]),
		.rdclk(clock),
		.rdreq(write_rdreq),
		.wrclk(clk),
		.wrreq(write_wrreq),
		.q(data),
		.rdempty(write_rdempty),
		.rdusedw(write_rdusedw),
		.wrfull(write_wrfull),
		.wrusedw(write_wrusedw)
	);

	/* not implemented for now

	// read fifo logic
	assign read_rdreq = avalon_read & (avalon_address == READ_DATA) & (~read_rdempty);

	// usb -> read_fifo -> avalon
	fifo	read_fifo (
		.data ( data_sig ),
		.rdclk ( clk ),
		.rdreq ( rdreq_sig ),
		.wrclk ( clock ),
		.wrreq ( wrreq_sig ),
		.q ( q_sig ),
		.rdempty ( rdempty_sig ),
		.rdusedw ( rdusedw_sig ),
		.wrfull ( wrfull_sig ),
		.wrusedw ( wrusedw_sig )
	);

	*/

endmodule
