open_project -reset mem_prj
set_top mem_hw

add_files mem.cpp
add_files -tb mem_test.cpp

open_solution -reset "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 800 -name default

exit

