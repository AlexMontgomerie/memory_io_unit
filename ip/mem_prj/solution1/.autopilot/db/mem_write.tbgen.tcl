set moduleName mem_write
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mem_write}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_stream_V_data_V int 64 regular {axi_s 1 volatile  { out_r Data } }  }
	{ out_stream_V_keep_V int 8 regular {axi_s 1 volatile  { out_r Keep } }  }
	{ out_stream_V_strb_V int 8 regular {axi_s 1 volatile  { out_r Strb } }  }
	{ out_stream_V_user_V int 1 regular {axi_s 1 volatile  { out_r User } }  }
	{ out_stream_V_last_V int 1 regular {axi_s 1 volatile  { out_r Last } }  }
	{ out_stream_V_id_V int 1 regular {axi_s 1 volatile  { out_r ID } }  }
	{ out_stream_V_dest_V int 1 regular {axi_s 1 volatile  { out_r Dest } }  }
	{ mask int 32 regular  }
	{ test_init_arr_V int 64 regular {array 256 { 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_stream_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mask", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "test_init_arr_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_r_TDATA sc_out sc_lv 64 signal 0 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 6 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 6 } 
	{ out_r_TKEEP sc_out sc_lv 8 signal 1 } 
	{ out_r_TSTRB sc_out sc_lv 8 signal 2 } 
	{ out_r_TUSER sc_out sc_lv 1 signal 3 } 
	{ out_r_TLAST sc_out sc_lv 1 signal 4 } 
	{ out_r_TID sc_out sc_lv 1 signal 5 } 
	{ out_r_TDEST sc_out sc_lv 1 signal 6 } 
	{ mask sc_in sc_lv 32 signal 7 } 
	{ test_init_arr_V_address0 sc_out sc_lv 8 signal 8 } 
	{ test_init_arr_V_ce0 sc_out sc_logic 1 signal 8 } 
	{ test_init_arr_V_q0 sc_in sc_lv 64 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "out_r_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "out_r_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_user_V", "role": "default" }} , 
 	{ "name": "out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_r_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_id_V", "role": "default" }} , 
 	{ "name": "out_r_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "mask", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mask", "role": "default" }} , 
 	{ "name": "test_init_arr_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "test_init_arr_V", "role": "address0" }} , 
 	{ "name": "test_init_arr_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "test_init_arr_V", "role": "ce0" }} , 
 	{ "name": "test_init_arr_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "test_init_arr_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "mem_write",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"FunctionPipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_stream_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_stream_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_stream_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "mask", "Type" : "None", "Direction" : "I"},
			{"Name" : "test_init_arr_V", "Type" : "Memory", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	mem_write {
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_user_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_id_V {Type O LastRead -1 FirstWrite 2}
		out_stream_V_dest_V {Type O LastRead -1 FirstWrite 2}
		mask {Type I LastRead 0 FirstWrite -1}
		test_init_arr_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1048323", "Max" : "1048323"}
	, {"Name" : "Interval", "Min" : "1048323", "Max" : "1048323"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_stream_V_data_V { axis {  { out_r_TDATA out_data 1 64 } } }
	out_stream_V_keep_V { axis {  { out_r_TKEEP out_data 1 8 } } }
	out_stream_V_strb_V { axis {  { out_r_TSTRB out_data 1 8 } } }
	out_stream_V_user_V { axis {  { out_r_TUSER out_data 1 1 } } }
	out_stream_V_last_V { axis {  { out_r_TLAST out_data 1 1 } } }
	out_stream_V_id_V { axis {  { out_r_TID out_data 1 1 } } }
	out_stream_V_dest_V { axis {  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 }  { out_r_TDEST out_data 1 1 } } }
	mask { ap_none {  { mask in_data 0 32 } } }
	test_init_arr_V { ap_memory {  { test_init_arr_V_address0 mem_address 1 8 }  { test_init_arr_V_ce0 mem_ce 1 1 }  { test_init_arr_V_q0 mem_dout 0 64 } } }
}
