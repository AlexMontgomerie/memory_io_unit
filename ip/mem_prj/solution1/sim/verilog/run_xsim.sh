
/opt/Xilinx_tools/Vivado/2017.4/bin/xelab xil_defaultlib.apatb_mem_hw_top glbl -prj mem_hw.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver --initfile "/opt/Xilinx_tools/Vivado/2017.4/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s mem_hw 
/opt/Xilinx_tools/Vivado/2017.4/bin/xsim --noieeewarnings mem_hw -tclbatch mem_hw.tcl

