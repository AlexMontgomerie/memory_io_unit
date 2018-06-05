############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mem_prj
set_top mem_hw
add_files mem.cpp
add_files -tb mem_test.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 800 -name default
#source "./mem_prj/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design -reduce_diskspace -compiler gcc
export_design -rtl verilog -format ip_catalog
