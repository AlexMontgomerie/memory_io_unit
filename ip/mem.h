#ifndef MEM_STREAM_H_
#define MEM_STREAM_H_

#include <assert.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include "stdlib.h"
#include "hls_video.h"

#define TYPE 0

//#define SIZE 262144
#define SIZE 1048320
#define TEST_ARR_SIZE 256

#define READ		1
#define WRITE		2

#define INIT_DONE 	1
#define RUN_DONE 	2

#define INIT 1
#define RUN  2

#define LFSR_SEED 53893933692096485

typedef ap_uint<64> 			data_t;
typedef ap_axiu<64,1,1,1> 		AXI_VAL;
typedef hls::stream<AXI_VAL> 	AXI_STREAM;

template<typename T>
T pseudo_random(bool load = false) {
#pragma HLS INLINE off
  static T lfsr;
  static int size = sizeof(T)*8;
  if (load ==1 )
    lfsr = LFSR_SEED;
  bool b_32 = lfsr.get_bit(size-32);
  bool b_22 = lfsr.get_bit(size-22);
  bool b_2 = lfsr.get_bit(size-2);
  bool b_1 = lfsr.get_bit(size-1);
  bool new_bit = b_32 ^ b_22 ^ b_2 ^ b_1;
  lfsr = lfsr >> 1;
  lfsr.set_bit((size-1), new_bit);
  return lfsr;
}

template<typename T, int U, int TI, int TD>
inline T pop_stream(ap_axiu<sizeof(T) * 8, U, TI, TD> const &e) {
  assert(sizeof(T) == sizeof(long));
  /*
  union {
    int ival;
    T oval;
  } converter;
  converter.ival = e.data;
  */
  T ret = (T) e.data;
  volatile ap_uint<sizeof(T)> strb = e.strb;
  volatile ap_uint<sizeof(T)> keep = e.keep;
  volatile ap_uint<U> user = e.user;
  volatile ap_uint<1> last = e.last;
  volatile ap_uint<TI> id = e.id;
  volatile ap_uint<TD> dest = e.dest;
  return ret;
}

template<typename T, int U, int TI, int TD>
inline ap_axiu<sizeof(T) * 8, U, TI, TD> push_stream(T const v, bool last = false) {
  ap_axiu<sizeof(T) * 8, U, TI, TD> e;
  assert(sizeof(T) == sizeof(long));
  /*
  union {
    int oval;
    T ival;
  } converter;
  converter.ival = v;
  */
  //e.data = (int) converter.oval;
  e.data = (long) v;
  // set it to sizeof(T) ones
  e.strb = -1;
  e.keep = -1; //e.strb;
  e.user = 0;
  e.last = last ? 1 : 0;
  e.id = 0;
  e.dest = 0;
  return e;
}

void mem_read(AXI_STREAM& in_stream);

void mem_write(AXI_STREAM& out_stream, int mask, data_t test_init_arr[TEST_ARR_SIZE]);

void mem_hw(AXI_STREAM& out, AXI_STREAM& in, int rw, unsigned long mask, data_t test_init_arr[TEST_ARR_SIZE]);

//hls::AXIvideo2Mat

#endif

