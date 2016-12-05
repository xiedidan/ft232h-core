	component ft232h_avalon_sys is
		port (
			clk_clk                                    : in    std_logic                     := 'X';             -- clk
			clk_0_clk                                  : in    std_logic                     := 'X';             -- clk
			ddr3_pll_sharing_pll_mem_clk               : out   std_logic;                                        -- pll_mem_clk
			ddr3_pll_sharing_pll_write_clk             : out   std_logic;                                        -- pll_write_clk
			ddr3_pll_sharing_pll_locked                : out   std_logic;                                        -- pll_locked
			ddr3_pll_sharing_pll_write_clk_pre_phy_clk : out   std_logic;                                        -- pll_write_clk_pre_phy_clk
			ddr3_pll_sharing_pll_addr_cmd_clk          : out   std_logic;                                        -- pll_addr_cmd_clk
			ddr3_pll_sharing_pll_avl_clk               : out   std_logic;                                        -- pll_avl_clk
			ddr3_pll_sharing_pll_config_clk            : out   std_logic;                                        -- pll_config_clk
			ddr3_pll_sharing_pll_mem_phy_clk           : out   std_logic;                                        -- pll_mem_phy_clk
			ddr3_pll_sharing_afi_phy_clk               : out   std_logic;                                        -- afi_phy_clk
			ddr3_pll_sharing_pll_avl_phy_clk           : out   std_logic;                                        -- pll_avl_phy_clk
			ddr3_status_local_init_done                : out   std_logic;                                        -- local_init_done
			ddr3_status_local_cal_success              : out   std_logic;                                        -- local_cal_success
			ddr3_status_local_cal_fail                 : out   std_logic;                                        -- local_cal_fail
			ft232_usb_usb_data                         : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- usb_data
			ft232_usb_usb_oe_n                         : out   std_logic;                                        -- usb_oe_n
			ft232_usb_usb_rd_n                         : out   std_logic;                                        -- usb_rd_n
			ft232_usb_usb_rxf_n                        : in    std_logic                     := 'X';             -- usb_rxf_n
			ft232_usb_usb_siwu                         : out   std_logic;                                        -- usb_siwu
			ft232_usb_usb_txe_n                        : in    std_logic                     := 'X';             -- usb_txe_n
			ft232_usb_usb_wr_n                         : out   std_logic;                                        -- usb_wr_n
			ft232_usb_usb_clock                        : in    std_logic                     := 'X';             -- usb_clock
			memory_mem_a                               : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba                              : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                              : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n                            : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke                             : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n                            : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm                              : out   std_logic_vector(1 downto 0);                     -- mem_dm
			memory_mem_ras_n                           : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			memory_mem_cas_n                           : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			memory_mem_we_n                            : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			memory_mem_reset_n                         : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                              : inout std_logic_vector(15 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                             : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                           : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                             : out   std_logic_vector(0 downto 0);                     -- mem_odt
			oct_rzqin                                  : in    std_logic                     := 'X';             -- rzqin
			reset_reset_n                              : in    std_logic                     := 'X'              -- reset_n
		);
	end component ft232h_avalon_sys;

	u0 : component ft232h_avalon_sys
		port map (
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --              clk.clk
			clk_0_clk                                  => CONNECTED_TO_clk_0_clk,                                  --            clk_0.clk
			ddr3_pll_sharing_pll_mem_clk               => CONNECTED_TO_ddr3_pll_sharing_pll_mem_clk,               -- ddr3_pll_sharing.pll_mem_clk
			ddr3_pll_sharing_pll_write_clk             => CONNECTED_TO_ddr3_pll_sharing_pll_write_clk,             --                 .pll_write_clk
			ddr3_pll_sharing_pll_locked                => CONNECTED_TO_ddr3_pll_sharing_pll_locked,                --                 .pll_locked
			ddr3_pll_sharing_pll_write_clk_pre_phy_clk => CONNECTED_TO_ddr3_pll_sharing_pll_write_clk_pre_phy_clk, --                 .pll_write_clk_pre_phy_clk
			ddr3_pll_sharing_pll_addr_cmd_clk          => CONNECTED_TO_ddr3_pll_sharing_pll_addr_cmd_clk,          --                 .pll_addr_cmd_clk
			ddr3_pll_sharing_pll_avl_clk               => CONNECTED_TO_ddr3_pll_sharing_pll_avl_clk,               --                 .pll_avl_clk
			ddr3_pll_sharing_pll_config_clk            => CONNECTED_TO_ddr3_pll_sharing_pll_config_clk,            --                 .pll_config_clk
			ddr3_pll_sharing_pll_mem_phy_clk           => CONNECTED_TO_ddr3_pll_sharing_pll_mem_phy_clk,           --                 .pll_mem_phy_clk
			ddr3_pll_sharing_afi_phy_clk               => CONNECTED_TO_ddr3_pll_sharing_afi_phy_clk,               --                 .afi_phy_clk
			ddr3_pll_sharing_pll_avl_phy_clk           => CONNECTED_TO_ddr3_pll_sharing_pll_avl_phy_clk,           --                 .pll_avl_phy_clk
			ddr3_status_local_init_done                => CONNECTED_TO_ddr3_status_local_init_done,                --      ddr3_status.local_init_done
			ddr3_status_local_cal_success              => CONNECTED_TO_ddr3_status_local_cal_success,              --                 .local_cal_success
			ddr3_status_local_cal_fail                 => CONNECTED_TO_ddr3_status_local_cal_fail,                 --                 .local_cal_fail
			ft232_usb_usb_data                         => CONNECTED_TO_ft232_usb_usb_data,                         --        ft232_usb.usb_data
			ft232_usb_usb_oe_n                         => CONNECTED_TO_ft232_usb_usb_oe_n,                         --                 .usb_oe_n
			ft232_usb_usb_rd_n                         => CONNECTED_TO_ft232_usb_usb_rd_n,                         --                 .usb_rd_n
			ft232_usb_usb_rxf_n                        => CONNECTED_TO_ft232_usb_usb_rxf_n,                        --                 .usb_rxf_n
			ft232_usb_usb_siwu                         => CONNECTED_TO_ft232_usb_usb_siwu,                         --                 .usb_siwu
			ft232_usb_usb_txe_n                        => CONNECTED_TO_ft232_usb_usb_txe_n,                        --                 .usb_txe_n
			ft232_usb_usb_wr_n                         => CONNECTED_TO_ft232_usb_usb_wr_n,                         --                 .usb_wr_n
			ft232_usb_usb_clock                        => CONNECTED_TO_ft232_usb_usb_clock,                        --                 .usb_clock
			memory_mem_a                               => CONNECTED_TO_memory_mem_a,                               --           memory.mem_a
			memory_mem_ba                              => CONNECTED_TO_memory_mem_ba,                              --                 .mem_ba
			memory_mem_ck                              => CONNECTED_TO_memory_mem_ck,                              --                 .mem_ck
			memory_mem_ck_n                            => CONNECTED_TO_memory_mem_ck_n,                            --                 .mem_ck_n
			memory_mem_cke                             => CONNECTED_TO_memory_mem_cke,                             --                 .mem_cke
			memory_mem_cs_n                            => CONNECTED_TO_memory_mem_cs_n,                            --                 .mem_cs_n
			memory_mem_dm                              => CONNECTED_TO_memory_mem_dm,                              --                 .mem_dm
			memory_mem_ras_n                           => CONNECTED_TO_memory_mem_ras_n,                           --                 .mem_ras_n
			memory_mem_cas_n                           => CONNECTED_TO_memory_mem_cas_n,                           --                 .mem_cas_n
			memory_mem_we_n                            => CONNECTED_TO_memory_mem_we_n,                            --                 .mem_we_n
			memory_mem_reset_n                         => CONNECTED_TO_memory_mem_reset_n,                         --                 .mem_reset_n
			memory_mem_dq                              => CONNECTED_TO_memory_mem_dq,                              --                 .mem_dq
			memory_mem_dqs                             => CONNECTED_TO_memory_mem_dqs,                             --                 .mem_dqs
			memory_mem_dqs_n                           => CONNECTED_TO_memory_mem_dqs_n,                           --                 .mem_dqs_n
			memory_mem_odt                             => CONNECTED_TO_memory_mem_odt,                             --                 .mem_odt
			oct_rzqin                                  => CONNECTED_TO_oct_rzqin,                                  --              oct.rzqin
			reset_reset_n                              => CONNECTED_TO_reset_reset_n                               --            reset.reset_n
		);

