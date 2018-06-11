// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XMEM_HW_H
#define XMEM_HW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmem_hw_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_bus_BaseAddress;
} XMem_hw_Config;
#endif

typedef struct {
    u32 Control_bus_BaseAddress;
    u32 IsReady;
} XMem_hw;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMem_hw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMem_hw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMem_hw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMem_hw_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMem_hw_Initialize(XMem_hw *InstancePtr, u16 DeviceId);
XMem_hw_Config* XMem_hw_LookupConfig(u16 DeviceId);
int XMem_hw_CfgInitialize(XMem_hw *InstancePtr, XMem_hw_Config *ConfigPtr);
#else
int XMem_hw_Initialize(XMem_hw *InstancePtr, const char* InstanceName);
int XMem_hw_Release(XMem_hw *InstancePtr);
#endif

void XMem_hw_Start(XMem_hw *InstancePtr);
u32 XMem_hw_IsDone(XMem_hw *InstancePtr);
u32 XMem_hw_IsIdle(XMem_hw *InstancePtr);
u32 XMem_hw_IsReady(XMem_hw *InstancePtr);
void XMem_hw_EnableAutoRestart(XMem_hw *InstancePtr);
void XMem_hw_DisableAutoRestart(XMem_hw *InstancePtr);

void XMem_hw_Set_rw(XMem_hw *InstancePtr, u32 Data);
u32 XMem_hw_Get_rw(XMem_hw *InstancePtr);
void XMem_hw_Set_mask(XMem_hw *InstancePtr, u64 Data);
u64 XMem_hw_Get_mask(XMem_hw *InstancePtr);
u32 XMem_hw_Get_test_init_arr_V_BaseAddress(XMem_hw *InstancePtr);
u32 XMem_hw_Get_test_init_arr_V_HighAddress(XMem_hw *InstancePtr);
u32 XMem_hw_Get_test_init_arr_V_TotalBytes(XMem_hw *InstancePtr);
u32 XMem_hw_Get_test_init_arr_V_BitWidth(XMem_hw *InstancePtr);
u32 XMem_hw_Get_test_init_arr_V_Depth(XMem_hw *InstancePtr);
u32 XMem_hw_Write_test_init_arr_V_Words(XMem_hw *InstancePtr, int offset, int *data, int length);
u32 XMem_hw_Read_test_init_arr_V_Words(XMem_hw *InstancePtr, int offset, int *data, int length);
u32 XMem_hw_Write_test_init_arr_V_Bytes(XMem_hw *InstancePtr, int offset, char *data, int length);
u32 XMem_hw_Read_test_init_arr_V_Bytes(XMem_hw *InstancePtr, int offset, char *data, int length);

void XMem_hw_InterruptGlobalEnable(XMem_hw *InstancePtr);
void XMem_hw_InterruptGlobalDisable(XMem_hw *InstancePtr);
void XMem_hw_InterruptEnable(XMem_hw *InstancePtr, u32 Mask);
void XMem_hw_InterruptDisable(XMem_hw *InstancePtr, u32 Mask);
void XMem_hw_InterruptClear(XMem_hw *InstancePtr, u32 Mask);
u32 XMem_hw_InterruptGetEnabled(XMem_hw *InstancePtr);
u32 XMem_hw_InterruptGetStatus(XMem_hw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
