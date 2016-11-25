module ft232h_simple(
	rst_n,
	rd_n,
	wr_n,
	oe_n,
	rxf_n,
	txe_n,
	siwu_n,
	data,
	clock);
// sys port
input wire rst_n;

output wire rd_n;
output wire wr_n;
output wire oe_n;
output wire siwu_n;

input wire rxf_n;
input wire txe_n;
input wire clock;

inout wire [7:0] data;

assign siwu_n = 1'b1;
assign oe_n = 1'b0;
assign rd_n = 1'b1;

reg [7:0] dataReg;
reg wr_nReg;
reg last_txe_n;

assign data = dataReg;
assign wr_n = wr_nReg;

always @(negedge rst_n or posedge clock)
if (~rst_n)
	last_txe_n <= 1'b1;
else
	last_txe_n <= txe_n;

always @(negedge rst_n or posedge clock)
if (~rst_n)
	dataReg <= 8'b0;
else
	if (~last_txe_n & ~txe_n)
		dataReg <= dataReg + 8'b1;

always @(negedge rst_n or posedge clock)
if (~rst_n)
	wr_nReg <= 1'b1;
else
	if (~txe_n)
		wr_nReg <= 1'b0;
	else
		wr_nReg <= 1'b1;
	
endmodule
