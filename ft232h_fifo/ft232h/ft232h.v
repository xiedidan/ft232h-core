module ft232h(rst_n, clk,
	avalon_address, avalon_read, avalon_readdata, avalon_waitrequest, avalon_write, avalon_writedata,
	clock, data, oe_n, rd_n, rxf_n, siwu, txe_n, wr_n);
	
	// module signal
	input rst_n, clk;
	
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
	
	reg wr_n;
	
	parameter READ_DATA = 8'b0;
	parameter WRITE_DATA = 8'b1;
	
	// inter-connection
	wire write_rdempty, write_wrfull;
	wire [12:0] write_rdusedw;
	wire [12:0] write_wrusedw;
	wire write_wrreq;
	wire write_rdreq;

	/* not implemented for now
	
	wire read_rdempty, read_wrfull;
	wire [12:0] read_rdusedw;
	wire [12:0] read_wrusedw;
	
	*/
	
	// data reg
	reg last_txe_n;
	
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
	
	// avalon logic
	assign avalon_waitrequest = (~rst_n) | 
		(avalon_write & (avalon_address == WRITE_DATA) & write_wrfull); // |
		// (avalon_read & (avalon_address == READ_DATA) & read_rdempty);
		
	// write fifo logic
	assign write_wrreq = avalon_write & (avalon_address == WRITE_DATA) & (~write_wrfull);
		
	always @(negedge rst_n or posedge clock)
	if (~rst_n)
		wr_n <= 1'b1;
	else if (~txe_n & ~write_rdempty)
		wr_n <= 1'b0;
	else
		wr_n <= 1'b1;
	
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
