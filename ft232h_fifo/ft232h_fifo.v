module ft232h_fifo(rst_n, clk,
	clock, data, oe_n, rd_n, rxf_n, siwu, txe_n, wr_n);
	
	// global signal
	input rst_n, clk;
	
	// usb signal
	input clock;
	inout [7:0] data;
	output oe_n, rd_n, wr_n, siwu;
	input rxf_n, txe_n;
	
	// inter-connection
	wire sysclk;
	
	wire [7:0] avalon_address;
	wire avalon_read, avalon_write;
	wire avalon_waitrequest;
	wire [31:0] avalon_readdata;
	wire [31:0] avalon_writedata;
	
	// data reg
	reg [7:0] counter;
	
	// avalon logic
	assign avalon_address = 8'b1;
	assign avalon_read = 1'b0;
	assign avalon_write = 1'b1;
	assign avalon_readdata = 32'b0;
	assign avalon_writedata = {24'b0, counter};
	
	always @(negedge rst_n or posedge sysclk)
	if (~rst_n)
		counter <= 8'b0;
	else if (~avalon_waitrequest)
		counter <= counter + 8'b1;
	
	ft232h ftInst(
		.rst_n(rst_n),
		.clk(sysclk),
		.avalon_address(avalon_address),
		.avalon_read(avalon_read),
		.avalon_readdata(avalon_readdata),
		.avalon_waitrequest(avalon_waitrequest),
		.avalon_write(avalon_write),
		.avalon_writedata(avalon_writedata),
		.clock(clock),
		.data(data),
		.oe_n(oe_n),
		.rd_n(rd_n),
		.rxf_n(rxf_n),
		.siwu(siwu),
		.txe_n(txe_n),
		.wr_n(wr_n)
	);
	
	pll pllInst(
		.refclk(clk),
		.rst(~rst_n),
		.outclk_0(sysclk)
	);

endmodule
