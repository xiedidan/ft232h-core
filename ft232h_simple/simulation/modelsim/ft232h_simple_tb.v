`timescale 1 ns/100 ps

module ft232h_simple_tb;
reg clk;
wire pll_lock;
reg rst_n;

wire rd_n;
wire wr_n;
wire oe_n;
wire siwu_n;

reg rxf_n;
reg txe_n;
reg clock;

wire [7:0] data;

reg [5:0] counter;

ft232h_simple simple_inst(
  .clk(clk),
	.pll_lock(pll_lock),
	.rst_n(rst_n),
	.rd_n(rd_n),
	.wr_n(wr_n),
	.oe_n(oe_n),
	.rxf_n(rxf_n),
	.txe_n(txe_n),
	.siwu_n(siwu_n),
	.data(data),
	.clock(clock)
);

initial
begin
  clk = 1'b0;
  clock = 1'b0;
  rst_n = 1'b0;
  rxf_n = 1'b1;
  txe_n = 1'b1;
  counter = 6'b0;
  #30 rst_n = 1'b1;
  #20 txe_n = 1'b0;
end

always #21.3 clk = ~clk;
always #8.3 clock = ~clock;

always @(negedge clock)
begin
  if (counter == 6'b0)
    txe_n <= ~txe_n;
  counter <= counter + 6'b1;
end

endmodule
