; ModuleID = '/home/juju/mem_io_unit_testing/ip/mem_prj/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mem_hw_str = internal unnamed_addr constant [7 x i8] c"mem_hw\00"
@main_loop_data_loop_s = internal unnamed_addr constant [20 x i8] c"main_loop_data_loop\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@RAM_1P_str = internal unnamed_addr constant [7 x i8] c"RAM_1P\00"
@p_str10442 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str10441 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str10440 = private unnamed_addr constant [12 x i8] c"CONTROL_BUS\00", align 1
@p_str10439 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str10438 = private unnamed_addr constant [10 x i8] c"data_loop\00", align 1
@p_str10436 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str10435 = private unnamed_addr constant [18 x i8] c"loop_wait_for_end\00", align 1
@p_str = internal unnamed_addr constant [1 x i8] zeroinitializer

define internal fastcc void @mem_write(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, i32 %mask, [8 x i32]* nocapture %test_init_arr_V) {
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([8 x i32]* %test_init_arr_V, [1 x i8]* @p_str, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  %mask_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %mask)
  br label %1

; <label>:1                                       ; preds = %0, %.reset
  %indvar_flatten = phi i5 [ 0, %0 ], [ %indvar_flatten_next, %.reset ]
  %i = phi i2 [ 0, %0 ], [ %tmp_mid2_v_v, %.reset ]
  %axi_user_V = phi i1 [ true, %0 ], [ false, %.reset ]
  %j = phi i4 [ 0, %0 ], [ %j_1, %.reset ]
  %exitcond_flatten = icmp eq i5 %indvar_flatten, -16
  %indvar_flatten_next = add i5 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %2, label %.reset

.reset:                                           ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([20 x i8]* @main_loop_data_loop_s)
  call void (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16)
  %exitcond6 = icmp eq i4 %j, -8
  %j_mid2 = select i1 %exitcond6, i4 0, i4 %j
  %i_s = add i2 1, %i
  %tmp_mid2_v_v = select i1 %exitcond6, i2 %i_s, i2 %i
  %tmp = trunc i2 %tmp_mid2_v_v to i1
  %tmp_mid2 = call i4 @_ssdm_op_BitConcatenate.i4.i1.i3(i1 %tmp, i3 0)
  call void (...)* @_ssdm_op_SpecLoopName([10 x i8]* @p_str10438) nounwind
  %tmp_3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([10 x i8]* @p_str10438)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str10436) nounwind
  %tmp_2 = add i4 %j_mid2, %tmp_mid2
  %axi_last_V = icmp eq i4 %tmp_2, -1
  %tmp_4 = zext i4 %j_mid2 to i64
  %test_init_arr_V_addr = getelementptr [8 x i32]* %test_init_arr_V, i64 0, i64 %tmp_4
  %test_init_arr_V_load = load i32* %test_init_arr_V_addr, align 4
  %axi_data_V = and i32 %test_init_arr_V_load, %mask_read
  call void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32* %out_stream_V_data_V, i4* %out_stream_V_keep_V, i4* %out_stream_V_strb_V, i1* %out_stream_V_user_V, i1* %out_stream_V_last_V, i1* %out_stream_V_id_V, i1* %out_stream_V_dest_V, i32 %axi_data_V, i4 -1, i4 undef, i1 %axi_user_V, i1 %axi_last_V, i1 undef, i1 undef)
  %empty_2 = call i32 (...)* @_ssdm_op_SpecRegionEnd([10 x i8]* @p_str10438, i32 %tmp_3)
  %j_1 = add i4 1, %j_mid2
  br label %1

; <label>:2                                       ; preds = %1
  ret void
}

define internal fastcc void @mem_read(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V) {
.critedge:
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.critedge
  call void (...)* @_ssdm_op_SpecLoopName([18 x i8]* @p_str10435) nounwind
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([18 x i8]* @p_str10435)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 0, i32 0, i32 0, [1 x i8]* @p_str10436) nounwind
  %empty = call { i32, i4, i4, i1, i1, i1, i1 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i1P.i1P.i1P.i1P(i32* %in_stream_V_data_V, i4* %in_stream_V_keep_V, i4* %in_stream_V_strb_V, i1* %in_stream_V_user_V, i1* %in_stream_V_last_V, i1* %in_stream_V_id_V, i1* %in_stream_V_dest_V)
  %tmp_last_V = extractvalue { i32, i4, i4, i1, i1, i1, i1 } %empty, 4
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([18 x i8]* @p_str10435, i32 %tmp)
  br i1 %tmp_last_V, label %0, label %._crit_edge

; <label>:0                                       ; preds = %._crit_edge
  ret void
}

define void @mem_hw(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, i32 %rw, i32 %mask, [8 x i32]* %test_init_arr_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out_V_data_V), !map !114
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %out_V_keep_V), !map !118
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %out_V_strb_V), !map !122
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_user_V), !map !126
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_last_V), !map !130
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_id_V), !map !134
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_dest_V), !map !138
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_V_data_V), !map !142
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %in_V_keep_V), !map !146
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %in_V_strb_V), !map !150
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_user_V), !map !154
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_last_V), !map !158
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_id_V), !map !162
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_dest_V), !map !166
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %rw), !map !170
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %mask), !map !176
  call void (...)* @_ssdm_op_SpecBitsMap([8 x i32]* %test_init_arr_V), !map !180
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @mem_hw_str) nounwind
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str10439, i32 0, i32 0, [1 x i8]* @p_str10436, i32 0, i32 0, [12 x i8]* @p_str10440, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %mask, [10 x i8]* @p_str10439, i32 0, i32 0, [1 x i8]* @p_str10436, i32 0, i32 0, [12 x i8]* @p_str10440, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 %rw, [10 x i8]* @p_str10439, i32 0, i32 0, [1 x i8]* @p_str10436, i32 0, i32 0, [12 x i8]* @p_str10440, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([8 x i32]* %test_init_arr_V, [1 x i8]* @p_str, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface([8 x i32]* %test_init_arr_V, [10 x i8]* @p_str10439, i32 0, i32 0, [1 x i8]* @p_str10436, i32 0, i32 0, [12 x i8]* @p_str10440, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436) nounwind
  %mask_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %mask)
  %rw_read = call i32 @_ssdm_op_Read.s_axilite.i32(i32 %rw)
  call fastcc void @Block__proc(i32 %rw_read, i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32 %mask_read, [8 x i32]* %test_init_arr_V)
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
  %empty_4 = load i4* %1
  %empty_5 = load i4* %2
  %empty_6 = load i1* %3
  %empty_7 = load i1* %4
  %empty_8 = load i1* %5
  %empty_9 = load i1* %6
  %mrv_0 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } undef, i32 %empty, 0
  %mrv1 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv_0, i4 %empty_4, 1
  %mrv2 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv1, i4 %empty_5, 2
  %mrv3 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv2, i1 %empty_6, 3
  %mrv4 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv3, i1 %empty_7, 4
  %mrv5 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv4, i1 %empty_8, 5
  %mrv6 = insertvalue { i32, i4, i4, i1, i1, i1, i1 } %mrv5, i1 %empty_9, 6
  ret { i32, i4, i4, i1, i1, i1, i1 } %mrv6
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

declare i2 @_ssdm_op_PartSelect.i2.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i2.i32.i32(i2, i32, i32) nounwind readnone

define weak i4 @_ssdm_op_BitConcatenate.i4.i1.i3(i1, i3) nounwind readnone {
entry:
  %empty = zext i1 %0 to i4
  %empty_10 = zext i3 %1 to i4
  %empty_11 = shl i4 %empty, 3
  %empty_12 = or i4 %empty_11, %empty_10
  ret i4 %empty_12
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

define internal fastcc void @Block__proc(i32 %rw, i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V, i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32 %mask, [8 x i32]* nocapture %test_init_arr_V) {
newFuncRoot:
  %empty = call i32 (...)* @_ssdm_op_SpecMemCore([8 x i32]* %test_init_arr_V, [1 x i8]* @p_str, [7 x i8]* @RAM_1P_str, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i1* %in_V_dest_V, i1* %in_V_id_V, i1* %in_V_last_V, i1* %in_V_user_V, i4* %in_V_strb_V, i4* %in_V_keep_V, i32* %in_V_data_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436)
  call void (...)* @_ssdm_op_SpecInterface(i1* %out_V_dest_V, i1* %out_V_id_V, i1* %out_V_last_V, i1* %out_V_user_V, i4* %out_V_strb_V, i4* %out_V_keep_V, i32* %out_V_data_V, [5 x i8]* @p_str10441, i32 1, i32 1, [5 x i8]* @p_str10442, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str10436, [1 x i8]* @p_str10436)
  %mask_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %mask)
  %rw_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %rw)
  %tmp = trunc i32 %rw_read to i2
  %tmp_8 = icmp eq i2 %tmp, 0
  br i1 %tmp_8, label %0, label %1

; <label>:0                                       ; preds = %newFuncRoot
  %tmp_1 = trunc i32 %rw_read to i1
  br i1 %tmp_1, label %2, label %._crit_edge

; <label>:1                                       ; preds = %newFuncRoot
  call fastcc void @mem_read(i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V)
  call fastcc void @mem_write(i32* %out_V_data_V, i4* %out_V_keep_V, i4* %out_V_strb_V, i1* %out_V_user_V, i1* %out_V_last_V, i1* %out_V_id_V, i1* %out_V_dest_V, i32 %mask_read, [8 x i32]* %test_init_arr_V)
  br label %.ret.exitStub

; <label>:2                                       ; preds = %0
  call fastcc void @mem_read(i32* %in_V_data_V, i4* %in_V_keep_V, i4* %in_V_strb_V, i1* %in_V_user_V, i1* %in_V_last_V, i1* %in_V_id_V, i1* %in_V_dest_V)
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %0
  br label %.ret.exitStub

.ret.exitStub:                                    ; preds = %._crit_edge, %1
  ret void
}

!opencl.kernels = !{!0, !7, !13, !19, !22, !24, !24, !27, !27, !33, !36, !42, !42, !27, !44, !27, !27, !27, !47, !47, !49, !49, !27, !51, !54, !56, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !63, !63, !27, !65, !67, !67, !70, !27, !42, !42, !27, !72, !27, !27, !27, !74, !74, !76, !76, !78, !27, !27, !27, !80, !82, !84, !84, !86, !27, !27, !27, !27, !27, !87, !27, !27, !27, !27, !89, !89, !90, !92, !92, !94, !94, !96, !67, !67, !70, !87, !89, !89, !90, !94, !94, !98, !67, !67, !70, !87, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !100, !100, !100, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !100, !100, !100, !27, !100, !100, !100, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !27, !58, !58, !58, !63, !63, !27, !105, !27, !27, !27, !27, !27, !27, !27, !27, !27, !27, !27, !27, !27}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!107}

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
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!27 = metadata !{null, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !6}
!28 = metadata !{metadata !"kernel_arg_addr_space"}
!29 = metadata !{metadata !"kernel_arg_access_qual"}
!30 = metadata !{metadata !"kernel_arg_type"}
!31 = metadata !{metadata !"kernel_arg_type_qual"}
!32 = metadata !{metadata !"kernel_arg_name"}
!33 = metadata !{null, metadata !1, metadata !2, metadata !34, metadata !4, metadata !35, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!36 = metadata !{null, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !6}
!37 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!38 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!40 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!41 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!42 = metadata !{null, metadata !1, metadata !2, metadata !43, metadata !4, metadata !26, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!44 = metadata !{null, metadata !37, metadata !38, metadata !45, metadata !40, metadata !46, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<32, true> &"}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!47 = metadata !{null, metadata !1, metadata !2, metadata !48, metadata !4, metadata !26, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!49 = metadata !{null, metadata !1, metadata !2, metadata !50, metadata !4, metadata !26, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!51 = metadata !{null, metadata !1, metadata !2, metadata !52, metadata !4, metadata !53, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_axiu<32, 1, 1, 1> &"}
!53 = metadata !{metadata !"kernel_arg_name", metadata !"rdata"}
!54 = metadata !{null, metadata !1, metadata !2, metadata !52, metadata !4, metadata !55, metadata !6}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"dout"}
!56 = metadata !{null, metadata !1, metadata !2, metadata !20, metadata !4, metadata !57, metadata !6}
!57 = metadata !{metadata !"kernel_arg_name", metadata !""}
!58 = metadata !{null, metadata !59, metadata !2, metadata !60, metadata !61, metadata !62, metadata !6}
!59 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"char*"}
!61 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const"}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"str"}
!63 = metadata !{null, metadata !1, metadata !2, metadata !43, metadata !4, metadata !64, metadata !6}
!64 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!65 = metadata !{null, metadata !1, metadata !2, metadata !66, metadata !4, metadata !35, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!67 = metadata !{null, metadata !1, metadata !2, metadata !68, metadata !4, metadata !69, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"double"}
!69 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!70 = metadata !{null, metadata !1, metadata !2, metadata !68, metadata !4, metadata !71, metadata !6}
!71 = metadata !{metadata !"kernel_arg_name", metadata !"d"}
!72 = metadata !{null, metadata !37, metadata !38, metadata !73, metadata !40, metadata !46, metadata !6}
!73 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<54, true> &"}
!74 = metadata !{null, metadata !1, metadata !2, metadata !75, metadata !4, metadata !26, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, true> &"}
!76 = metadata !{null, metadata !1, metadata !2, metadata !77, metadata !4, metadata !26, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!78 = metadata !{null, metadata !1, metadata !2, metadata !79, metadata !4, metadata !35, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, true> &"}
!80 = metadata !{null, metadata !37, metadata !38, metadata !81, metadata !40, metadata !41, metadata !6}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"int"}
!82 = metadata !{null, metadata !37, metadata !38, metadata !83, metadata !40, metadata !46, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<32, true> &"}
!84 = metadata !{null, metadata !1, metadata !2, metadata !85, metadata !4, metadata !26, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &"}
!86 = metadata !{null, metadata !1, metadata !2, metadata !25, metadata !4, metadata !35, metadata !6}
!87 = metadata !{null, metadata !1, metadata !2, metadata !68, metadata !4, metadata !88, metadata !6}
!88 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!89 = metadata !{null, metadata !1, metadata !2, metadata !43, metadata !4, metadata !69, metadata !6}
!90 = metadata !{null, metadata !1, metadata !2, metadata !43, metadata !4, metadata !91, metadata !6}
!91 = metadata !{metadata !"kernel_arg_name", metadata !"b"}
!92 = metadata !{null, metadata !1, metadata !2, metadata !43, metadata !4, metadata !93, metadata !6}
!93 = metadata !{metadata !"kernel_arg_name", metadata !"i_op"}
!94 = metadata !{null, metadata !1, metadata !2, metadata !95, metadata !4, metadata !26, metadata !6}
!95 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!96 = metadata !{null, metadata !1, metadata !2, metadata !97, metadata !4, metadata !26, metadata !6}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<25, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!98 = metadata !{null, metadata !1, metadata !2, metadata !99, metadata !4, metadata !26, metadata !6}
!99 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<7, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!100 = metadata !{null, metadata !101, metadata !38, metadata !102, metadata !103, metadata !104, metadata !6}
!101 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!102 = metadata !{metadata !"kernel_arg_type", metadata !"char*", metadata !"signed char"}
!103 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !""}
!104 = metadata !{metadata !"kernel_arg_name", metadata !"str", metadata !"radix"}
!105 = metadata !{null, metadata !1, metadata !2, metadata !106, metadata !4, metadata !35, metadata !6}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!107 = metadata !{metadata !108, [1 x i32]* @llvm_global_ctors_0}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 0, i32 31, metadata !110}
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !"llvm.global_ctors.0", metadata !112, metadata !"", i32 0, i32 31}
!112 = metadata !{metadata !113}
!113 = metadata !{i32 0, i32 0, i32 1}
!114 = metadata !{metadata !115}
!115 = metadata !{i32 0, i32 31, metadata !116}
!116 = metadata !{metadata !117}
!117 = metadata !{metadata !"out.V.data.V", metadata !112, metadata !"uint32", i32 0, i32 31}
!118 = metadata !{metadata !119}
!119 = metadata !{i32 0, i32 3, metadata !120}
!120 = metadata !{metadata !121}
!121 = metadata !{metadata !"out.V.keep.V", metadata !112, metadata !"uint4", i32 0, i32 3}
!122 = metadata !{metadata !123}
!123 = metadata !{i32 0, i32 3, metadata !124}
!124 = metadata !{metadata !125}
!125 = metadata !{metadata !"out.V.strb.V", metadata !112, metadata !"uint4", i32 0, i32 3}
!126 = metadata !{metadata !127}
!127 = metadata !{i32 0, i32 0, metadata !128}
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !"out.V.user.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!130 = metadata !{metadata !131}
!131 = metadata !{i32 0, i32 0, metadata !132}
!132 = metadata !{metadata !133}
!133 = metadata !{metadata !"out.V.last.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!134 = metadata !{metadata !135}
!135 = metadata !{i32 0, i32 0, metadata !136}
!136 = metadata !{metadata !137}
!137 = metadata !{metadata !"out.V.id.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!138 = metadata !{metadata !139}
!139 = metadata !{i32 0, i32 0, metadata !140}
!140 = metadata !{metadata !141}
!141 = metadata !{metadata !"out.V.dest.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!142 = metadata !{metadata !143}
!143 = metadata !{i32 0, i32 31, metadata !144}
!144 = metadata !{metadata !145}
!145 = metadata !{metadata !"in.V.data.V", metadata !112, metadata !"uint32", i32 0, i32 31}
!146 = metadata !{metadata !147}
!147 = metadata !{i32 0, i32 3, metadata !148}
!148 = metadata !{metadata !149}
!149 = metadata !{metadata !"in.V.keep.V", metadata !112, metadata !"uint4", i32 0, i32 3}
!150 = metadata !{metadata !151}
!151 = metadata !{i32 0, i32 3, metadata !152}
!152 = metadata !{metadata !153}
!153 = metadata !{metadata !"in.V.strb.V", metadata !112, metadata !"uint4", i32 0, i32 3}
!154 = metadata !{metadata !155}
!155 = metadata !{i32 0, i32 0, metadata !156}
!156 = metadata !{metadata !157}
!157 = metadata !{metadata !"in.V.user.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!158 = metadata !{metadata !159}
!159 = metadata !{i32 0, i32 0, metadata !160}
!160 = metadata !{metadata !161}
!161 = metadata !{metadata !"in.V.last.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!162 = metadata !{metadata !163}
!163 = metadata !{i32 0, i32 0, metadata !164}
!164 = metadata !{metadata !165}
!165 = metadata !{metadata !"in.V.id.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!166 = metadata !{metadata !167}
!167 = metadata !{i32 0, i32 0, metadata !168}
!168 = metadata !{metadata !169}
!169 = metadata !{metadata !"in.V.dest.V", metadata !112, metadata !"uint1", i32 0, i32 0}
!170 = metadata !{metadata !171}
!171 = metadata !{i32 0, i32 31, metadata !172}
!172 = metadata !{metadata !173}
!173 = metadata !{metadata !"rw", metadata !174, metadata !"int", i32 0, i32 31}
!174 = metadata !{metadata !175}
!175 = metadata !{i32 0, i32 0, i32 0}
!176 = metadata !{metadata !177}
!177 = metadata !{i32 0, i32 31, metadata !178}
!178 = metadata !{metadata !179}
!179 = metadata !{metadata !"mask", metadata !174, metadata !"unsigned int", i32 0, i32 31}
!180 = metadata !{metadata !181}
!181 = metadata !{i32 0, i32 31, metadata !182}
!182 = metadata !{metadata !183}
!183 = metadata !{metadata !"test_init_arr.V", metadata !184, metadata !"uint32", i32 0, i32 31}
!184 = metadata !{metadata !185}
!185 = metadata !{i32 0, i32 7, i32 1}
