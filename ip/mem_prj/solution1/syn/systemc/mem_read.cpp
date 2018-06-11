// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "mem_read.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic mem_read::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic mem_read::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<3> mem_read::ap_ST_fsm_state1 = "1";
const sc_lv<3> mem_read::ap_ST_fsm_state2 = "10";
const sc_lv<3> mem_read::ap_ST_fsm_state3 = "100";
const sc_lv<32> mem_read::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<32> mem_read::ap_const_lv32_1 = "1";
const sc_lv<32> mem_read::ap_const_lv32_2 = "10";
const sc_lv<1> mem_read::ap_const_lv1_1 = "1";
const sc_lv<1> mem_read::ap_const_lv1_0 = "0";
const bool mem_read::ap_const_boolean_1 = true;

mem_read::mem_read(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_ap_CS_fsm_state1);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state2);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_CS_fsm_state3);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm_state1 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_CS_fsm_state3 );

    SC_METHOD(thread_in_r_TDATA_blk_n);
    sensitive << ( in_r_TVALID );
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_in_r_TREADY);
    sensitive << ( in_r_TVALID );
    sensitive << ( ap_CS_fsm_state2 );

    SC_METHOD(thread_tmp_last_V_fu_58_p1);
    sensitive << ( in_r_TLAST );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );
    sensitive << ( ap_CS_fsm_state1 );
    sensitive << ( in_r_TVALID );
    sensitive << ( ap_CS_fsm_state2 );
    sensitive << ( tmp_last_V_fu_58_p1 );

    ap_CS_fsm = "001";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "mem_read_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, in_r_TDATA, "(port)in_r_TDATA");
    sc_trace(mVcdFile, in_r_TVALID, "(port)in_r_TVALID");
    sc_trace(mVcdFile, in_r_TREADY, "(port)in_r_TREADY");
    sc_trace(mVcdFile, in_r_TKEEP, "(port)in_r_TKEEP");
    sc_trace(mVcdFile, in_r_TSTRB, "(port)in_r_TSTRB");
    sc_trace(mVcdFile, in_r_TUSER, "(port)in_r_TUSER");
    sc_trace(mVcdFile, in_r_TLAST, "(port)in_r_TLAST");
    sc_trace(mVcdFile, in_r_TID, "(port)in_r_TID");
    sc_trace(mVcdFile, in_r_TDEST, "(port)in_r_TDEST");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_CS_fsm_state1, "ap_CS_fsm_state1");
    sc_trace(mVcdFile, in_r_TDATA_blk_n, "in_r_TDATA_blk_n");
    sc_trace(mVcdFile, ap_CS_fsm_state2, "ap_CS_fsm_state2");
    sc_trace(mVcdFile, tmp_last_V_fu_58_p1, "tmp_last_V_fu_58_p1");
    sc_trace(mVcdFile, ap_CS_fsm_state3, "ap_CS_fsm_state3");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

mem_read::~mem_read() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

}

void mem_read::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
}

void mem_read::thread_ap_CS_fsm_state1() {
    ap_CS_fsm_state1 = ap_CS_fsm.read()[0];
}

void mem_read::thread_ap_CS_fsm_state2() {
    ap_CS_fsm_state2 = ap_CS_fsm.read()[1];
}

void mem_read::thread_ap_CS_fsm_state3() {
    ap_CS_fsm_state3 = ap_CS_fsm.read()[2];
}

void mem_read::thread_ap_done() {
    if (((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read())) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read()))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void mem_read::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void mem_read::thread_ap_ready() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state3.read())) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void mem_read::thread_in_r_TDATA_blk_n() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        in_r_TDATA_blk_n = in_r_TVALID.read();
    } else {
        in_r_TDATA_blk_n = ap_const_logic_1;
    }
}

void mem_read::thread_in_r_TREADY() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
         esl_seteq<1,1,1>(in_r_TVALID.read(), ap_const_logic_1))) {
        in_r_TREADY = ap_const_logic_1;
    } else {
        in_r_TREADY = ap_const_logic_0;
    }
}

void mem_read::thread_tmp_last_V_fu_58_p1() {
    tmp_last_V_fu_58_p1 = in_r_TLAST.read();
}

void mem_read::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_1))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(in_r_TVALID.read(), ap_const_logic_1) && esl_seteq<1,1,1>(tmp_last_V_fu_58_p1.read(), ap_const_lv1_0))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(in_r_TVALID.read(), ap_const_logic_1) && esl_seteq<1,1,1>(tmp_last_V_fu_58_p1.read(), ap_const_lv1_1))) {
                ap_NS_fsm = ap_ST_fsm_state3;
            } else {
                ap_NS_fsm = ap_ST_fsm_state2;
            }
            break;
        case 4 : 
            ap_NS_fsm = ap_ST_fsm_state1;
            break;
        default : 
            ap_NS_fsm = "XXX";
            break;
    }
}

}

