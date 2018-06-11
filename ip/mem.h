#ifndef MEM_STREAM_H_
#define MEM_STREAM_H_

#include <assert.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include "stdlib.h"
#include "hls_stream.h"

#define TYPE 0

//#define SIZE 262144
#define SIZE 1048320
//#define SIZE 16
#define TEST_ARR_SIZE 256
//#define TEST_ARR_SIZE 8

#define READ		1
#define WRITE		2

#define INIT_DONE 	1
#define RUN_DONE 	2

#define INIT 1
#define RUN  2

#define LFSR_SEED 53893933692096485

typedef ap_uint<32> 			data_t;
typedef ap_axiu<32,1,1,1> 		AXI_VAL;
typedef hls::stream<AXI_VAL> 	AXI_STREAM;

void mem_read(AXI_STREAM& in_stream);

void mem_write(AXI_STREAM& out_stream, int mask, data_t test_init_arr[TEST_ARR_SIZE]);

void mem_hw(AXI_STREAM& out, AXI_STREAM& in, int rw, unsigned int mask, data_t test_init_arr[TEST_ARR_SIZE]);

//hls::AXIvideo2Mat

#endif

