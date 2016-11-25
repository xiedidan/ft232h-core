onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ft232h_simple_tb/txe_n
add wave -noupdate /ft232h_simple_tb/clock
add wave -noupdate /ft232h_simple_tb/wr_n
add wave -noupdate /ft232h_simple_tb/data
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_fifo_rd
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_q
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_fifo_empty
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_fifo_wr
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_fifo_full
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_rdusedw
add wave -noupdate /ft232h_simple_tb/simple_inst/ft232h_inst/tx_wrusedw
add wave -noupdate /ft232h_simple_tb/counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {132044981 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 338
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {265112576 ps}
