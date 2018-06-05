open_project -reset ram_prj
set_top ram_hw

add_files ram.cpp
add_files -tb ram_test.cpp

open_solution -reset "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 800 -name default

exit

