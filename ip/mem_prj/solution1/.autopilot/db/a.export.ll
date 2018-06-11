; ModuleID = '/home/juju/mem_io_unit_testing/ip/mem_prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mem_hw_str = internal unnamed_addr constant [7 x i8] c"mem_hw\00"
@mask_channel1_str = internal unnamed_addr constant [14 x i8] c"mask_channel1\00"
@mask_channel_str = internal unnamed_addr constant [13 x i8] c"mask_channel\00"
@main_loop_data_loop_s = internal unnamed_addr constant [20 x i8] c"main_loop_data_loop\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00"
@p_str9 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str8 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str7 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str6 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str5 = private unnamed_addr constant [12 x i8] c"CONTROL_BUS\00", align 1
@p_str49 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str48 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str47 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str46 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str45 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str44 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str42 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str41 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str40 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str39 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str38 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str37 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str36 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str35 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str34 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str33 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str32 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str31 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str30 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str3 = private unnamed_addr constant [10 x i8] c"data_loop\00", align 1
@p_str28 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str27 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str26 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str25 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str24 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str23 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str22 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str20 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str19 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str18 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str17 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str16 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str15 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str14 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str13 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str12 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str11 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str10 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [18 x i8] c"loop_wait_for_end\00", align 1

define internal fastcc void @mem_write(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, i32* nocapture %mask, [256 x i32]* nocapture %test_init_arr_V) {
entry:
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([256 x i32]* %test_init_arr_V, [1 x i8]* @p_str28, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str28, i32 -1, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28)
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str44, i32 0, i32 0, [1 x i8]* @p_str45, [1 x i8]* @p_str46, [1 x i8]* @p_str47, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str48, [1 x i8]* @p_str49)
  %mask_read = call i32 @_ssdm_op_Read.ap_fifo.i32P(i32* %mask)
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  br label %0

; <label>:0                                       ; preds = %entry, %.reset
  %indvar_flatten = phi i20 [ 0, %entry ], [ %indvar_flatten_next, %.reset ]
  %i_i = phi i12 [ 0, %entry ], [ %tmp_i_mid2_v_v, %.reset ]
  %axi_user_V = phi i1 [ true, %entry ], [ false, %.reset ]
  %j_i = phi i9 [ 0, %entry ], [ %j, %.reset ]
  %exitcond_flatten = icmp eq i20 %indvar_flatten, -256
  %indvar_flatten_next = add i20 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %.exit, label %.reset

.reset:                                           ; preds = %0
  call void (...)* @_ssdm_op_SpecLoopName([20 x i8]* @main_loop_data_loop_s)
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 1048320, i64 1048320, i64 1048320)
  %exitcond_i6 = icmp eq i9 %j_i, -256
  %j_i_mid2 = select i1 %exitcond_i6, i9 0, i9 %j_i
  %i4 = add i12 %i_i, 1
  %tmp_i_mid2_v_v = select i1 %exitcond_i6, i12 %i4, i12 %i_i
  %tmp_i_mid2 = call i20 @_ssdm_op_BitConcatenate.i20.i12.i8(i12 %tmp_i_mid2_v_v, i8 0)
  %j_cast3_i = zext i9 %j_i_mid2 to i20
  call void (...)* @_ssdm_op_SpecLoopName([10 x i8]* @p_str3) nounwind
  %tmp_3_i = call i32 (...)* @_ssdm_op_SpecRegionBegin([10 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_2_i = add i20 %j_cast3_i, %tmp_i_mid2
  %axi_last_V = icmp eq i20 %tmp_2_i, -257
  %tmp_4_i = zext i9 %j_i_mid2 to i64
  %test_init_arr_V_addr = getelementptr [256 x i32]* %test_init_arr_V, i64 0, i64 %tmp_4_i
  %test_init_arr_V_load = load i32* %test_init_arr_V_addr, align 4
  %axi_data_V = and i32 %test_init_arr_V_load, %mask_read
  call void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, i32 %axi_data_V, i4 -1, i4 undef, i1 %axi_user_V, i1 %axi_last_V, i1 undef, i1 undef)
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([10 x i8]* @p_str3, i32 %tmp_3_i)
  %j = add i9 %j_i_mid2, 1
  br label %0

.exit:                                            ; preds = %0
  ret void
}

define internal fastcc void @mem_read(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V) {
.critedge:
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.critedge
  call void (...)* @_ssdm_op_SpecLoopName([18 x i8]* @p_str) nounwind
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([18 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 0, i32 0, [1 x i8]* @p_str1) nounwind
  %empty = call { i32, i4, i4, i1, i1, i1, i1 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V)
  %tmp_last_V = extractvalue { i32, i4, i4, i1, i1, i1, i1 } %empty, 4
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([18 x i8]* @p_str, i32 %tmp)
  br i1 %tmp_last_V, label %0, label %._crit_edge

; <label>:0                                       ; preds = %._crit_edge
  ret void
}

define internal void @mem_hw.entry3(i32 %mask, i32* %mask_out) {
entry:
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask_out, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str8, i32 0, i32 0, [1 x i8]* @p_str9, [1 x i8]* @p_str10, [1 x i8]* @p_str11, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str12, [1 x i8]* @p_str13)
  %mask_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %mask)
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %mask_out, i32 %mask_read)
  ret void
}

define internal fastcc void @mem_hw.entry28(i32* nocapture %mask, i32* %mask_out) {
entry:
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask_out, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str30, i32 0, i32 0, [1 x i8]* @p_str31, [1 x i8]* @p_str32, [1 x i8]* @p_str33, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str34, [1 x i8]* @p_str35)
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str22, i32 0, i32 0, [1 x i8]* @p_str23, [1 x i8]* @p_str24, [1 x i8]* @p_str25, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str26, [1 x i8]* @p_str27)
  %mask_read = call i32 @_ssdm_op_Read.ap_fifo.i32P(i32* %mask)
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask_out, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str30, i32 0, i32 0, [1 x i8]* @p_str31, [1 x i8]* @p_str32, [1 x i8]* @p_str33, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str34, [1 x i8]* @p_str35)
  call void @_ssdm_op_Write.ap_fifo.i32P(i32* %mask_out, i32 %mask_read)
  ret void
}

define void @mem_hw(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, i32 %rw, i32 %mask, [256 x i32]* %test_init_arr_V) {
  %mask_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %mask)
  %mask_channel1 = alloca i32, align 4
  %mask_channel = alloca i32, align 4
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out_V_data_V), !map !71
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %out_V_keep_V), !map !75
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %out_V_strb_V), !map !79
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_user_V), !map !83
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_last_V), !map !87
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_id_V), !map !91
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_dest_V), !map !95
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_V_data_V), !map !99
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %in_V_keep_V), !map !103
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %in_V_strb_V), !map !107
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_user_V), !map !111
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_last_V), !map !115
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_id_V), !map !119
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_dest_V), !map !123
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %rw), !map !127
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %mask), !map !133
  call void (...)* @_ssdm_op_SpecBitsMap([256 x i32]* %test_init_arr_V), !map !137
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @mem_hw_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [12 x i8]* @p_str5, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %mask, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [12 x i8]* @p_str5, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %rw, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [12 x i8]* @p_str5, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([256 x i32]* %test_init_arr_V, [1 x i8]* @p_str28, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str28, i32 -1, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28, [1 x i8]* @p_str28)
  call void (...)* @_ssdm_op_SpecInterface([256 x i32]* %test_init_arr_V, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [12 x i8]* @p_str5, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, [5 x i8]* @p_str6, i32 1, i32 1, [5 x i8]* @p_str7, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %empty_5 = call i32 (...)* @_ssdm_op_SpecChannel([13 x i8]* @mask_channel_str, i32 1, [1 x i8]* @p_str36, [1 x i8]* @p_str36, i32 1, i32 0, i32* %mask_channel, i32* %mask_channel)
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask_channel, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str37, i32 0, i32 0, [1 x i8]* @p_str38, [1 x i8]* @p_str39, [1 x i8]* @p_str40, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str41, [1 x i8]* @p_str42)
  %empty_6 = call i32 (...)* @_ssdm_op_SpecChannel([14 x i8]* @mask_channel1_str, i32 1, [1 x i8]* @p_str14, [1 x i8]* @p_str14, i32 1, i32 0, i32* %mask_channel1, i32* %mask_channel1)
  call void (...)* @_ssdm_op_SpecInterface(i32* %mask_channel1, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str15, i32 0, i32 0, [1 x i8]* @p_str16, [1 x i8]* @p_str17, [1 x i8]* @p_str18, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str19, [1 x i8]* @p_str20)
  call void @mem_hw.entry3(i32 %mask_read, i32* %mask_channel1)
  call fastcc void @mem_hw.entry28(i32* nocapture %mask_channel1, i32* %mask_channel)
  call fastcc void @mem_read(i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V)
  call fastcc void @mem_write(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32* nocapture %mask_channel, [256 x i32]* nocapture %test_init_arr_V)
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32*, i4*, i4*, i1*, i1*, i1*, i1*, i32, i4, i4, i1, i1, i1, i1) {
entry:
  store i32 %7, i32* %0
  store i4 %8, i4* %1
  store i4 %9, i4* %2
  store i1 %10, i1* %3
  store i1 %11, i1* %4
  store i1 %12, i1* %5
  store i1 %13, i1* %6
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.i32P(i32*, i32) {
entry:
  %empty = call i32 @_autotb_FifoWrite_i32(i32* %0, i32 %1)
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecMemCore(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecDataflowPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecChannel(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.s_axilite.i32(i32) {
entry:
  ret i32 %0
}

define weak { i32, i4, i4, i1, i1, i1, i1 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32*, i4*, i4*, i1*, i1*, i1*, i1*) {
entry:
  %empty = load i32* %0
  %empty_7 = load i4* %1
  %empty_8 = load i4* %2
  %empty_9 = load i1* %3
  %empty_10 = load i1* %4
  %empty_11 = load i1* %5
  %empty_12 = load i1* %6
  %mrv_0 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } undef, i32 %empty, 0
  %mrv1 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv_0, i4 %empty_7, 1
  %mrv2 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv1, i4 %empty_8, 2
  %mrv3 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv2, i1 %empty_9, 3
  %mrv4 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv3, i1 %empty_10, 4
  %mrv5 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv4, i1 %empty_11, 5
  %mrv6 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv5, i1 %empty_12, 6
  ret { i32, i4, i4, i1, i1, i1, i1 } %mrv6
}

define weak i32 @_ssdm_op_Read.ap_fifo.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0)
  ret i32 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i20 @_ssdm_op_BitConcatenate.i20.i12.i8(i12, i8) nounwind readnone {
entry:
  %empty = zext i12 %0 to i20
  %empty_13 = zext i8 %1 to i20
  %empty_14 = shl i20 %empty, 8
  %empty_15 = or i20 %empty_14, %empty_13
  ret i20 %empty_15
}

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i32 @_autotb_FifoRead_i32(i32*)

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !13, !19, !22, !24, !24, !27, !27, !33, !36, !36, !27, !27, !39, !41, !47, !47, !27, !48, !27, !27, !27, !51, !51, !53, !53, !24, !24, !27, !27, !55, !27, !57, !60, !62, !27, !27, !27, !27, !27, !27, !27, !27}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!64}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"AXI_STREAM &"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in_stream"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"AXI_STREAM &", metadata !"int", metadata !"data_t*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"out_stream", metadata !"mask", metadata !"test_init_arr"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"AXI_STREAM &", metadata !"AXI_STREAM &", metadata !"int", metadata !"uint", metadata !"data_t*"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"out", metadata !"in", metadata !"rw", metadata !"mask", metadata !"test_init_arr"}
!19 = metadata !{null, metadata !1, metadata !2, metadata !20, metadata !4, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_axiu<32, 1, 1, 1> &"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"wdata"}
!22 = metadata !{null, metadata !1, metadata !2, metadata !20, metadata !4, metadata !23, metadata !6}
!23 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!24 = metadata !{null, metadata !1, metadata !2, metadata !25, metadata !4, metadata !26, metadata !6}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!27 = metadata !{null, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !6}
!28 = metadata !{metadata !"kernel_arg_addr_space"}
!29 = metadata !{metadata !"kernel_arg_access_qual"}
!30 = metadata !{metadata !"kernel_arg_type"}
!31 = metadata !{metadata !"kernel_arg_type_qual"}
!32 = metadata !{metadata !"kernel_arg_name"}
!33 = metadata !{null, metadata !1, metadata !2, metadata !34, metadata !4, metadata !35, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!36 = metadata !{null, metadata !1, metadata !2, metadata !37, metadata !4, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!39 = metadata !{null, metadata !1, metadata !2, metadata !40, metadata !4, metadata !35, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!41 = metadata !{null, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !6}
!42 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!43 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!45 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!47 = metadata !{null, metadata !1, metadata !2, metadata !25, metadata !4, metadata !38, metadata !6}
!48 = metadata !{null, metadata !42, metadata !43, metadata !49, metadata !45, metadata !50, metadata !6}
!49 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<32, true> &"}
!50 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!51 = metadata !{null, metadata !1, metadata !2, metadata !52, metadata !4, metadata !38, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!53 = metadata !{null, metadata !1, metadata !2, metadata !54, metadata !4, metadata !38, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!55 = metadata !{null, metadata !1, metadata !2, metadata !56, metadata !4, metadata !35, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!57 = metadata !{null, metadata !1, metadata !2, metadata !58, metadata !4, metadata !59, metadata !6}
!58 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_axiu<32, 1, 1, 1> &"}
!59 = metadata !{metadata !"kernel_arg_name", metadata !"rdata"}
!60 = metadata !{null, metadata !1, metadata !2, metadata !58, metadata !4, metadata !61, metadata !6}
!61 = metadata !{metadata !"kernel_arg_name", metadata !"dout"}
!62 = metadata !{null, metadata !1, metadata !2, metadata !20, metadata !4, metadata !63, metadata !6}
!63 = metadata !{metadata !"kernel_arg_name", metadata !""}
!64 = metadata !{metadata !65, [1 x i32]* @llvm_global_ctors_0}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 0, i32 31, metadata !67}
!67 = metadata !{metadata !68}
!68 = metadata !{metadata !"llvm.global_ctors.0", metadata !69, metadata !"", i32 0, i32 31}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 0, i32 0, i32 1}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 0, i32 31, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"out.V.data.V", metadata !69, metadata !"uint32", i32 0, i32 31}
!75 = metadata !{metadata !76}
!76 = metadata !{i32 0, i32 3, metadata !77}
!77 = metadata !{metadata !78}
!78 = metadata !{metadata !"out.V.keep.V", metadata !69, metadata !"uint4", i32 0, i32 3}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 0, i32 3, metadata !81}
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !"out.V.strb.V", metadata !69, metadata !"uint4", i32 0, i32 3}
!83 = metadata !{metadata !84}
!84 = metadata !{i32 0, i32 0, metadata !85}
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !"out.V.user.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!87 = metadata !{metadata !88}
!88 = metadata !{i32 0, i32 0, metadata !89}
!89 = metadata !{metadata !90}
!90 = metadata !{metadata !"out.V.last.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 0, i32 0, metadata !93}
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !"out.V.id.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 0, i32 0, metadata !97}
!97 = metadata !{metadata !98}
!98 = metadata !{metadata !"out.V.dest.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 0, i32 31, metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !"in.V.data.V", metadata !69, metadata !"uint32", i32 0, i32 31}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 0, i32 3, metadata !105}
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !"in.V.keep.V", metadata !69, metadata !"uint4", i32 0, i32 3}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 0, i32 3, metadata !109}
!109 = metadata !{metadata !110}
!110 = metadata !{metadata !"in.V.strb.V", metadata !69, metadata !"uint4", i32 0, i32 3}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 0, i32 0, metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{metadata !"in.V.user.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 0, i32 0, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"in.V.last.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 0, i32 0, metadata !121}
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !"in.V.id.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!123 = metadata !{metadata !124}
!124 = metadata !{i32 0, i32 0, metadata !125}
!125 = metadata !{metadata !126}
!126 = metadata !{metadata !"in.V.dest.V", metadata !69, metadata !"uint1", i32 0, i32 0}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 0, i32 31, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"rw", metadata !131, metadata !"int", i32 0, i32 31}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 0, i32 0, i32 0}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 0, i32 31, metadata !135}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !"mask", metadata !131, metadata !"unsigned int", i32 0, i32 31}
!137 = metadata !{metadata !138}
!138 = metadata !{i32 0, i32 31, metadata !139}
!139 = metadata !{metadata !140}
!140 = metadata !{metadata !"test_init_arr.V", metadata !141, metadata !"uint32", i32 0, i32 31}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 255, i32 1}
