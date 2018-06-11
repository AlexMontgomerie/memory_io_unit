/*
 * timer.c
 *
 *  Created on: 5 Jun 2018
 *      Author: juju
 */

#include "timer.h"
#include "xparameters.h"

XTmrCtr timer;

int setup_timer(void) {
	int status = XTmrCtr_Initialize(&timer, XPAR_AXI_TIMER_DEVICE_ID);
	if(status != XST_SUCCESS)
	{
		print("\rError: timer setup failed\n");
		return XST_FAILURE;
	}
	XTmrCtr_SetOptions(&timer, XPAR_AXI_TIMER_DEVICE_ID, XTC_ENABLE_ALL_OPTION);

	XTmrCtr_Reset(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	init_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	curr_time = XTmrCtr_GetValue(&timer_dev, XPAR_AXI_TIMER_DEVICE_ID);
	calibration = curr_time - init_time;
}
