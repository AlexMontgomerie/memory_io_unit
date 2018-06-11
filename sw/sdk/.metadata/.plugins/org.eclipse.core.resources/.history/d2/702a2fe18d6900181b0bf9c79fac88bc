/*
 * mem_test.c
 *
 *  Created on: 25 May 2018
 *      Author: juju
 */

/*
 * mem_test.c
 */

#include "mem_test.h"

volatile static int RunExample[NUM_HW] = {0,0,0,0};
volatile static int ResultExample[NUM_HW] = {0,0,0,0};

volatile int Error[NUM_HW];
volatile int TxDone[NUM_HW];
volatile int RxDone[NUM_HW];

XMem_hw_Config dev_hw_cfg[NUM_HW] = {
		{XPAR_MEM_HW_0_DEVICE_ID,XPAR_MEM_HW_0_S_AXI_CONTROL_BUS_BASEADDR},
		{XPAR_MEM_HW_1_DEVICE_ID,XPAR_MEM_HW_1_S_AXI_CONTROL_BUS_BASEADDR},
		{XPAR_MEM_HW_2_DEVICE_ID,XPAR_MEM_HW_2_S_AXI_CONTROL_BUS_BASEADDR},
		{XPAR_MEM_HW_3_DEVICE_ID,XPAR_MEM_HW_3_S_AXI_CONTROL_BUS_BASEADDR}
};
XMem_hw dev_hw[NUM_HW];
XAxiDma AxiDma[NUM_HW];

static void TxIntrHandler_0(void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */


	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[0] = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		TxDone[0] = 1;
	}
}

static void RxIntrHandler_0(void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[0] = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		RxDone[0] = 1;
	}
}

static void TxIntrHandler_1(void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */


	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[1] = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		TxDone[1] = 1;
	}
}

static void RxIntrHandler_1(void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[1] = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		RxDone[1] = 1;
	}
}

static void TxIntrHandler_2(void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */


	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[2] = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		TxDone[2] = 1;
	}
}

static void RxIntrHandler_2(void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[2] = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		RxDone[2] = 1;
	}
}

static void TxIntrHandler_3(void *Callback)
{

	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */


	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[3] = 1;

		/*
		 * Reset should never fail for transmit channel
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if (XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If Completion interrupt is asserted, then set the TxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		TxDone[3] = 1;
	}
}

static void RxIntrHandler_3(void *Callback)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		Error[3] = 1;

		/* Reset could fail and hang
		 * NEED a way to handle this or do not call it??
		 */
		XAxiDma_Reset(AxiDmaInst);

		TimeOut = RESET_TIMEOUT_COUNTER;

		while (TimeOut) {
			if(XAxiDma_ResetIsDone(AxiDmaInst)) {
				break;
			}

			TimeOut -= 1;
		}

		return;
	}

	/*
	 * If completion interrupt is asserted, then set RxDone flag
	 */
	if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		RxDone[3] = 1;
	}
}

int init_dma(int dev_num){
	XAxiDma_Config *CfgPtr;
	int status;

	int device_id = 0;

	switch(dev_num) {
#ifdef XPAR_AXI_DMA_0_DEVICE_ID
	case 0:
		device_id = XPAR_AXI_DMA_0_DEVICE_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_1_DEVICE_ID
	case 1:
		device_id = XPAR_AXI_DMA_1_DEVICE_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_2_DEVICE_ID
	case 2:
		device_id = XPAR_AXI_DMA_2_DEVICE_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_3_DEVICE_ID
	case 3:
		device_id = XPAR_AXI_DMA_3_DEVICE_ID;
		break;
#endif
	}

	CfgPtr = XAxiDma_LookupConfig(device_id);
	if(!CfgPtr){
		print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}

	status = XAxiDma_CfgInitialize(&AxiDma[dev_num],CfgPtr);
	if(status != XST_SUCCESS){
		print("Error initializing DMA\n\r");
		return XST_FAILURE;
	}
	//check for scatter gather mode
	if(XAxiDma_HasSg(&AxiDma[dev_num])){
		print("Error DMA configured in SG mode\n\r");
		return XST_FAILURE;
	}
	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Reset DMA
	XAxiDma_Reset(&AxiDma[dev_num]);
	while (!XAxiDma_ResetIsDone(&AxiDma[dev_num])) ;

	status = XAxiDma_Selftest(&AxiDma[dev_num]);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int init_dma_intr(int dev_num){
	XAxiDma_Config *CfgPtr;
	int status;

	int device_id = 0;
	int vec_s2mm_id = 0;
	int vec_mm2s_id = 0;

	switch(dev_num) {
#ifdef XPAR_AXI_DMA_0_DEVICE_ID
	case 0:
		device_id = XPAR_AXI_DMA_0_DEVICE_ID;
		vec_mm2s_id = XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID;
		vec_s2mm_id = XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_1_DEVICE_ID
	case 1:
		device_id = XPAR_AXI_DMA_1_DEVICE_ID;
		vec_mm2s_id = XPAR_FABRIC_AXIDMA_1_MM2S_INTROUT_VEC_ID;
		vec_s2mm_id = XPAR_FABRIC_AXIDMA_1_S2MM_INTROUT_VEC_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_2_DEVICE_ID
	case 2:
		device_id = XPAR_AXI_DMA_2_DEVICE_ID;
		vec_mm2s_id = XPAR_FABRIC_AXIDMA_2_MM2S_INTROUT_VEC_ID;
		vec_s2mm_id = XPAR_FABRIC_AXIDMA_2_S2MM_INTROUT_VEC_ID;
		break;
#endif

#ifdef XPAR_AXI_DMA_3_DEVICE_ID
	case 3:
		device_id = XPAR_AXI_DMA_3_DEVICE_ID;
		vec_mm2s_id = XPAR_FABRIC_AXIDMA_3_MM2S_INTROUT_VEC_ID;
		vec_s2mm_id = XPAR_FABRIC_AXIDMA_3_S2MM_INTROUT_VEC_ID;
		break;
#endif
	}

	CfgPtr = XAxiDma_LookupConfig(device_id);
	if(!CfgPtr){
		print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}

	status = XAxiDma_CfgInitialize(&AxiDma[dev_num],CfgPtr);
	if(status != XST_SUCCESS){
		print("Error initializing DMA\n\r");
		return XST_FAILURE;
	}

	XAxiDma_Reset(&AxiDma[dev_num]);
	while (!XAxiDma_ResetIsDone(&AxiDma[dev_num])) ;

	//check for scatter gather mode
	if(XAxiDma_HasSg(&AxiDma[dev_num])){
		print("Error DMA configured in SG mode\n\r");
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(&ScuGic, vec_mm2s_id, 0xA0, 0x3);
	XScuGic_SetPriorityTriggerType(&ScuGic, vec_s2mm_id, 0xA0, 0x3);

	switch(dev_num) {

	case 0:
		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID, (Xil_InterruptHandler)TxIntrHandler_0, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}

		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID, (Xil_InterruptHandler)RxIntrHandler_0, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}
		break;

	case 1:
		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_1_MM2S_INTROUT_VEC_ID, (Xil_InterruptHandler)TxIntrHandler_1, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}

		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_1_S2MM_INTROUT_VEC_ID, (Xil_InterruptHandler)RxIntrHandler_1, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}
		break;

	case 2:
		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_2_MM2S_INTROUT_VEC_ID, (Xil_InterruptHandler)TxIntrHandler_2, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}

		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_2_S2MM_INTROUT_VEC_ID, (Xil_InterruptHandler)RxIntrHandler_2, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}
		break;

	case 3:
		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_3_MM2S_INTROUT_VEC_ID, (Xil_InterruptHandler)TxIntrHandler_3, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}

		status = XScuGic_Connect(&ScuGic, XPAR_FABRIC_AXIDMA_3_S2MM_INTROUT_VEC_ID, (Xil_InterruptHandler)RxIntrHandler_3, &AxiDma[dev_num]);
		if (status != XST_SUCCESS) {
			return status;
		}
		break;
	}

	XScuGic_Enable(&ScuGic, vec_mm2s_id);
	XScuGic_Enable(&ScuGic, vec_s2mm_id);

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	/* Enable all interrupts */
	XAxiDma_IntrEnable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_IntrEnable(&AxiDma[dev_num], XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	/*
	// Reset DMA
	XAxiDma_Reset(&AxiDma);
	while (!XAxiDma_ResetIsDone(&AxiDma)) ;
	*/

	/*
	status = XAxiDma_Selftest(&AxiDma);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	*/
	return XST_SUCCESS;
}

int hwDeviceSetup(int dev_num){
	return XMem_hw_CfgInitialize(&dev_hw[dev_num], &dev_hw_cfg[dev_num]);
}

void hwDeviceStart(void *ptr){
	XMem_hw * pExample = (XMem_hw *)ptr;
	//set values here
	XMem_hw_InterruptEnable(pExample,1);
	XMem_hw_InterruptGlobalEnable(pExample);
	XMem_hw_Start(pExample);
}

void hwDeviceIsr_0(void *ptr){
	XMem_hw * pExample = (XMem_hw *)ptr;
	XMem_hw_InterruptGlobalDisable(pExample);
	XMem_hw_InterruptDisable(pExample,0xffffffff);
	XMem_hw_InterruptClear(pExample,1);
	ResultExample[0] = 1;
	if(RunExample[0])
		hwDeviceStart(pExample);
}

void hwDeviceIsr_1(void *ptr){
	XMem_hw * pExample = (XMem_hw *)ptr;
	XMem_hw_InterruptGlobalDisable(pExample);
	XMem_hw_InterruptDisable(pExample,0xffffffff);
	XMem_hw_InterruptClear(pExample,1);
	ResultExample[1] = 1;
	if(RunExample[1])
		hwDeviceStart(pExample);
}

void hwDeviceIsr_2(void *ptr){
	XMem_hw * pExample = (XMem_hw *)ptr;
	XMem_hw_InterruptGlobalDisable(pExample);
	XMem_hw_InterruptDisable(pExample,0xffffffff);
	XMem_hw_InterruptClear(pExample,1);
	ResultExample[2] = 1;
	if(RunExample[2])
		hwDeviceStart(pExample);
}

void hwDeviceIsr_3(void *ptr){
	XMem_hw * pExample = (XMem_hw *)ptr;
	XMem_hw_InterruptGlobalDisable(pExample);
	XMem_hw_InterruptDisable(pExample,0xffffffff);
	XMem_hw_InterruptClear(pExample,1);
	ResultExample[3] = 1;
	if(RunExample[3])
		hwDeviceStart(pExample);
}


int hwDeviceSetupInterrupt(int dev_num){

	int device_intr = 0;
	int result;

	switch(dev_num) {
#ifdef XPAR_FABRIC_MEM_HW_0_INTERRUPT_INTR
	case 0:
		device_intr = XPAR_FABRIC_MEM_HW_0_INTERRUPT_INTR;
		result = XScuGic_Connect(&ScuGic,device_intr,(Xil_InterruptHandler)hwDeviceIsr_0,&dev_hw[dev_num]);
		if(result != XST_SUCCESS){
			return result;
		}
		break;
#endif

#ifdef XPAR_FABRIC_MEM_HW_1_INTERRUPT_INTR
	case 1:
		device_intr = XPAR_FABRIC_MEM_HW_1_INTERRUPT_INTR;
		result = XScuGic_Connect(&ScuGic,device_intr,(Xil_InterruptHandler)hwDeviceIsr_1,&dev_hw[dev_num]);
		if(result != XST_SUCCESS){
			return result;
		}
		break;
#endif

#ifdef XPAR_FABRIC_MEM_HW_2_INTERRUPT_INTR
	case 2:
		device_intr = XPAR_FABRIC_MEM_HW_2_INTERRUPT_INTR;
		result = XScuGic_Connect(&ScuGic,device_intr,(Xil_InterruptHandler)hwDeviceIsr_2,&dev_hw[dev_num]);
		if(result != XST_SUCCESS){
			return result;
		}
		break;
#endif

#ifdef XPAR_FABRIC_MEM_HW_3_INTERRUPT_INTR
	case 3:
		device_intr = XPAR_FABRIC_MEM_HW_3_INTERRUPT_INTR;
		result = XScuGic_Connect(&ScuGic,device_intr,(Xil_InterruptHandler)hwDeviceIsr_3,&dev_hw[dev_num]);
		if(result != XST_SUCCESS){
			return result;
		}
		break;
#endif

	}

	// Connect the Adder ISR to the exception table
	//print("Connect the Adder ISR to the Exception handler table\n\r");

	//print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic,device_intr);
	return XST_SUCCESS;
}

int SetupDevice(int dev_num, data_t * in, data_t * out, int data[TEST_ARR_SIZE*2]) {
	int status = hwDeviceSetup(dev_num);
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  hwDeviceSetupInterrupt(dev_num);
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}

	XMem_hw_Set_rw(&dev_hw[dev_num]  , RW_CMD);
	XMem_hw_Set_mask(&dev_hw[dev_num], MASK);


	XMem_hw_Write_test_init_arr_V_Words(&dev_hw[dev_num], 0, data, TEST_ARR_SIZE*2);

	hwDeviceStart(&dev_hw[dev_num]);

	//flush the cache
	Xil_DCacheFlushRange((unsigned int)in ,SIZE*sizeof(data_t));
	Xil_DCacheFlushRange((unsigned int)out,SIZE*sizeof(data_t));
	print("\rCache cleared\n\r");

	return 0;
}

int StartDevice(int dev_num){
	int status = hwDeviceSetup(dev_num);
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  hwDeviceSetupInterrupt(dev_num);
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	hwDeviceStart(&dev_hw[dev_num]);
	return 0;
}

int StartDeviceAutoRestart(int dev_num){
	int status = hwDeviceSetup(dev_num);
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  hwDeviceSetupInterrupt(dev_num);
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//enable auto restart
	XMem_hw_EnableAutoRestart(&dev_hw[dev_num]);
	hwDeviceStart(&dev_hw[dev_num]);
	return 0;
}

int RunDevice(int dev_num, data_t * in, data_t * out, int devAddr, int pageAddr, float res[3][2]){

	int index=0;
	float data[TEST_MAX_SIZE][3];

	int status = XAxiDma_SimpleTransfer(&AxiDma[dev_num], (unsigned int) in, SIZE*sizeof(data_t), XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	//while (XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DMA_TO_DEVICE)) ;

	status = XAxiDma_SimpleTransfer(&AxiDma[dev_num], (unsigned int) out, SIZE*sizeof(data_t), XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	//while (XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DMA_TO_DEVICE)) ;

	startDMATransferPoll(dev_num, SIZE*sizeof(data_t));

	while ( (XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DEVICE_TO_DMA)) ||
			(XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DMA_TO_DEVICE))) {
		//do nothing for now
		if(index<TEST_MAX_SIZE) {
			getPowerInfoDevice(data, devAddr, pageAddr, index);
			index++;
			myusleep(200);
		}
	}

	getPowerInfoStatistics(data, index, res);

	return 0;
}

int RunDeviceAll(data_t * in[NUM_HW], data_t * out[NUM_HW], int devAddr, int pageAddr, float res[3][2]){

	int index=0;
	float data[TEST_MAX_SIZE][3];
	int num_loops = 50;
	int i;
	for(i=0;i<num_loops;i++)
	{
		int j;
		for(j=0;j<NUM_HW;j++)
		{
			int status = XAxiDma_SimpleTransfer(&AxiDma[j], (unsigned int) in[j], SIZE*sizeof(data_t), XAXIDMA_DMA_TO_DEVICE);
			if (status != XST_SUCCESS) {
				//print("Error: DMA transfer to Vivado HLS block failed\n");
				return XST_FAILURE;
			}
			/* Wait for transfer to be done */
			//while (XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DMA_TO_DEVICE)) ;

			status = XAxiDma_SimpleTransfer(&AxiDma[j], (unsigned int) out[j], SIZE*sizeof(data_t), XAXIDMA_DEVICE_TO_DMA);
			if (status != XST_SUCCESS) {
				//print("Error: DMA transfer to Vivado HLS block failed\n");
				return XST_FAILURE;
			}
			/* Wait for transfer to be done */
			//while (XAxiDma_Busy(&AxiDma[dev_num], XAXIDMA_DMA_TO_DEVICE)) ;
		}

		startDMATransferPollAll();
		myusleep(200);

		switch(NUM_HW) {
		case 1:
			while (
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DMA_TO_DEVICE))
			)
			{
				//do nothing for now
				if(index<TEST_MAX_SIZE) {
					getPowerInfoDevice(data, devAddr, pageAddr, index);
					index++;
					myusleep(200);
				}
			}
			break;

		case 2:
			while (
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DMA_TO_DEVICE))
			)
			{
				//do nothing for now
				if(index<TEST_MAX_SIZE) {
					getPowerInfoDevice(data, devAddr, pageAddr, index);
					index++;
					myusleep(200);
				}
			}
			break;

		case 3:
			while (
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[2], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[2], XAXIDMA_DMA_TO_DEVICE))
			)
			{
				//do nothing for now
				if(index<TEST_MAX_SIZE) {
					getPowerInfoDevice(data, devAddr, pageAddr, index);
					index++;
					myusleep(200);
				}
			}
			break;

		case 4:
			while (
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[0], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[1], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[2], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[2], XAXIDMA_DMA_TO_DEVICE)) ||
					(XAxiDma_Busy(&AxiDma[3], XAXIDMA_DEVICE_TO_DMA)) ||
					(XAxiDma_Busy(&AxiDma[3], XAXIDMA_DMA_TO_DEVICE))
			)
			{
				//do nothing for now
				if(index<TEST_MAX_SIZE) {
					getPowerInfoDevice(data, devAddr, pageAddr, index);
					index++;
					myusleep(200);
				}
			}
			break;
		}

		index--;

	}

	getPowerInfoStatistics(data, index, res);

	//printf("Vcc1V5_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[2][0],res[2][1],res[0][0],res[0][1],res[1][0],res[1][1]);

	return 0;
}


int RunDeviceAllStatic(data_t * in[NUM_HW], data_t * out[NUM_HW], int devAddr, int pageAddr, float res[3][2]){

	int index=0;
	float data[TEST_MAX_SIZE][3];
	int num_loops = 50;
	int i;
	for(i=0;i<num_loops;i++)
	{
		//do nothing for now
		if(index<TEST_MAX_SIZE) {
			getPowerInfoDevice(data, devAddr, pageAddr, index);
			index++;
			myusleep(200);
		}
	}

	getPowerInfoStatistics(data, index, res);

	//printf("Vcc1V5_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[2][0],res[2][1],res[0][0],res[0][1],res[1][0],res[1][1]);

	return 0;
}

void startDMATransferPoll(int dev_num, u32 Length) {
	XAxiDma_WriteReg(AxiDma[dev_num].TxBdRing.ChanBase,
				XAXIDMA_BUFFLEN_OFFSET, Length);

	XAxiDma_WriteReg(AxiDma[dev_num].RxBdRing[0].ChanBase,
				XAXIDMA_BUFFLEN_OFFSET, Length);
}

void startDMATransferPollAll() {
	int i;
	for(i=0;i<NUM_HW;i++)
	{
		XAxiDma_WriteReg(AxiDma[i].TxBdRing.ChanBase,
					XAXIDMA_BUFFLEN_OFFSET, SIZE*sizeof(data_t));

		XAxiDma_WriteReg(AxiDma[i].RxBdRing[0].ChanBase,
					XAXIDMA_BUFFLEN_OFFSET, SIZE*sizeof(data_t));
	}
}

int RunDeviceIntr(int dev_num, data_t * in, data_t * out, int devAddr, int pageAddr, float res[3][2]) {

	int i;
	int index=0;
	float data[TEST_MAX_SIZE][3];

	int num_loops = 1;
	for(i=0;i<num_loops;i++) {
		//print("here, run\n\r");

		TxDone[dev_num] = 0;
		RxDone[dev_num] = 0;
		Error[dev_num] = 0;

		/*
		int status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) in, SIZE*sizeof(data_t), XAXIDMA_DMA_TO_DEVICE);
		if (status != XST_SUCCESS) {
			print("Error: DMA transfer to Vivado HLS block failed\n");
			return XST_FAILURE;
		}

		status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) out, SIZE*sizeof(data_t), XAXIDMA_DEVICE_TO_DMA);
		if (status != XST_SUCCESS) {
			print("Error: DMA transfer to Vivado HLS block failed\n");
			return XST_FAILURE;
		}
		*/

		int status = DMATransferSetupMM2S(&AxiDma[dev_num], (unsigned int) in, SIZE*sizeof(data_t));
		if (status != XST_SUCCESS) {
			print("Error: DMA transfer to Vivado HLS block failed\n");
			return XST_FAILURE;
		}

		status = DMATransferSetupS2MM(&AxiDma[dev_num], (unsigned int) out, SIZE*sizeof(data_t));
		if (status != XST_SUCCESS) {
			print("Error: DMA transfer to Vivado HLS block failed\n");
			return XST_FAILURE;
		}

		startDMATransfer(&AxiDma[dev_num],SIZE*sizeof(data_t), SIZE*sizeof(data_t));

		//TODO: leave a delay of 1 i2c sample
		myusleep(200);

		while (!(TxDone[dev_num]&RxDone[dev_num]) && !Error[dev_num]) {
			//print("here\n");
			//getPowerInfo();
			//power_table_index++;
			//float power = readPowerFast(53,1);
			//printf("power: %f\n\r",power);
			if(index<TEST_MAX_SIZE) {
				getPowerInfoDevice(data, devAddr, pageAddr, index);
				index++;
				myusleep(200);
			}
		}

		if (Error[dev_num]) {
			xil_printf("Failed test transmit%s done, "
			"receive%s done\r\n", TxDone[dev_num]? "":" not",
							RxDone[dev_num]? "":" not");
			return XST_FAILURE;
		}
	}

	/*
	printf("\n\r");
	printf("Size: %d\n\r",index);

	for(i=0;i<index;i++) {
		printf("%f \t %f \t %f\n",data[i][0], data[i][1], data[i][2]);
	}
	 */

	getPowerInfoStatistics(data, index, res);

	return index;
}


void setupTestArray(int * data) {

	int i;
	data_t tmp = 0;

	for(i=0;i<TEST_ARR_SIZE;i++)
	{
		switch(TEST_TYPE) {
		case 0:
			tmp = (data_t) i;
			break;

		case 1:
			tmp = ~tmp;
			break;

		case 2:
			tmp = 0;
			break;

		default:
			tmp = 0;
			break;
		}

		tmp &= MASK;

		data[i*2] 	= (unsigned int) tmp;
		data[i*2+1] = (unsigned int) (tmp>>32);
	}
}

int DMATransferSetupMM2S(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length) {

	u32 WordBits;

	if ((Length < 1) ||
		(Length > InstancePtr->TxBdRing.MaxTransferLen)) {
		return XST_INVALID_PARAM;
	}

	if (!InstancePtr->HasMm2S) {
		xdbg_printf(XDBG_DEBUG_ERROR, "MM2S channel is not"
						"supported\r\n");

		return XST_FAILURE;
	}

	/* If the engine is doing transfer, cannot submit
	 */

	if(!(XAxiDma_ReadReg(InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_SR_OFFSET) & XAXIDMA_HALTED_MASK)) {
		if (XAxiDma_Busy(InstancePtr,XAXIDMA_DMA_TO_DEVICE)) {
			xdbg_printf(XDBG_DEBUG_ERROR,
						"Engine is busy\r\n");
			return XST_FAILURE;
		}
	}

	if (!InstancePtr->MicroDmaMode) {
		WordBits = (u32)((InstancePtr->TxBdRing.DataWidth) - 1);
	}
	else {
		WordBits = XAXIDMA_MICROMODE_MIN_BUF_ALIGN;
	}

	if ((BuffAddr & WordBits)) {

		if (!InstancePtr->TxBdRing.HasDRE) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Unaligned transfer without"
				" DRE %x\r\n",(unsigned int)BuffAddr);

			return XST_INVALID_PARAM;
		}
	}


	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
			 XAXIDMA_SRCADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	if (InstancePtr->AddrWidth > 32)
		XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
				 XAXIDMA_SRCADDR_MSB_OFFSET,
				 UPPER_32_BITS(BuffAddr));

	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_CR_OFFSET,
			XAxiDma_ReadReg(
			InstancePtr->TxBdRing.ChanBase,
			XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RUNSTOP_MASK);

	return XST_SUCCESS;
}

int DMATransferSetupS2MM(XAxiDma *InstancePtr, UINTPTR BuffAddr, u32 Length) {

	u32 WordBits;

	if ((Length < 1) ||
		(Length >
		InstancePtr->RxBdRing[0].MaxTransferLen)) {
		return XST_INVALID_PARAM;
	}


	if (!InstancePtr->HasS2Mm) {
		xdbg_printf(XDBG_DEBUG_ERROR, "S2MM channel is not"
						" supported\r\n");

		return XST_FAILURE;
	}

	if(!(XAxiDma_ReadReg(InstancePtr->RxBdRing[0].ChanBase,
			XAXIDMA_SR_OFFSET) & XAXIDMA_HALTED_MASK)) {
		if (XAxiDma_Busy(InstancePtr,XAXIDMA_DEVICE_TO_DMA)) {
			xdbg_printf(XDBG_DEBUG_ERROR,
						"Engine is busy\r\n");
			return XST_FAILURE;
		}
	}

	if (!InstancePtr->MicroDmaMode) {
		WordBits = (u32)((InstancePtr->RxBdRing[0].DataWidth) - 1);
	}
	else {
		WordBits = XAXIDMA_MICROMODE_MIN_BUF_ALIGN;
	}

	if ((BuffAddr & WordBits)) {

		if (!InstancePtr->RxBdRing[0].HasDRE) {
			xdbg_printf(XDBG_DEBUG_ERROR,
				"Unaligned transfer without"
			" DRE %x\r\n", (unsigned int)BuffAddr);

			return XST_INVALID_PARAM;
		}
	}


	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
			 XAXIDMA_DESTADDR_OFFSET, LOWER_32_BITS(BuffAddr));
	if (InstancePtr->AddrWidth > 32)
		XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
				 XAXIDMA_DESTADDR_MSB_OFFSET,
				 UPPER_32_BITS(BuffAddr));

	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
			XAXIDMA_CR_OFFSET,
		XAxiDma_ReadReg(InstancePtr->RxBdRing[0].ChanBase,
		XAXIDMA_CR_OFFSET)| XAXIDMA_CR_RUNSTOP_MASK);

	return XST_SUCCESS;
}

void startDMATransfer(XAxiDma *InstancePtr, u32 LengthMM2S, u32 LengthS2MM) {

	//MM2S
	XAxiDma_WriteReg(InstancePtr->TxBdRing.ChanBase,
				XAXIDMA_BUFFLEN_OFFSET, LengthMM2S);

	//S2MM
	XAxiDma_WriteReg(InstancePtr->RxBdRing[0].ChanBase,
				XAXIDMA_BUFFLEN_OFFSET, LengthS2MM);

}

void deviceScript(data_t * in[NUM_HW], data_t * out[NUM_HW]) {

	float res[10][3][2];
	//float data[10][TEST_MAX_SIZE][3];

	int size[10];

	//dev: 52, page: 0
    size[0] = RunDeviceAll(in, out, 52, 0, res[0]);
	//dev: 52, page: 1
    size[1] = RunDeviceAll(in, out, 52, 1, res[1]);
	//dev: 52, page: 2
    size[2] = RunDeviceAll(in, out, 52, 2, res[2]);
	//dev: 52, page: 3
    size[3] = RunDeviceAll(in, out, 52, 3, res[3]);

	//dev: 53, page: 0
    size[4] = RunDeviceAll(in, out, 53, 0, res[4]);

	//dev: 53, page: 1
    size[5] = RunDeviceAll(in, out, 53, 1, res[5]);
	//dev: 53, page: 2

    size[6] = RunDeviceAll(in, out, 53, 2, res[6]);
	//dev: 53, page: 3
    size[7] = RunDeviceAll(in, out, 53, 3, res[7]);

	//dev: 54, page: 0
    size[8] = RunDeviceAll(in, out, 54, 0, res[8]);
	//dev: 54, page: 1
    size[9] = RunDeviceAll(in, out, 54, 1, res[9]);

    /*
    int i,j,k;
    for(i=0;i<10;i++) {
    	for(k=0;k<3;k++) {
    		for(j=0;j<size[i];j++) {
    			printf("%f, ",data[i][j][k]);
    		}
    		printf("\n\r");
    	}
		printf("\n\r");
    }
    */


    //print table

	printf("VccInt \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[0][2][0],res[0][2][1],res[0][0][0],res[0][0][1],res[0][1][0],res[0][1][1]);
	printf("VccPInt \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[1][2][0],res[1][2][1],res[1][0][0],res[1][0][1],res[1][1][0],res[1][1][1]);
	printf("VccAux \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[2][2][0],res[2][2][1],res[2][0][0],res[2][0][1],res[2][1][0],res[2][1][1]);
	printf("VccPAux \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[3][2][0],res[3][2][1],res[3][0][0],res[3][0][1],res[3][1][0],res[3][1][1]);
	printf("Vadj \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",   res[4][2][0],res[4][2][1],res[4][0][0],res[4][0][1],res[4][1][0],res[4][1][1]);

	printf("Vcc1V5_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[5][2][0],res[5][2][1],res[5][0][0],res[5][0][1],res[5][1][0],res[5][1][1]);

	printf("VccMIO_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[6][2][0],res[6][2][1],res[6][0][0],res[6][0][1],res[6][1][0],res[6][1][1]);
	printf("VccBRAM \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[7][2][0],res[7][2][1],res[7][0][0],res[7][0][1],res[7][1][0],res[7][1][1]);
	printf("Vcc3V3 \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[8][2][0],res[8][2][1],res[8][0][0],res[8][0][1],res[8][1][0],res[8][1][1]);
	printf("Vcc2V5 \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[9][2][0],res[9][2][1],res[9][0][0],res[9][0][1],res[9][1][0],res[9][1][1]);

	//printf("Total Power \t: power= %f (mean), %f (var) | voltage= %f (mean), %f (var) | current= %f (mean), %f (var)\n\r",res[0][2][0],res[0][2][1],res[0][0][0],res[0][0][1],res[0][1][0],res[0][1][1]);
	print("\n\r");

	printf("%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n\r",
			res[0][2][0],
			res[1][2][0],
			res[2][2][0],
			res[3][2][0],
			res[4][2][0],
			res[5][2][0],
			res[6][2][0],
			res[7][2][0],
			res[8][2][0],
			res[9][2][0]
	);

}

void deviceScriptStatic(data_t * in[NUM_HW], data_t * out[NUM_HW]) {

	float res[10][3][2];
	//float data[10][TEST_MAX_SIZE][3];

	int size[10];

	//dev: 52, page: 0
    size[0] = RunDeviceAllStatic(in, out, 52, 0, res[0]);
	//dev: 52, page: 1
    size[1] = RunDeviceAllStatic(in, out, 52, 1, res[1]);
	//dev: 52, page: 2
    size[2] = RunDeviceAllStatic(in, out, 52, 2, res[2]);
	//dev: 52, page: 3
    size[3] = RunDeviceAllStatic(in, out, 52, 3, res[3]);

	//dev: 53, page: 0
    size[4] = RunDeviceAllStatic(in, out, 53, 0, res[4]);

	//dev: 53, page: 1
    size[5] = RunDeviceAllStatic(in, out, 53, 1, res[5]);
	//dev: 53, page: 2

    size[6] = RunDeviceAllStatic(in, out, 53, 2, res[6]);
	//dev: 53, page: 3
    size[7] = RunDeviceAllStatic(in, out, 53, 3, res[7]);

	//dev: 54, page: 0
    size[8] = RunDeviceAllStatic(in, out, 54, 0, res[8]);
	//dev: 54, page: 1
    size[9] = RunDeviceAllStatic(in, out, 54, 1, res[9]);

    /*
    int i,j,k;
    for(i=0;i<10;i++) {
    	for(k=0;k<3;k++) {
    		for(j=0;j<size[i];j++) {
    			printf("%f, ",data[i][j][k]);
    		}
    		printf("\n\r");
    	}
		printf("\n\r");
    }
    */


    //print table

	printf("VccInt \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[0][2][0],res[0][2][1],res[0][0][0],res[0][0][1],res[0][1][0],res[0][1][1]);
	printf("VccPInt \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[1][2][0],res[1][2][1],res[1][0][0],res[1][0][1],res[1][1][0],res[1][1][1]);
	printf("VccAux \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[2][2][0],res[2][2][1],res[2][0][0],res[2][0][1],res[2][1][0],res[2][1][1]);
	printf("VccPAux \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[3][2][0],res[3][2][1],res[3][0][0],res[3][0][1],res[3][1][0],res[3][1][1]);
	printf("Vadj \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",   res[4][2][0],res[4][2][1],res[4][0][0],res[4][0][1],res[4][1][0],res[4][1][1]);

	printf("Vcc1V5_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[5][2][0],res[5][2][1],res[5][0][0],res[5][0][1],res[5][1][0],res[5][1][1]);

	printf("VccMIO_PS \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",res[6][2][0],res[6][2][1],res[6][0][0],res[6][0][1],res[6][1][0],res[6][1][1]);
	printf("VccBRAM \t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r",  res[7][2][0],res[7][2][1],res[7][0][0],res[7][0][1],res[7][1][0],res[7][1][1]);
	printf("Vcc3V3 \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[8][2][0],res[8][2][1],res[8][0][0],res[8][0][1],res[8][1][0],res[8][1][1]);
	printf("Vcc2V5 \t\t: power= %f (mean), %f (var)\t | voltage= %f (mean), %f (var)\t | current= %f (mean), %f (var)\n\r", res[9][2][0],res[9][2][1],res[9][0][0],res[9][0][1],res[9][1][0],res[9][1][1]);

	//printf("Total Power \t: power= %f (mean), %f (var) | voltage= %f (mean), %f (var) | current= %f (mean), %f (var)\n\r",res[0][2][0],res[0][2][1],res[0][0][0],res[0][0][1],res[0][1][0],res[0][1][1]);
	print("\n\r");

}
