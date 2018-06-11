/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "pmbus_iic.h"
#include "xparameters.h"
#include "mem_test.h"
#include "interrupt.h"
//#include "timer.h"

#define MEM_BASE_ADDR 	0x01000000

#define OUT_0_BUFFER_BASE 	(MEM_BASE_ADDR + 0x00100000)
#define IN_0_BUFFER_BASE	(MEM_BASE_ADDR + 0x00100000 + SIZE*sizeof(data_t))

#define OUT_1_BUFFER_BASE 	(IN_0_BUFFER_BASE + SIZE*sizeof(data_t))
#define IN_1_BUFFER_BASE	(OUT_1_BUFFER_BASE + SIZE*sizeof(data_t))

#define OUT_2_BUFFER_BASE 	(IN_1_BUFFER_BASE + SIZE*sizeof(data_t))
#define IN_2_BUFFER_BASE	(OUT_2_BUFFER_BASE + SIZE*sizeof(data_t))

#define OUT_3_BUFFER_BASE 	(IN_2_BUFFER_BASE + SIZE*sizeof(data_t))
#define IN_3_BUFFER_BASE	(OUT_3_BUFFER_BASE + SIZE*sizeof(data_t))

int checkOutput(data_t out[SIZE], int test_arr[TEST_ARR_SIZE*2])
{
	Xil_DCacheInvalidateRange((UINTPTR)out, SIZE*sizeof(data_t));
	int i,j;
	int err = 0;
	for(i=0;i<(SIZE/TEST_ARR_SIZE);i++)
	{
		for(j=0;j<TEST_ARR_SIZE;j++)
		{
			data_t tmp = 0;
			tmp = ((data_t) test_arr[2*j]) | ((data_t) test_arr[2*j+1])<<32;
			//printf("out: %lu\n",out[i*TEST_ARR_SIZE+j]);
			if(out[i*TEST_ARR_SIZE+j]!=tmp)
			{
				err+=1;
			}
		}
	}
	return err;
}

int main()
{
    init_platform();

    print("Start\n\r");

    printf("sizeof data_t = %d\n",sizeof(data_t));

    print("ARRAY BASE ADDRESSES: \n\r");
    printf("OUT_0_BUFFER_BASE: 0x%X\n\r",OUT_0_BUFFER_BASE);
    printf("IN_0_BUFFER_BASE : 0x%X\n\r",IN_0_BUFFER_BASE);

    printf("OUT_1_BUFFER_BASE: 0x%X\n\r",OUT_1_BUFFER_BASE);
    printf("IN_1_BUFFER_BASE : 0x%X\n\r",IN_1_BUFFER_BASE);

    printf("OUT_2_BUFFER_BASE: 0x%X\n\r",OUT_2_BUFFER_BASE);
    printf("IN_2_BUFFER_BASE : 0x%X\n\r",IN_2_BUFFER_BASE);

    printf("OUT_3_BUFFER_BASE: 0x%X\n\r",OUT_3_BUFFER_BASE);
    printf("IN_3_BUFFER_BASE : 0x%X\n\r",IN_3_BUFFER_BASE);

    data_t * in[NUM_HW];
    data_t * out[NUM_HW];

    data_t * in_0 	= (data_t*) IN_0_BUFFER_BASE;
    data_t * out_0 	= (data_t*) OUT_0_BUFFER_BASE;

    data_t * in_1 	= (data_t*) IN_1_BUFFER_BASE;
    data_t * out_1 	= (data_t*) OUT_1_BUFFER_BASE;

    data_t * in_2	= (data_t*) IN_2_BUFFER_BASE;
    data_t * out_2 	= (data_t*) OUT_2_BUFFER_BASE;

    data_t * in_3 	= (data_t*) IN_3_BUFFER_BASE;
    data_t * out_3 	= (data_t*) OUT_3_BUFFER_BASE;

    in[0] = in_0;
    in[1] = in_1;
    in[2] = in_2;
    in[3] = in_3;

    out[0] = out_0;
    out[1] = out_1;
    out[2] = out_2;
    out[3] = out_3;

    printf("data base addr: %u\n",(unsigned int) in);

    int i,j;

    //init input array
    data_t tmp = 0;
    for(i=0;i<NUM_HW;i++) {
        for(j=0;j<SIZE;j++) {
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

        	in[i][j] = tmp;
        }
    }


    int test_arr[TEST_ARR_SIZE*2];
    setupTestArray(test_arr);

    int status = setupIic();
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to configure IIC\r\n");
        return status;
    }

    status = setupInterrupt();
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to setup interrupts\r\n");
        return status;
    }

    /*
    status = init_dma_intr(0);
    //status = init_dma();
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: cant initialise dma\r\n");
        return status;
    }



	//float data[10][TEST_MAX_SIZE][3];


    //Device functions
    SetupDevice(0, in, out,test_arr);
    StartDeviceAutoRestart(0);
    */
    //<NUM_HW
    for(i=0;i<NUM_HW;i++) {
        //status = init_dma_intr(i);
        status = init_dma(i);
        if(status != XST_SUCCESS) {
            xil_printf("ERROR: cant initialise dma\r\n");
            return status;
        }

        SetupDevice(i, in[i], out[i],test_arr);
        StartDeviceAutoRestart(i);
    }


	int size[10];
    float res[3][2];

    //size[0] = RunDeviceIntr(0, in[0], out[0], 52, 0, res);



    deviceScript(in, out);
    //deviceScriptStatic(in,out);
    //printPowerInfo();

    int err=0;
    for(i=0;i<NUM_HW;i++)
    	err += checkOutput(out[i], test_arr);

    printf("Error: %d\n",err);

    //RunDeviceAll(in,out, 53, 1, res);

    //printf("Power Test index: %d\n\r", power_table_index);

    //printPowerInfo();
    print("Done\n\r");

	fflush(stdout);

    cleanup_platform();

    return 0;
}
