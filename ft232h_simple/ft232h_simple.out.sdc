## Generated SDC file "ft232h_simple.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions
## and other software and tools, and its AMPP partner logic
## functions, and any output files from any of the foregoing
## (including device programming or simulation files), and any
## associated documentation or information are expressly subject
## to the terms and conditions of the Altera Program License
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera MegaCore Function License Agreement, or other
## applicable license agreement, including, without limitation,
## that your use is for the sole purpose of programming logic
## devices manufactured by Altera and sold by Altera or its
## authorized distributors.  Please refer to the applicable
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Standard Edition"

## DATE    "Sat Apr 23 15:56:38 2016"

##
## DEVICE  "5CEFA2F23C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 33.333 -waveform { 0.000 16.666 } [get_ports {altera_reserved_tck}]
create_clock -name {sys_clk} -period 10.000 -waveform { 0.000 5.000 } [get_nets {pll_inst|pll_inst|altera_pll_i|outclk_wire[0]}]
create_clock -name {usb_clk} -period 12.500 -waveform { 0.000 6.250 } [get_ports {clock}]
create_clock -name {input_clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {usb_clk}]  0.000 [get_ports {txe_n}]
set_input_delay -add_delay -min -clock [get_clocks {usb_clk}]  9.000 [get_ports {txe_n}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[0]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[0]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[1]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[1]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[2]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[2]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[3]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[3]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[4]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[4]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[5]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[5]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[6]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[6]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {data[7]}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {data[7]}]
set_output_delay -add_delay -max -clock [get_clocks {usb_clk}]  7.500 [get_ports {wr_n}]
set_output_delay -add_delay -min -clock [get_clocks {usb_clk}]  0.000 [get_ports {wr_n}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}]


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_re9:dffpipe19|dffe20a*}]
set_false_path -from [get_keepers {*delayed_wrptr_g*}] -to [get_keepers {*rs_dgwp|dffpipe_qe9:dffpipe12|dffe13a*}]
set_false_path -from [get_keepers {*rdptr_g*}] -to [get_keepers {*ws_dgrp|dffpipe_te9:dffpipe11|dffe12a*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************
