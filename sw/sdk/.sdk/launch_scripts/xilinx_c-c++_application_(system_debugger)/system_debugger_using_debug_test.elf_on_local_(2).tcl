connect -url tcp:127.0.0.1:3121
source /home/juju/mem_io_unit_testing/sw/sdk/f_PL_10_BURST_256/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203346604A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203346604A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203346604A"} -index 0
dow /home/juju/mem_io_unit_testing/sw/sdk/test/Debug/test.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT1 210203346604A"} -index 0
con
