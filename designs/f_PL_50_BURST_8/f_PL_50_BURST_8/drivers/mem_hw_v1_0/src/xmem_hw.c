// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xmem_hw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMem_hw_CfgInitialize(XMem_hw *InstancePtr, XMem_hw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_bus_BaseAddress = ConfigPtr->Control_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMem_hw_Start(XMem_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL) & 0x80;
    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMem_hw_IsDone(XMem_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMem_hw_IsIdle(XMem_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMem_hw_IsReady(XMem_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMem_hw_EnableAutoRestart(XMem_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL, 0x80);
}

void XMem_hw_DisableAutoRestart(XMem_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_AP_CTRL, 0);
}

void XMem_hw_Set_rw(XMem_hw *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_RW_DATA, Data);
}

u32 XMem_hw_Get_rw(XMem_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_RW_DATA);
    return Data;
}

void XMem_hw_Set_mask(XMem_hw *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_MASK_DATA, (u32)(Data));
    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_MASK_DATA + 4, (u32)(Data >> 32));
}

u64 XMem_hw_Get_mask(XMem_hw *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_MASK_DATA);
    Data += (u64)XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_MASK_DATA + 4) << 32;
    return Data;
}

u32 XMem_hw_Get_test_init_arr_V_BaseAddress(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE);
}

u32 XMem_hw_Get_test_init_arr_V_HighAddress(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH);
}

u32 XMem_hw_Get_test_init_arr_V_TotalBytes(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH - XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + 1);
}

u32 XMem_hw_Get_test_init_arr_V_BitWidth(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMEM_HW_CONTROL_BUS_WIDTH_TEST_INIT_ARR_V;
}

u32 XMem_hw_Get_test_init_arr_V_Depth(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMEM_HW_CONTROL_BUS_DEPTH_TEST_INIT_ARR_V;
}

u32 XMem_hw_Write_test_init_arr_V_Words(XMem_hw *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH - XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XMem_hw_Read_test_init_arr_V_Words(XMem_hw *InstancePtr, int offset, int *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH - XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + (offset + i)*4);
    }
    return length;
}

u32 XMem_hw_Write_test_init_arr_V_Bytes(XMem_hw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH - XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XMem_hw_Read_test_init_arr_V_Bytes(XMem_hw *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_HIGH - XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_bus_BaseAddress + XMEM_HW_CONTROL_BUS_ADDR_TEST_INIT_ARR_V_BASE + offset + i);
    }
    return length;
}

void XMem_hw_InterruptGlobalEnable(XMem_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_GIE, 1);
}

void XMem_hw_InterruptGlobalDisable(XMem_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_GIE, 0);
}

void XMem_hw_InterruptEnable(XMem_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_IER);
    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_IER, Register | Mask);
}

void XMem_hw_InterruptDisable(XMem_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_IER);
    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_IER, Register & (~Mask));
}

void XMem_hw_InterruptClear(XMem_hw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMem_hw_WriteReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_ISR, Mask);
}

u32 XMem_hw_InterruptGetEnabled(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_IER);
}

u32 XMem_hw_InterruptGetStatus(XMem_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMem_hw_ReadReg(InstancePtr->Control_bus_BaseAddress, XMEM_HW_CONTROL_BUS_ADDR_ISR);
}

