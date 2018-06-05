// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mem_write (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        out_r_TDATA,
        out_r_TVALID,
        out_r_TREADY,
        out_r_TKEEP,
        out_r_TSTRB,
        out_r_TUSER,
        out_r_TLAST,
        out_r_TID,
        out_r_TDEST,
        mask,
        test_init_arr_V_address0,
        test_init_arr_V_ce0,
        test_init_arr_V_q0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [63:0] out_r_TDATA;
output   out_r_TVALID;
input   out_r_TREADY;
output  [7:0] out_r_TKEEP;
output  [7:0] out_r_TSTRB;
output  [0:0] out_r_TUSER;
output  [0:0] out_r_TLAST;
output  [0:0] out_r_TID;
output  [0:0] out_r_TDEST;
input  [31:0] mask;
output  [7:0] test_init_arr_V_address0;
output   test_init_arr_V_ce0;
input  [63:0] test_init_arr_V_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg test_init_arr_V_ce0;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [63:0] out_stream_V_data_V_1_data_out;
reg    out_stream_V_data_V_1_vld_in;
wire    out_stream_V_data_V_1_vld_out;
wire    out_stream_V_data_V_1_ack_in;
wire    out_stream_V_data_V_1_ack_out;
reg   [63:0] out_stream_V_data_V_1_payload_A;
reg   [63:0] out_stream_V_data_V_1_payload_B;
reg    out_stream_V_data_V_1_sel_rd;
reg    out_stream_V_data_V_1_sel_wr;
wire    out_stream_V_data_V_1_sel;
wire    out_stream_V_data_V_1_load_A;
wire    out_stream_V_data_V_1_load_B;
reg   [1:0] out_stream_V_data_V_1_state;
wire    out_stream_V_data_V_1_state_cmp_full;
wire   [7:0] out_stream_V_keep_V_1_data_out;
reg    out_stream_V_keep_V_1_vld_in;
wire    out_stream_V_keep_V_1_vld_out;
wire    out_stream_V_keep_V_1_ack_in;
wire    out_stream_V_keep_V_1_ack_out;
reg    out_stream_V_keep_V_1_sel_rd;
wire    out_stream_V_keep_V_1_sel;
reg   [1:0] out_stream_V_keep_V_1_state;
wire   [7:0] out_stream_V_strb_V_1_data_out;
reg    out_stream_V_strb_V_1_vld_in;
wire    out_stream_V_strb_V_1_vld_out;
wire    out_stream_V_strb_V_1_ack_in;
wire    out_stream_V_strb_V_1_ack_out;
reg    out_stream_V_strb_V_1_sel_rd;
wire    out_stream_V_strb_V_1_sel;
reg   [1:0] out_stream_V_strb_V_1_state;
reg   [0:0] out_stream_V_user_V_1_data_out;
reg    out_stream_V_user_V_1_vld_in;
wire    out_stream_V_user_V_1_vld_out;
wire    out_stream_V_user_V_1_ack_in;
wire    out_stream_V_user_V_1_ack_out;
reg   [0:0] out_stream_V_user_V_1_payload_A;
reg   [0:0] out_stream_V_user_V_1_payload_B;
reg    out_stream_V_user_V_1_sel_rd;
reg    out_stream_V_user_V_1_sel_wr;
wire    out_stream_V_user_V_1_sel;
wire    out_stream_V_user_V_1_load_A;
wire    out_stream_V_user_V_1_load_B;
reg   [1:0] out_stream_V_user_V_1_state;
wire    out_stream_V_user_V_1_state_cmp_full;
reg   [0:0] out_stream_V_last_V_1_data_out;
reg    out_stream_V_last_V_1_vld_in;
wire    out_stream_V_last_V_1_vld_out;
wire    out_stream_V_last_V_1_ack_in;
wire    out_stream_V_last_V_1_ack_out;
reg   [0:0] out_stream_V_last_V_1_payload_A;
reg   [0:0] out_stream_V_last_V_1_payload_B;
reg    out_stream_V_last_V_1_sel_rd;
reg    out_stream_V_last_V_1_sel_wr;
wire    out_stream_V_last_V_1_sel;
wire    out_stream_V_last_V_1_load_A;
wire    out_stream_V_last_V_1_load_B;
reg   [1:0] out_stream_V_last_V_1_state;
wire    out_stream_V_last_V_1_state_cmp_full;
wire   [0:0] out_stream_V_id_V_1_data_out;
reg    out_stream_V_id_V_1_vld_in;
wire    out_stream_V_id_V_1_vld_out;
wire    out_stream_V_id_V_1_ack_in;
wire    out_stream_V_id_V_1_ack_out;
reg    out_stream_V_id_V_1_sel_rd;
wire    out_stream_V_id_V_1_sel;
reg   [1:0] out_stream_V_id_V_1_state;
wire   [0:0] out_stream_V_dest_V_1_data_out;
reg    out_stream_V_dest_V_1_vld_in;
wire    out_stream_V_dest_V_1_vld_out;
wire    out_stream_V_dest_V_1_ack_in;
wire    out_stream_V_dest_V_1_ack_out;
reg    out_stream_V_dest_V_1_sel_rd;
wire    out_stream_V_dest_V_1_sel;
reg   [1:0] out_stream_V_dest_V_1_state;
reg    out_r_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_flatten_reg_277;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] ap_reg_pp0_iter1_exitcond_flatten_reg_277;
reg   [19:0] indvar_flatten_reg_139;
reg   [11:0] i_reg_150;
reg   [0:0] tmp_user_V_reg_161;
reg   [8:0] j_reg_176;
wire  signed [63:0] tmp_fu_187_p1;
reg  signed [63:0] tmp_reg_272;
wire   [0:0] exitcond_flatten_fu_191_p2;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_11001;
wire   [19:0] indvar_flatten_next_fu_197_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [11:0] tmp_1_mid2_v_v_fu_223_p3;
reg   [11:0] tmp_1_mid2_v_v_reg_286;
wire   [0:0] tmp_last_V_fu_249_p2;
reg   [0:0] tmp_last_V_reg_291;
wire   [8:0] j_1_fu_260_p2;
wire   [63:0] axi_data_V_fu_266_p2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg   [11:0] ap_phi_mux_i_phi_fu_154_p4;
reg   [0:0] ap_phi_mux_tmp_user_V_phi_fu_167_p4;
wire   [63:0] tmp_5_fu_255_p1;
wire    ap_block_pp0_stage0_01001;
wire   [0:0] exitcond6_fu_203_p2;
wire   [11:0] i_s_fu_217_p2;
wire   [8:0] j_mid2_fu_209_p3;
wire   [19:0] j_cast3_fu_239_p1;
wire   [19:0] tmp_1_mid2_fu_231_p3;
wire   [19:0] tmp_3_fu_243_p2;
wire    ap_CS_fsm_state5;
reg    ap_block_state5;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 out_stream_V_data_V_1_sel_rd = 1'b0;
#0 out_stream_V_data_V_1_sel_wr = 1'b0;
#0 out_stream_V_data_V_1_state = 2'd0;
#0 out_stream_V_keep_V_1_sel_rd = 1'b0;
#0 out_stream_V_keep_V_1_state = 2'd0;
#0 out_stream_V_strb_V_1_sel_rd = 1'b0;
#0 out_stream_V_strb_V_1_state = 2'd0;
#0 out_stream_V_user_V_1_sel_rd = 1'b0;
#0 out_stream_V_user_V_1_sel_wr = 1'b0;
#0 out_stream_V_user_V_1_state = 2'd0;
#0 out_stream_V_last_V_1_sel_rd = 1'b0;
#0 out_stream_V_last_V_1_sel_wr = 1'b0;
#0 out_stream_V_last_V_1_state = 2'd0;
#0 out_stream_V_id_V_1_sel_rd = 1'b0;
#0 out_stream_V_id_V_1_state = 2'd0;
#0 out_stream_V_dest_V_1_sel_rd = 1'b0;
#0 out_stream_V_dest_V_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_data_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_data_V_1_ack_out == 1'b1) & (out_stream_V_data_V_1_vld_out == 1'b1))) begin
            out_stream_V_data_V_1_sel_rd <= ~out_stream_V_data_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_data_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_V_data_V_1_ack_in == 1'b1) & (out_stream_V_data_V_1_vld_in == 1'b1))) begin
            out_stream_V_data_V_1_sel_wr <= ~out_stream_V_data_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_data_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_data_V_1_state == 2'd2) & (out_stream_V_data_V_1_vld_in == 1'b0)) | ((out_stream_V_data_V_1_state == 2'd3) & (out_stream_V_data_V_1_vld_in == 1'b0) & (out_stream_V_data_V_1_ack_out == 1'b1)))) begin
            out_stream_V_data_V_1_state <= 2'd2;
        end else if ((((out_stream_V_data_V_1_state == 2'd1) & (out_stream_V_data_V_1_ack_out == 1'b0)) | ((out_stream_V_data_V_1_state == 2'd3) & (out_stream_V_data_V_1_ack_out == 1'b0) & (out_stream_V_data_V_1_vld_in == 1'b1)))) begin
            out_stream_V_data_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_data_V_1_vld_in == 1'b0) & (out_stream_V_data_V_1_ack_out == 1'b1)) & ~((out_stream_V_data_V_1_ack_out == 1'b0) & (out_stream_V_data_V_1_vld_in == 1'b1)) & (out_stream_V_data_V_1_state == 2'd3)) | ((out_stream_V_data_V_1_state == 2'd1) & (out_stream_V_data_V_1_ack_out == 1'b1)) | ((out_stream_V_data_V_1_state == 2'd2) & (out_stream_V_data_V_1_vld_in == 1'b1)))) begin
            out_stream_V_data_V_1_state <= 2'd3;
        end else begin
            out_stream_V_data_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_dest_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_dest_V_1_ack_out == 1'b1) & (out_stream_V_dest_V_1_vld_out == 1'b1))) begin
            out_stream_V_dest_V_1_sel_rd <= ~out_stream_V_dest_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_dest_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_dest_V_1_state == 2'd2) & (out_stream_V_dest_V_1_vld_in == 1'b0)) | ((out_stream_V_dest_V_1_state == 2'd3) & (out_stream_V_dest_V_1_vld_in == 1'b0) & (out_stream_V_dest_V_1_ack_out == 1'b1)))) begin
            out_stream_V_dest_V_1_state <= 2'd2;
        end else if ((((out_stream_V_dest_V_1_state == 2'd1) & (out_stream_V_dest_V_1_ack_out == 1'b0)) | ((out_stream_V_dest_V_1_state == 2'd3) & (out_stream_V_dest_V_1_ack_out == 1'b0) & (out_stream_V_dest_V_1_vld_in == 1'b1)))) begin
            out_stream_V_dest_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_dest_V_1_vld_in == 1'b0) & (out_stream_V_dest_V_1_ack_out == 1'b1)) & ~((out_stream_V_dest_V_1_ack_out == 1'b0) & (out_stream_V_dest_V_1_vld_in == 1'b1)) & (out_stream_V_dest_V_1_state == 2'd3)) | ((out_stream_V_dest_V_1_state == 2'd1) & (out_stream_V_dest_V_1_ack_out == 1'b1)) | ((out_stream_V_dest_V_1_state == 2'd2) & (out_stream_V_dest_V_1_vld_in == 1'b1)))) begin
            out_stream_V_dest_V_1_state <= 2'd3;
        end else begin
            out_stream_V_dest_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_id_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_id_V_1_ack_out == 1'b1) & (out_stream_V_id_V_1_vld_out == 1'b1))) begin
            out_stream_V_id_V_1_sel_rd <= ~out_stream_V_id_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_id_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_id_V_1_state == 2'd2) & (out_stream_V_id_V_1_vld_in == 1'b0)) | ((out_stream_V_id_V_1_state == 2'd3) & (out_stream_V_id_V_1_vld_in == 1'b0) & (out_stream_V_id_V_1_ack_out == 1'b1)))) begin
            out_stream_V_id_V_1_state <= 2'd2;
        end else if ((((out_stream_V_id_V_1_state == 2'd1) & (out_stream_V_id_V_1_ack_out == 1'b0)) | ((out_stream_V_id_V_1_state == 2'd3) & (out_stream_V_id_V_1_ack_out == 1'b0) & (out_stream_V_id_V_1_vld_in == 1'b1)))) begin
            out_stream_V_id_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_id_V_1_vld_in == 1'b0) & (out_stream_V_id_V_1_ack_out == 1'b1)) & ~((out_stream_V_id_V_1_ack_out == 1'b0) & (out_stream_V_id_V_1_vld_in == 1'b1)) & (out_stream_V_id_V_1_state == 2'd3)) | ((out_stream_V_id_V_1_state == 2'd1) & (out_stream_V_id_V_1_ack_out == 1'b1)) | ((out_stream_V_id_V_1_state == 2'd2) & (out_stream_V_id_V_1_vld_in == 1'b1)))) begin
            out_stream_V_id_V_1_state <= 2'd3;
        end else begin
            out_stream_V_id_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_keep_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_keep_V_1_ack_out == 1'b1) & (out_stream_V_keep_V_1_vld_out == 1'b1))) begin
            out_stream_V_keep_V_1_sel_rd <= ~out_stream_V_keep_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_keep_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_keep_V_1_state == 2'd2) & (out_stream_V_keep_V_1_vld_in == 1'b0)) | ((out_stream_V_keep_V_1_state == 2'd3) & (out_stream_V_keep_V_1_vld_in == 1'b0) & (out_stream_V_keep_V_1_ack_out == 1'b1)))) begin
            out_stream_V_keep_V_1_state <= 2'd2;
        end else if ((((out_stream_V_keep_V_1_state == 2'd1) & (out_stream_V_keep_V_1_ack_out == 1'b0)) | ((out_stream_V_keep_V_1_state == 2'd3) & (out_stream_V_keep_V_1_ack_out == 1'b0) & (out_stream_V_keep_V_1_vld_in == 1'b1)))) begin
            out_stream_V_keep_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_keep_V_1_vld_in == 1'b0) & (out_stream_V_keep_V_1_ack_out == 1'b1)) & ~((out_stream_V_keep_V_1_ack_out == 1'b0) & (out_stream_V_keep_V_1_vld_in == 1'b1)) & (out_stream_V_keep_V_1_state == 2'd3)) | ((out_stream_V_keep_V_1_state == 2'd1) & (out_stream_V_keep_V_1_ack_out == 1'b1)) | ((out_stream_V_keep_V_1_state == 2'd2) & (out_stream_V_keep_V_1_vld_in == 1'b1)))) begin
            out_stream_V_keep_V_1_state <= 2'd3;
        end else begin
            out_stream_V_keep_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_last_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_last_V_1_ack_out == 1'b1) & (out_stream_V_last_V_1_vld_out == 1'b1))) begin
            out_stream_V_last_V_1_sel_rd <= ~out_stream_V_last_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_last_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_V_last_V_1_ack_in == 1'b1) & (out_stream_V_last_V_1_vld_in == 1'b1))) begin
            out_stream_V_last_V_1_sel_wr <= ~out_stream_V_last_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_last_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_last_V_1_state == 2'd2) & (out_stream_V_last_V_1_vld_in == 1'b0)) | ((out_stream_V_last_V_1_state == 2'd3) & (out_stream_V_last_V_1_vld_in == 1'b0) & (out_stream_V_last_V_1_ack_out == 1'b1)))) begin
            out_stream_V_last_V_1_state <= 2'd2;
        end else if ((((out_stream_V_last_V_1_state == 2'd1) & (out_stream_V_last_V_1_ack_out == 1'b0)) | ((out_stream_V_last_V_1_state == 2'd3) & (out_stream_V_last_V_1_ack_out == 1'b0) & (out_stream_V_last_V_1_vld_in == 1'b1)))) begin
            out_stream_V_last_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_last_V_1_vld_in == 1'b0) & (out_stream_V_last_V_1_ack_out == 1'b1)) & ~((out_stream_V_last_V_1_ack_out == 1'b0) & (out_stream_V_last_V_1_vld_in == 1'b1)) & (out_stream_V_last_V_1_state == 2'd3)) | ((out_stream_V_last_V_1_state == 2'd1) & (out_stream_V_last_V_1_ack_out == 1'b1)) | ((out_stream_V_last_V_1_state == 2'd2) & (out_stream_V_last_V_1_vld_in == 1'b1)))) begin
            out_stream_V_last_V_1_state <= 2'd3;
        end else begin
            out_stream_V_last_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_strb_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_strb_V_1_ack_out == 1'b1) & (out_stream_V_strb_V_1_vld_out == 1'b1))) begin
            out_stream_V_strb_V_1_sel_rd <= ~out_stream_V_strb_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_strb_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_strb_V_1_state == 2'd2) & (out_stream_V_strb_V_1_vld_in == 1'b0)) | ((out_stream_V_strb_V_1_state == 2'd3) & (out_stream_V_strb_V_1_vld_in == 1'b0) & (out_stream_V_strb_V_1_ack_out == 1'b1)))) begin
            out_stream_V_strb_V_1_state <= 2'd2;
        end else if ((((out_stream_V_strb_V_1_state == 2'd1) & (out_stream_V_strb_V_1_ack_out == 1'b0)) | ((out_stream_V_strb_V_1_state == 2'd3) & (out_stream_V_strb_V_1_ack_out == 1'b0) & (out_stream_V_strb_V_1_vld_in == 1'b1)))) begin
            out_stream_V_strb_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_strb_V_1_vld_in == 1'b0) & (out_stream_V_strb_V_1_ack_out == 1'b1)) & ~((out_stream_V_strb_V_1_ack_out == 1'b0) & (out_stream_V_strb_V_1_vld_in == 1'b1)) & (out_stream_V_strb_V_1_state == 2'd3)) | ((out_stream_V_strb_V_1_state == 2'd1) & (out_stream_V_strb_V_1_ack_out == 1'b1)) | ((out_stream_V_strb_V_1_state == 2'd2) & (out_stream_V_strb_V_1_vld_in == 1'b1)))) begin
            out_stream_V_strb_V_1_state <= 2'd3;
        end else begin
            out_stream_V_strb_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_user_V_1_sel_rd <= 1'b0;
    end else begin
        if (((out_stream_V_user_V_1_ack_out == 1'b1) & (out_stream_V_user_V_1_vld_out == 1'b1))) begin
            out_stream_V_user_V_1_sel_rd <= ~out_stream_V_user_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_user_V_1_sel_wr <= 1'b0;
    end else begin
        if (((out_stream_V_user_V_1_ack_in == 1'b1) & (out_stream_V_user_V_1_vld_in == 1'b1))) begin
            out_stream_V_user_V_1_sel_wr <= ~out_stream_V_user_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_stream_V_user_V_1_state <= 2'd0;
    end else begin
        if ((((out_stream_V_user_V_1_state == 2'd2) & (out_stream_V_user_V_1_vld_in == 1'b0)) | ((out_stream_V_user_V_1_state == 2'd3) & (out_stream_V_user_V_1_vld_in == 1'b0) & (out_stream_V_user_V_1_ack_out == 1'b1)))) begin
            out_stream_V_user_V_1_state <= 2'd2;
        end else if ((((out_stream_V_user_V_1_state == 2'd1) & (out_stream_V_user_V_1_ack_out == 1'b0)) | ((out_stream_V_user_V_1_state == 2'd3) & (out_stream_V_user_V_1_ack_out == 1'b0) & (out_stream_V_user_V_1_vld_in == 1'b1)))) begin
            out_stream_V_user_V_1_state <= 2'd1;
        end else if (((~((out_stream_V_user_V_1_vld_in == 1'b0) & (out_stream_V_user_V_1_ack_out == 1'b1)) & ~((out_stream_V_user_V_1_ack_out == 1'b0) & (out_stream_V_user_V_1_vld_in == 1'b1)) & (out_stream_V_user_V_1_state == 2'd3)) | ((out_stream_V_user_V_1_state == 2'd1) & (out_stream_V_user_V_1_ack_out == 1'b1)) | ((out_stream_V_user_V_1_state == 2'd2) & (out_stream_V_user_V_1_vld_in == 1'b1)))) begin
            out_stream_V_user_V_1_state <= 2'd3;
        end else begin
            out_stream_V_user_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_150 <= tmp_1_mid2_v_v_reg_286;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_150 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_fu_191_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_139 <= indvar_flatten_next_fu_197_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_139 <= 20'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_fu_191_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_reg_176 <= j_1_fu_260_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_reg_176 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_reg_pp0_iter1_exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        tmp_user_V_reg_161 <= 1'd0;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_user_V_reg_161 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_reg_pp0_iter1_exitcond_flatten_reg_277 <= exitcond_flatten_reg_277;
        exitcond_flatten_reg_277 <= exitcond_flatten_fu_191_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_data_V_1_load_A == 1'b1)) begin
        out_stream_V_data_V_1_payload_A <= axi_data_V_fu_266_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_data_V_1_load_B == 1'b1)) begin
        out_stream_V_data_V_1_payload_B <= axi_data_V_fu_266_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_last_V_1_load_A == 1'b1)) begin
        out_stream_V_last_V_1_payload_A <= tmp_last_V_reg_291;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_last_V_1_load_B == 1'b1)) begin
        out_stream_V_last_V_1_payload_B <= tmp_last_V_reg_291;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_user_V_1_load_A == 1'b1)) begin
        out_stream_V_user_V_1_payload_A <= ap_phi_mux_tmp_user_V_phi_fu_167_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((out_stream_V_user_V_1_load_B == 1'b1)) begin
        out_stream_V_user_V_1_payload_B <= ap_phi_mux_tmp_user_V_phi_fu_167_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_fu_191_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_1_mid2_v_v_reg_286 <= tmp_1_mid2_v_v_fu_223_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_fu_191_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_reg_291 <= tmp_last_V_fu_249_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_reg_272 <= tmp_fu_187_p1;
    end
end

always @ (*) begin
    if ((exitcond_flatten_fu_191_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((~((out_stream_V_keep_V_1_ack_in == 1'b0) | (out_stream_V_dest_V_1_ack_in == 1'b0) | (out_stream_V_id_V_1_ack_in == 1'b0) | (out_stream_V_data_V_1_ack_in == 1'b0) | (out_stream_V_last_V_1_ack_in == 1'b0) | (out_stream_V_user_V_1_ack_in == 1'b0) | (out_stream_V_strb_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state5)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_i_phi_fu_154_p4 = tmp_1_mid2_v_v_reg_286;
    end else begin
        ap_phi_mux_i_phi_fu_154_p4 = i_reg_150;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_reg_pp0_iter1_exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_tmp_user_V_phi_fu_167_p4 = 1'd0;
    end else begin
        ap_phi_mux_tmp_user_V_phi_fu_167_p4 = tmp_user_V_reg_161;
    end
end

always @ (*) begin
    if ((~((out_stream_V_keep_V_1_ack_in == 1'b0) | (out_stream_V_dest_V_1_ack_in == 1'b0) | (out_stream_V_id_V_1_ack_in == 1'b0) | (out_stream_V_data_V_1_ack_in == 1'b0) | (out_stream_V_last_V_1_ack_in == 1'b0) | (out_stream_V_user_V_1_ack_in == 1'b0) | (out_stream_V_strb_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_reg_pp0_iter1_exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        out_r_TDATA_blk_n = out_stream_V_data_V_1_state[1'd1];
    end else begin
        out_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((out_stream_V_data_V_1_sel == 1'b1)) begin
        out_stream_V_data_V_1_data_out = out_stream_V_data_V_1_payload_B;
    end else begin
        out_stream_V_data_V_1_data_out = out_stream_V_data_V_1_payload_A;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_data_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_data_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_dest_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_dest_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_id_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_id_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_keep_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_keep_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_V_last_V_1_sel == 1'b1)) begin
        out_stream_V_last_V_1_data_out = out_stream_V_last_V_1_payload_B;
    end else begin
        out_stream_V_last_V_1_data_out = out_stream_V_last_V_1_payload_A;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_last_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_last_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_strb_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_strb_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_V_user_V_1_sel == 1'b1)) begin
        out_stream_V_user_V_1_data_out = out_stream_V_user_V_1_payload_B;
    end else begin
        out_stream_V_user_V_1_data_out = out_stream_V_user_V_1_payload_A;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten_reg_277 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_V_user_V_1_vld_in = 1'b1;
    end else begin
        out_stream_V_user_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        test_init_arr_V_ce0 = 1'b1;
    end else begin
        test_init_arr_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten_fu_191_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten_fu_191_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            if ((~((out_stream_V_keep_V_1_ack_in == 1'b0) | (out_stream_V_dest_V_1_ack_in == 1'b0) | (out_stream_V_id_V_1_ack_in == 1'b0) | (out_stream_V_data_V_1_ack_in == 1'b0) | (out_stream_V_last_V_1_ack_in == 1'b0) | (out_stream_V_user_V_1_ack_in == 1'b0) | (out_stream_V_strb_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state4_io)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((exitcond_flatten_reg_277 == 1'd0) & (out_stream_V_data_V_1_ack_in == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_io = ((ap_reg_pp0_iter1_exitcond_flatten_reg_277 == 1'd0) & (out_stream_V_data_V_1_ack_in == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5 = ((out_stream_V_keep_V_1_ack_in == 1'b0) | (out_stream_V_dest_V_1_ack_in == 1'b0) | (out_stream_V_id_V_1_ack_in == 1'b0) | (out_stream_V_data_V_1_ack_in == 1'b0) | (out_stream_V_last_V_1_ack_in == 1'b0) | (out_stream_V_user_V_1_ack_in == 1'b0) | (out_stream_V_strb_V_1_ack_in == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign axi_data_V_fu_266_p2 = (tmp_reg_272 & test_init_arr_V_q0);

assign exitcond6_fu_203_p2 = ((j_reg_176 == 9'd256) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_191_p2 = ((indvar_flatten_reg_139 == 20'd1048320) ? 1'b1 : 1'b0);

assign i_s_fu_217_p2 = (ap_phi_mux_i_phi_fu_154_p4 + 12'd1);

assign indvar_flatten_next_fu_197_p2 = (indvar_flatten_reg_139 + 20'd1);

assign j_1_fu_260_p2 = (j_mid2_fu_209_p3 + 9'd1);

assign j_cast3_fu_239_p1 = j_mid2_fu_209_p3;

assign j_mid2_fu_209_p3 = ((exitcond6_fu_203_p2[0:0] === 1'b1) ? 9'd0 : j_reg_176);

assign out_r_TDATA = out_stream_V_data_V_1_data_out;

assign out_r_TDEST = out_stream_V_dest_V_1_data_out;

assign out_r_TID = out_stream_V_id_V_1_data_out;

assign out_r_TKEEP = out_stream_V_keep_V_1_data_out;

assign out_r_TLAST = out_stream_V_last_V_1_data_out;

assign out_r_TSTRB = out_stream_V_strb_V_1_data_out;

assign out_r_TUSER = out_stream_V_user_V_1_data_out;

assign out_r_TVALID = out_stream_V_dest_V_1_state[1'd0];

assign out_stream_V_data_V_1_ack_in = out_stream_V_data_V_1_state[1'd1];

assign out_stream_V_data_V_1_ack_out = out_r_TREADY;

assign out_stream_V_data_V_1_load_A = (out_stream_V_data_V_1_state_cmp_full & ~out_stream_V_data_V_1_sel_wr);

assign out_stream_V_data_V_1_load_B = (out_stream_V_data_V_1_state_cmp_full & out_stream_V_data_V_1_sel_wr);

assign out_stream_V_data_V_1_sel = out_stream_V_data_V_1_sel_rd;

assign out_stream_V_data_V_1_state_cmp_full = ((out_stream_V_data_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_V_data_V_1_vld_out = out_stream_V_data_V_1_state[1'd0];

assign out_stream_V_dest_V_1_ack_in = out_stream_V_dest_V_1_state[1'd1];

assign out_stream_V_dest_V_1_ack_out = out_r_TREADY;

assign out_stream_V_dest_V_1_data_out = 1'd0;

assign out_stream_V_dest_V_1_sel = out_stream_V_dest_V_1_sel_rd;

assign out_stream_V_dest_V_1_vld_out = out_stream_V_dest_V_1_state[1'd0];

assign out_stream_V_id_V_1_ack_in = out_stream_V_id_V_1_state[1'd1];

assign out_stream_V_id_V_1_ack_out = out_r_TREADY;

assign out_stream_V_id_V_1_data_out = 1'd0;

assign out_stream_V_id_V_1_sel = out_stream_V_id_V_1_sel_rd;

assign out_stream_V_id_V_1_vld_out = out_stream_V_id_V_1_state[1'd0];

assign out_stream_V_keep_V_1_ack_in = out_stream_V_keep_V_1_state[1'd1];

assign out_stream_V_keep_V_1_ack_out = out_r_TREADY;

assign out_stream_V_keep_V_1_data_out = 8'd255;

assign out_stream_V_keep_V_1_sel = out_stream_V_keep_V_1_sel_rd;

assign out_stream_V_keep_V_1_vld_out = out_stream_V_keep_V_1_state[1'd0];

assign out_stream_V_last_V_1_ack_in = out_stream_V_last_V_1_state[1'd1];

assign out_stream_V_last_V_1_ack_out = out_r_TREADY;

assign out_stream_V_last_V_1_load_A = (out_stream_V_last_V_1_state_cmp_full & ~out_stream_V_last_V_1_sel_wr);

assign out_stream_V_last_V_1_load_B = (out_stream_V_last_V_1_state_cmp_full & out_stream_V_last_V_1_sel_wr);

assign out_stream_V_last_V_1_sel = out_stream_V_last_V_1_sel_rd;

assign out_stream_V_last_V_1_state_cmp_full = ((out_stream_V_last_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_V_last_V_1_vld_out = out_stream_V_last_V_1_state[1'd0];

assign out_stream_V_strb_V_1_ack_in = out_stream_V_strb_V_1_state[1'd1];

assign out_stream_V_strb_V_1_ack_out = out_r_TREADY;

assign out_stream_V_strb_V_1_data_out = 8'd0;

assign out_stream_V_strb_V_1_sel = out_stream_V_strb_V_1_sel_rd;

assign out_stream_V_strb_V_1_vld_out = out_stream_V_strb_V_1_state[1'd0];

assign out_stream_V_user_V_1_ack_in = out_stream_V_user_V_1_state[1'd1];

assign out_stream_V_user_V_1_ack_out = out_r_TREADY;

assign out_stream_V_user_V_1_load_A = (out_stream_V_user_V_1_state_cmp_full & ~out_stream_V_user_V_1_sel_wr);

assign out_stream_V_user_V_1_load_B = (out_stream_V_user_V_1_state_cmp_full & out_stream_V_user_V_1_sel_wr);

assign out_stream_V_user_V_1_sel = out_stream_V_user_V_1_sel_rd;

assign out_stream_V_user_V_1_state_cmp_full = ((out_stream_V_user_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign out_stream_V_user_V_1_vld_out = out_stream_V_user_V_1_state[1'd0];

assign test_init_arr_V_address0 = tmp_5_fu_255_p1;

assign tmp_1_mid2_fu_231_p3 = {{tmp_1_mid2_v_v_fu_223_p3}, {8'd0}};

assign tmp_1_mid2_v_v_fu_223_p3 = ((exitcond6_fu_203_p2[0:0] === 1'b1) ? i_s_fu_217_p2 : ap_phi_mux_i_phi_fu_154_p4);

assign tmp_3_fu_243_p2 = (j_cast3_fu_239_p1 + tmp_1_mid2_fu_231_p3);

assign tmp_5_fu_255_p1 = j_mid2_fu_209_p3;

assign tmp_fu_187_p1 = $signed(mask);

assign tmp_last_V_fu_249_p2 = ((tmp_3_fu_243_p2 == 20'd1048319) ? 1'b1 : 1'b0);

endmodule //mem_write
