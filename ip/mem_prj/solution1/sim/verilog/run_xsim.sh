
/opt/Xilinx_2017.1/Vivado/2017.1/bin/xelab xil_defaultlib.apatb_mem_hw_top -prj mem_hw.prj -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 --initfile "/opt/Xilinx_2017.1/Vivado/2017.1/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s mem_hw 
/opt/Xilinx_2017.1/Vivado/2017.1/bin/xsim --noieeewarnings mem_hw -tclbatch mem_hw.tcl

