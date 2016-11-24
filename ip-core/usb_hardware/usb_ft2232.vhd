-- FT2232H USB Device Core with programmable interrupt and eventchar
-- Operates in FT245 Style Synchronous FIFO Mode for high speed data transfers
-- Designer: Darius Grigaitis www.grigaitis.eu  2011.03.01
-- License: Public Domain
-- VER 1.01 DEMO
-- In order to keep going this product free please donate: http://www.grigaitis.eu/?page_id=400
-- This product is free and has no free support. Use it for your own risk.



library ieee;
library altera;
use altera.altera_europa_support_lib.all;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

		
	entity usb_ft2232 is    
    generic( TX_BUFFER:integer :=512;
          USED_SIZE:integer:=8;   -- parametras FIFO isejimo dydziui apribrezti      
          RX_BUFFER:integer :=512
          );
			 port (
		-- Avalon bus signals
		signal clk : in std_logic;
		signal reset_n : in std_logic;
		signal read_n : in std_logic;
		signal write_n : in std_logic;
		signal irq : out std_logic;
		signal chipselect_n : in std_logic;
		signal address : in std_logic_vector(4 downto 0);
		signal readdata: out std_logic_vector (31 downto 0);
		signal writedata : in std_logic_vector (31 downto 0);
	   signal USED : out std_logic_vector (8 downto 0);
	
	-- FT2232 Bus Signals
		signal usb_clock : in std_logic;
		signal usb_data : inout std_logic_vector(7 downto 0);--, rx_DOUT
		signal usb_rd_n : out std_logic;
		signal usb_wr_n : out std_logic;
		signal usb_oe_n : out std_logic;
		signal usb_rxf_n : in std_logic;
		signal usb_txe_n : in std_logic
		);
end entity usb_ft2232;


ARCHITECTURE RTL OF usb_ft2232 IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL tx_wrusedw	: STD_LOGIC_VECTOR (8 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL q, tx_data, tx_q	: STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL tx_wrclk, tx_rdreq, tx_aclr, tx_rdclk, tx_wrreq, tx_rdempty, tx_wrfull, tx_wrempty, usb_wr_n_int	: STD_LOGIC ; 
    
    SIGNAL rx_wrclk, rx_rdreq, rx_aclr, rx_rdclk, rx_wrreq, rx_rdempty, rx_wrfull, rx_wrempty, 
    rx_wrreq_int, usb_oe_n_int, rx_fifo_sw : STD_LOGIC ; 
    SIGNAL rx_wrusedw	: STD_LOGIC_VECTOR (8 DOWNTO 0);
    SIGNAL rx_data, rx_q, event_char: STD_LOGIC_VECTOR (7 DOWNTO 0);    
    SIGNAL  rx_fifo_rddone, usb_rd_n_int, cnt2, cnt : STD_LOGIC := '0'; 
    
    SIGNAL delay_cnt: STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL       run_delay: STD_LOGIC := '0';    
    SIGNAL TX_STATUS_REG, RX_STATUS_REG: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
    SIGNAL GLOBAL_STATUS, CONTROL_REG:  STD_LOGIC_VECTOR(7 downto 0):=(others=>'0');    
    SIGNAL IRQ_COMPARE_REGISTER, TRANSMIT_SLICE, TRANSMIT_SLICE_COUNTER:  STD_LOGIC_VECTOR(USED_SIZE downto 0);
    SIGNAL irq_compare_reg, interrupt_clear, event_char_irg, rx_aclear, tx_aclear:  STD_LOGIC := '0';

	COMPONENT dcfifo
	GENERIC (
		intended_device_family		: STRING;
		lpm_numwords		: NATURAL;
		lpm_showahead		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthu		: NATURAL;
		overflow_checking		: STRING;
		rdsync_delaypipe		: NATURAL;
		underflow_checking		: STRING;
		use_eab		: STRING;
		write_aclr_synch		: STRING;
		wrsync_delaypipe		: NATURAL
	);
	PORT (
			wrclk	: IN STD_LOGIC ;
			rdempty	: OUT STD_LOGIC ;
			rdreq	: IN STD_LOGIC ;
			wrusedw	: OUT STD_LOGIC_VECTOR (USED_SIZE DOWNTO 0);
			aclr	: IN STD_LOGIC ;
			wrfull	: OUT STD_LOGIC ;
			wrempty	: OUT STD_LOGIC ;
			rdclk	: IN STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			wrreq	: IN STD_LOGIC ;
			data	: IN STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END COMPONENT;
	
	

BEGIN
	
	tx_dcfifo_component : dcfifo
	GENERIC MAP (
		intended_device_family => "Cyclone III",
		lpm_numwords => TX_BUFFER,
		lpm_showahead => "ON",
		lpm_type => "dcfifo",
		lpm_width => 8,
		lpm_widthu => USED_SIZE+1,
		overflow_checking => "ON",
		rdsync_delaypipe => 6,
		underflow_checking => "ON",
		use_eab => "ON",
		write_aclr_synch => "ON",
		wrsync_delaypipe => 6
	)
	PORT MAP (
		wrclk =>   tx_wrclk,
		rdreq =>   tx_rdreq,
		aclr =>    tx_aclr,
		rdclk =>   tx_rdclk,
		wrreq =>   tx_wrreq,
		data =>    tx_data, 
		rdempty => tx_rdempty,
		wrusedw => tx_wrusedw,
		wrfull =>  tx_wrfull,
		wrempty => tx_wrempty,
		q =>       tx_q  
	);
------------------  RX FIFO ------------------
	rx_dcfifo_component : dcfifo
	GENERIC MAP (
		intended_device_family => "Cyclone III",
		lpm_numwords => RX_BUFFER,
		lpm_showahead => "ON",
		lpm_type => "dcfifo",
		lpm_width => 8,
		lpm_widthu => USED_SIZE+1,
		overflow_checking => "ON",
		rdsync_delaypipe => 8,
		underflow_checking => "ON",
		use_eab => "ON",
		write_aclr_synch => "ON",
		wrsync_delaypipe => 8
	)
	PORT MAP (
		wrclk =>  rx_wrclk,
		rdreq =>  rx_rdreq,
		aclr =>   rx_aclr,
		rdclk =>  rx_rdclk,
		wrreq =>  rx_wrreq,
		data =>   rx_data, 
		rdempty =>rx_rdempty,
		wrusedw =>rx_wrusedw,
		wrfull => rx_wrfull,
		wrempty =>rx_wrempty,
		q =>      rx_q  
	);




tx_aclr<='1' when (reset_n='0' or (tx_aclear='1')) else '0'; 
USED<=tx_wrusedw;
tx_wrclk<=clk;
rx_aclr<='1' when ((reset_n='0') or (rx_aclear='1')) else '0';  
rx_rdclk<=clk;
rx_wrclk<=usb_clock;

    
       process(usb_clock, reset_n)
		begin		
        if reset_n = '0' then
        cnt2<='0';    
         usb_rd_n_int<='1';
         usb_oe_n_int<='1';
        elsif rising_edge(usb_clock) then	 
        
         if (usb_rxf_n='0' and rx_wrfull='0' and  usb_wr_n_int='1') then              
            if cnt2='0' then    usb_oe_n_int<='0'; end if;          
            if cnt2='1' then
            usb_rd_n_int<='0';
            else
            cnt2<='1';
            end if;         
         else
           cnt2<='0';    
           usb_oe_n_int<='1';
           usb_rd_n_int<='1';
         end if;       
        
        end if;       
       end process;
       
       process(usb_clock,reset_n)
       begin
         if reset_n = '0' then
          rx_wrreq_int<='1';
        elsif falling_edge(usb_clock) then 
		   if ((usb_rd_n_int='0') and usb_rxf_n='0') then 		     
		     rx_wrreq_int<='0'; -- atsinesam tarpny kintama
		     else
		     rx_wrreq_int<='1';
		   end if;
         end if;
       end process;
          
          
  usb_oe_n<=  usb_oe_n_int;
  rx_wrreq<='1' when ( rx_wrreq_int='0' and rx_wrfull='0' ) else '0';     
  usb_rd_n<=(usb_rd_n_int); 
  rx_data<=usb_data when usb_rd_n_int<='0'  else (others => 'Z');
  event_char_irg<='1' when rx_data=event_char else '0'; 
  tx_rdclk<=usb_clock;
  usb_data <= tx_q when usb_wr_n_int = '0' else (others => 'Z');
  process(usb_clock, reset_n, usb_txe_n, tx_rdempty)
		begin
		if reset_n = '0' then   
         cnt<='0';
         usb_wr_n_int<='1';
         TRANSMIT_SLICE_COUNTER<=(others=>'0');
         delay_cnt<=(others=>'0');
           run_delay<='0';
        elsif rising_edge(usb_clock) then	     
          if   run_delay='1' then   
             if delay_cnt<"11" then
                    delay_cnt<=delay_cnt+1; 
              else 
                    run_delay<='0';         
             end if;  
         end if;      

  if (usb_txe_n='0' and tx_rdempty='0' and usb_oe_n_int='1' and run_delay='0') then  
   
          if cnt='1' then  
				if (TRANSMIT_SLICE>0) then
				if (TRANSMIT_SLICE_COUNTER<TRANSMIT_SLICE) then
				TRANSMIT_SLICE_COUNTER<=TRANSMIT_SLICE_COUNTER+1;
				else
				delay_cnt<=(others=>'0');
				run_delay<='1';
				end if;
                else
          TRANSMIT_SLICE_COUNTER<=(others=>'0');
           delay_cnt<=(others=>'0');
         run_delay<='0';
         end if; 
       usb_wr_n_int<='0';
         else
         cnt<='1';
         end if;      
         else          
         cnt<='0';
         usb_wr_n_int<='1';
         TRANSMIT_SLICE_COUNTER<=(others=>'0');
           end if;  
        end if;
      end process;
      
   usb_wr_n<='0' when  (usb_wr_n_int='0' and tx_rdempty='0') else '1';
   tx_rdreq<='1' when  (usb_wr_n_int='0' and tx_rdempty='0') else '0';       
	
 
   TX_STATUS_REG(USED_SIZE downto 0)<=tx_wrusedw;
   RX_STATUS_REG(USED_SIZE downto 0)<=rx_wrusedw; 
   GLOBAL_STATUS(0)<=tx_wrfull;  
   GLOBAL_STATUS(1)<=tx_wrempty;  
   GLOBAL_STATUS(4)<=rx_wrfull; 
   GLOBAL_STATUS(5)<=rx_wrempty;
   
   
  
   process(clk, reset_n,RX_STATUS_REG)
   begin
   
   if (reset_n='0'  or interrupt_clear='1') then
   GLOBAL_STATUS(7)<='0';
    GLOBAL_STATUS(6)<='1';
   irq_compare_reg<='0';
   elsif rising_edge(clk)then
     
   if ((IRQ_COMPARE_REGISTER<=RX_STATUS_REG) and (CONTROL_REG(0)='1')) then
	irq_compare_reg<='1';   
     end if;   
     if (tx_wrfull='1' and CONTROL_REG(1)='1' ) then 
      irq_compare_reg<='1';   
     end if;
     if (rx_wrfull='1' and CONTROL_REG(2)='1' ) then
      irq_compare_reg<='1';   
     end if;      
     
     if (event_char_irg='1' and CONTROL_REG(3)='1' ) then 
      irq_compare_reg<='1';  
       GLOBAL_STATUS(7)<='1';  
     end if;  
     
      if (rx_rdempty='0' and CONTROL_REG(4)='1' ) then 
      irq_compare_reg<='1';  
     GLOBAL_STATUS(6)<='1';  
     end if; 
    
   end if;  
   end process;   
   
 irq <= (irq_compare_reg);

	  process(clk, reset_n)
		begin
		if reset_n = '0' then
			tx_data <= (others=>'0');
			tx_wrreq <= '0';
			rx_rdreq<='0';
			rx_fifo_sw<='0';	
			event_char<= (others=>'0');
			interrupt_clear <='0';
			CONTROL_REG<=(others=>'0');
			IRQ_COMPARE_REGISTER<=(others=>'0');
			TRANSMIT_SLICE<=(others=>'0');
			  -- CNT3<="00";	
		elsif rising_edge(clk) then	
		
		if (address = "000000" and write_n='0'and chipselect_n='0') then 
		    tx_data <= writedata(7 downto 0);
		    tx_wrreq <= '1';
		else
		    tx_wrreq <= '0';
		end if;
				
		
		if (address = "000111" and write_n='0' and chipselect_n='0') then -- 
		   IRQ_COMPARE_REGISTER <= writedata(USED_SIZE downto 0); end if;
		
		if (address = "001000" and write_n='0' and chipselect_n='0') then -- 
		   event_char <= writedata(7 downto 0); 
		end if;
		
			interrupt_clear <='0';
		if (address = "001001" and write_n='0' and chipselect_n='0') then -- 
		   interrupt_clear <='1';	
		end if;
		
		
		if (address = "001010" and write_n='0' and chipselect_n='0') then --  
		   CONTROL_REG <=writedata(7 downto 0); --
		end if; 
        rx_aclear<='0';
		  tx_aclear<='0';
         
        if (address = "001011" and write_n='0' and chipselect_n='0') then -- 		   
		   tx_aclear<=writedata(0); 
		   rx_aclear<=writedata(1);
			   
		end if;
		
		 if (address = "001100" and write_n='0' and chipselect_n='0') then 		   
		  TRANSMIT_SLICE<=writedata(USED_SIZE downto 0); 			   
		end if;
		
		
	    if (address = "000010" and read_n='0'and chipselect_n='0') then--  
	       readdata<=TX_BUFFER-TX_STATUS_REG;
		end if;
		
	    if (address = "000011" and read_n='0'and chipselect_n='0') then
	       readdata<= RX_STATUS_REG;
		end if;
				
		if (address = "000100" and read_n='0'and chipselect_n='0') then --
	       readdata(0)<=not(tx_wrfull);-- STATUS_REG1; -- Nuskaitom tx_wrfull statuso bita
	       readdata(31 downto 1)<=(others=>'0');
		end if;
		
		if (address = "000101" and read_n='0'and chipselect_n='0') then --
	       readdata(0)<=not(rx_wrempty);
	       readdata(31 downto 1)<=(others=>'0');
		end if;
		
		if (address = "000110" and read_n='0'and chipselect_n='0') then  --
	       readdata(7 downto 0)<=GLOBAL_STATUS(7 downto 0);
	       readdata(31 downto 8)<=(others=>'0');
		end if;

		 
		 if (address = "000001" and read_n='0'and chipselect_n='0') then  
		   readdata(7 downto 0) <= rx_q(7 downto 0);
		     if (rx_fifo_rddone ='0') then
		    rx_fifo_rddone <= '1';		 
		    rx_rdreq<='1';		
		   else		 
		    rx_rdreq<='0';	
		    rx_fifo_rddone <= '0';		  
		    rx_fifo_sw<='1';		
    	  end if;
		end if;
      
    	end if;
		end process;
		
		


END RTL;


