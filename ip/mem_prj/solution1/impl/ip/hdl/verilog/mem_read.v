// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mem_read (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_r_TDATA,
        in_r_TVALID,
        in_r_TREADY,
        in_r_TKEEP,
        in_r_TSTRB,
        in_r_TUSER,
        in_r_TLAST,
        in_r_TID,
        in_r_TDEST
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] in_r_TDATA;
input   in_r_TVALID;
output   in_r_TREADY;
input  [3:0] in_r_TKEEP;
input  [3:0] in_r_TSTRB;
input  [0:0] in_r_TUSER;
input  [0:0] in_r_TLAST;
input  [0:0] in_r_TID;
input  [0:0] in_r_TDEST;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    in_stream_V_data_V_0_vld_in;
wire    in_stream_V_data_V_0_vld_out;
reg    in_stream_V_data_V_0_ack_out;
reg   [1:0] in_stream_V_data_V_0_state;
reg   [0:0] in_stream_V_last_V_0_data_out;
wire    in_stream_V_last_V_0_vld_in;
wire    in_stream_V_last_V_0_vld_out;
wire    in_stream_V_last_V_0_ack_in;
reg    in_stream_V_last_V_0_ack_out;
reg   [0:0] in_stream_V_last_V_0_payload_A;
reg   [0:0] in_stream_V_last_V_0_payload_B;
reg    in_stream_V_last_V_0_sel_rd;
reg    in_stream_V_last_V_0_sel_wr;
wire    in_stream_V_last_V_0_sel;
wire    in_stream_V_last_V_0_load_A;
wire    in_stream_V_last_V_0_load_B;
reg   [1:0] in_stream_V_last_V_0_state;
wire    in_stream_V_last_V_0_state_cmp_full;
wire    in_stream_V_dest_V_0_vld_in;
reg    in_stream_V_dest_V_0_ack_out;
reg   [1:0] in_stream_V_dest_V_0_state;
reg    in_r_TDATA_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_last_V_fu_58_p1;
wire    ap_CS_fsm_state3;
reg   [2:0] ap_NS_fsm;
reg    ap_block_state1;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 in_stream_V_data_V_0_state = 2'd0;
#0 in_stream_V_last_V_0_sel_rd = 1'b0;
#0 in_stream_V_last_V_0_sel_wr = 1'b0;
#0 in_stream_V_last_V_0_state = 2'd0;
#0 in_stream_V_dest_V_0_state = 2'd0;
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_continue)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_V_data_V_0_state <= 2'd0;
    end else begin
        if ((((1'b0 == in_stream_V_data_V_0_vld_in) & (1'b1 == in_stream_V_data_V_0_ack_out) & (in_stream_V_data_V_0_state == 2'd3)) | ((1'b0 == in_stream_V_data_V_0_vld_in) & (in_stream_V_data_V_0_state == 2'd2)))) begin
            in_stream_V_data_V_0_state <= 2'd2;
        end else if ((((1'b1 == in_stream_V_data_V_0_vld_in) & (1'b0 == in_stream_V_data_V_0_ack_out) & (in_stream_V_data_V_0_state == 2'd3)) | ((1'b0 == in_stream_V_data_V_0_ack_out) & (in_stream_V_data_V_0_state == 2'd1)))) begin
            in_stream_V_data_V_0_state <= 2'd1;
        end else if ((((1'b1 == in_stream_V_data_V_0_vld_in) & (in_stream_V_data_V_0_state == 2'd2)) | ((1'b1 == in_stream_V_data_V_0_ack_out) & (in_stream_V_data_V_0_state == 2'd1)) | ((in_stream_V_data_V_0_state == 2'd3) & ~((1'b1 == in_stream_V_data_V_0_vld_in) & (1'b0 == in_stream_V_data_V_0_ack_out)) & ~((1'b0 == in_stream_V_data_V_0_vld_in) & (1'b1 == in_stream_V_data_V_0_ack_out))))) begin
            in_stream_V_data_V_0_state <= 2'd3;
        end else begin
            in_stream_V_data_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_V_dest_V_0_state <= 2'd0;
    end else begin
        if ((((1'b0 == in_stream_V_dest_V_0_vld_in) & (1'b1 == in_stream_V_dest_V_0_ack_out) & (2'd3 == in_stream_V_dest_V_0_state)) | ((1'b0 == in_stream_V_dest_V_0_vld_in) & (2'd2 == in_stream_V_dest_V_0_state)))) begin
            in_stream_V_dest_V_0_state <= 2'd2;
        end else if ((((1'b1 == in_stream_V_dest_V_0_vld_in) & (1'b0 == in_stream_V_dest_V_0_ack_out) & (2'd3 == in_stream_V_dest_V_0_state)) | ((1'b0 == in_stream_V_dest_V_0_ack_out) & (2'd1 == in_stream_V_dest_V_0_state)))) begin
            in_stream_V_dest_V_0_state <= 2'd1;
        end else if ((((1'b1 == in_stream_V_dest_V_0_vld_in) & (2'd2 == in_stream_V_dest_V_0_state)) | ((1'b1 == in_stream_V_dest_V_0_ack_out) & (2'd1 == in_stream_V_dest_V_0_state)) | ((2'd3 == in_stream_V_dest_V_0_state) & ~((1'b1 == in_stream_V_dest_V_0_vld_in) & (1'b0 == in_stream_V_dest_V_0_ack_out)) & ~((1'b0 == in_stream_V_dest_V_0_vld_in) & (1'b1 == in_stream_V_dest_V_0_ack_out))))) begin
            in_stream_V_dest_V_0_state <= 2'd3;
        end else begin
            in_stream_V_dest_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_V_last_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == in_stream_V_last_V_0_ack_out) & (1'b1 == in_stream_V_last_V_0_vld_out))) begin
            in_stream_V_last_V_0_sel_rd <= ~in_stream_V_last_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_V_last_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == in_stream_V_last_V_0_vld_in) & (1'b1 == in_stream_V_last_V_0_ack_in))) begin
            in_stream_V_last_V_0_sel_wr <= ~in_stream_V_last_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        in_stream_V_last_V_0_state <= 2'd0;
    end else begin
        if ((((1'b0 == in_stream_V_last_V_0_vld_in) & (1'b1 == in_stream_V_last_V_0_ack_out) & (2'd3 == in_stream_V_last_V_0_state)) | ((1'b0 == in_stream_V_last_V_0_vld_in) & (2'd2 == in_stream_V_last_V_0_state)))) begin
            in_stream_V_last_V_0_state <= 2'd2;
        end else if ((((1'b1 == in_stream_V_last_V_0_vld_in) & (1'b0 == in_stream_V_last_V_0_ack_out) & (2'd3 == in_stream_V_last_V_0_state)) | ((1'b0 == in_stream_V_last_V_0_ack_out) & (2'd1 == in_stream_V_last_V_0_state)))) begin
            in_stream_V_last_V_0_state <= 2'd1;
        end else if ((((1'b1 == in_stream_V_last_V_0_vld_in) & (2'd2 == in_stream_V_last_V_0_state)) | ((1'b1 == in_stream_V_last_V_0_ack_out) & (2'd1 == in_stream_V_last_V_0_state)) | ((2'd3 == in_stream_V_last_V_0_state) & ~((1'b1 == in_stream_V_last_V_0_vld_in) & (1'b0 == in_stream_V_last_V_0_ack_out)) & ~((1'b0 == in_stream_V_last_V_0_vld_in) & (1'b1 == in_stream_V_last_V_0_ack_out))))) begin
            in_stream_V_last_V_0_state <= 2'd3;
        end else begin
            in_stream_V_last_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == in_stream_V_last_V_0_load_A)) begin
        in_stream_V_last_V_0_payload_A <= in_r_TLAST;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == in_stream_V_last_V_0_load_B)) begin
        in_stream_V_last_V_0_payload_B <= in_r_TLAST;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        in_r_TDATA_blk_n = in_stream_V_data_V_0_state[1'd0];
    end else begin
        in_r_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (in_stream_V_data_V_0_vld_out == 1'b1))) begin
        in_stream_V_data_V_0_ack_out = 1'b1;
    end else begin
        in_stream_V_data_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (in_stream_V_data_V_0_vld_out == 1'b1))) begin
        in_stream_V_dest_V_0_ack_out = 1'b1;
    end else begin
        in_stream_V_dest_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (in_stream_V_data_V_0_vld_out == 1'b1))) begin
        in_stream_V_last_V_0_ack_out = 1'b1;
    end else begin
        in_stream_V_last_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == in_stream_V_last_V_0_sel)) begin
        in_stream_V_last_V_0_data_out = in_stream_V_last_V_0_payload_B;
    end else begin
        in_stream_V_last_V_0_data_out = in_stream_V_last_V_0_payload_A;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & ~((1'b0 == ap_start) | (ap_done_reg == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (in_stream_V_data_V_0_vld_out == 1'b1) & (1'd0 == tmp_last_V_fu_58_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if (((1'b1 == ap_CS_fsm_state2) & (in_stream_V_data_V_0_vld_out == 1'b1) & (1'd1 == tmp_last_V_fu_58_p1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((1'b0 == ap_start) | (ap_done_reg == 1'b1));
end

assign in_r_TREADY = in_stream_V_dest_V_0_state[1'd1];

assign in_stream_V_data_V_0_vld_in = in_r_TVALID;

assign in_stream_V_data_V_0_vld_out = in_stream_V_data_V_0_state[1'd0];

assign in_stream_V_dest_V_0_vld_in = in_r_TVALID;

assign in_stream_V_last_V_0_ack_in = in_stream_V_last_V_0_state[1'd1];

assign in_stream_V_last_V_0_load_A = (in_stream_V_last_V_0_state_cmp_full & ~in_stream_V_last_V_0_sel_wr);

assign in_stream_V_last_V_0_load_B = (in_stream_V_last_V_0_sel_wr & in_stream_V_last_V_0_state_cmp_full);

assign in_stream_V_last_V_0_sel = in_stream_V_last_V_0_sel_rd;

assign in_stream_V_last_V_0_state_cmp_full = ((in_stream_V_last_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign in_stream_V_last_V_0_vld_in = in_r_TVALID;

assign in_stream_V_last_V_0_vld_out = in_stream_V_last_V_0_state[1'd0];

assign tmp_last_V_fu_58_p1 = in_stream_V_last_V_0_data_out;

endmodule //mem_read
