/*
 * timer.c
 *
 *  Created on: 5 Jun 2018
 *      Author: juju
 */

#include "timer.h"
#include "xparameters.h"
#include "xtmrctr.h"

XTmrCtr timer;

unsigned int calibration;
unsigned int begin_time;
unsigned int end_time;

int setup_timer(void) {

	unsigned int init_time, curr_time;

	int status = XTmrCtr_Initialize(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	if(status != XST_SUCCESS)
	{
		print("\rError: timer setup failed\n");
		return XST_FAILURE;
	}
	XTmrCtr_SetOptions(&timer, XPAR_AXI_TIMER_0_DEVICE_ID, XTC_ENABLE_ALL_OPTION);

	XTmrCtr_Reset(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	init_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	curr_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	calibration = curr_time - init_time;

	int i;

	XTmrCtr_Reset(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	begin_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	for (i = 0; i< NUM_TIMER_TEST; i++);
	end_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	int run_time_sw = end_time - begin_time - calibration;
	xil_printf("\rLoop time for %d iterations is %d cycles.\r\n", NUM_TIMER_TEST, run_time_sw);

	return XST_SUCCESS;
}

void start_timer() {
	XTmrCtr_Reset(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	begin_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
}

unsigned int end_timer() {
	end_time = XTmrCtr_GetValue(&timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	return end_time - begin_time - calibration;
}
