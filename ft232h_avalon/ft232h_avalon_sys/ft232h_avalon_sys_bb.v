
module ft232h_avalon_sys (
	clk_clk,
	clk_0_clk,
	ddr3_pll_sharing_pll_mem_clk,
	ddr3_pll_sharing_pll_write_clk,
	ddr3_pll_sharing_pll_locked,
	ddr3_pll_sharing_pll_write_clk_pre_phy_clk,
	ddr3_pll_sharing_pll_addr_cmd_clk,
	ddr3_pll_sharing_pll_avl_clk,
	ddr3_pll_sharing_pll_config_clk,
	ddr3_pll_sharing_pll_mem_phy_clk,
	ddr3_pll_sharing_afi_phy_clk,
	ddr3_pll_sharing_pll_avl_phy_clk,
	ddr3_status_local_init_done,
	ddr3_status_local_cal_success,
	ddr3_status_local_cal_fail,
	ft232_usb_usb_data,
	ft232_usb_usb_oe_n,
	ft232_usb_usb_rd_n,
	ft232_usb_usb_rxf_n,
	ft232_usb_usb_siwu,
	ft232_usb_usb_txe_n,
	ft232_usb_usb_wr_n,
	ft232_usb_usb_clock,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_dm,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	oct_rzqin,
	reset_reset_n);	

	input		clk_clk;
	input		clk_0_clk;
	output		ddr3_pll_sharing_pll_mem_clk;
	output		ddr3_pll_sharing_pll_write_clk;
	output		ddr3_pll_sharing_pll_locked;
	output		ddr3_pll_sharing_pll_write_clk_pre_phy_clk;
	output		ddr3_pll_sharing_pll_addr_cmd_clk;
	output		ddr3_pll_sharing_pll_avl_clk;
	output		ddr3_pll_sharing_pll_config_clk;
	output		ddr3_pll_sharing_pll_mem_phy_clk;
	output		ddr3_pll_sharing_afi_phy_clk;
	output		ddr3_pll_sharing_pll_avl_phy_clk;
	output		ddr3_status_local_init_done;
	output		ddr3_status_local_cal_success;
	output		ddr3_status_local_cal_fail;
	inout	[7:0]	ft232_usb_usb_data;
	output		ft232_usb_usb_oe_n;
	output		ft232_usb_usb_rd_n;
	input		ft232_usb_usb_rxf_n;
	output		ft232_usb_usb_siwu;
	input		ft232_usb_usb_txe_n;
	output		ft232_usb_usb_wr_n;
	input		ft232_usb_usb_clock;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output	[0:0]	memory_mem_ck;
	output	[0:0]	memory_mem_ck_n;
	output	[0:0]	memory_mem_cke;
	output	[0:0]	memory_mem_cs_n;
	output	[1:0]	memory_mem_dm;
	output	[0:0]	memory_mem_ras_n;
	output	[0:0]	memory_mem_cas_n;
	output	[0:0]	memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[15:0]	memory_mem_dq;
	inout	[1:0]	memory_mem_dqs;
	inout	[1:0]	memory_mem_dqs_n;
	output	[0:0]	memory_mem_odt;
	input		oct_rzqin;
	input		reset_reset_n;
endmodule
