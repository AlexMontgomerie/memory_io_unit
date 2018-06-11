// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module mem_hw_entry3 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        mask,
        mask_out_din,
        mask_out_full_n,
        mask_out_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [31:0] mask;
output  [31:0] mask_out_din;
input   mask_out_full_n;
output   mask_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg mask_out_write;

reg    real_start;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    start_once_reg;
reg    mask_out_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 start_once_reg = 1'b0;
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
        end else if (((1'b1 == ap_CS_fsm_state1) & ~((1'b0 == real_start) | (1'b0 == mask_out_full_n) | (ap_done_reg == 1'b1)))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if ((1'b1 == real_start)) begin
            start_once_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ~((1'b0 == real_start) | (1'b0 == mask_out_full_n) | (ap_done_reg == 1'b1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b0 == real_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ~((1'b0 == real_start) | (1'b0 == mask_out_full_n) | (ap_done_reg == 1'b1)))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        mask_out_blk_n = mask_out_full_n;
    end else begin
        mask_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ~((1'b0 == real_start) | (1'b0 == mask_out_full_n) | (ap_done_reg == 1'b1)))) begin
        mask_out_write = 1'b1;
    end else begin
        mask_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == start_full_n)) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b1 == real_start) & ((1'b1 == internal_ap_ready) | (1'b0 == start_once_reg)))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((1'b0 == real_start) | (1'b0 == mask_out_full_n) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign mask_out_din = mask;

assign start_out = real_start;

endmodule //mem_hw_entry3