#ifndef MEM_STREAM_H_
#define MEM_STREAM_H_

#include <assert.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include "stdlib.h"

#define TYPE 0

//#define SIZE 4096
#define SIZE 512

#define RW_READ			0
#define RW_WRITE		1
#define RW_READWRITE 	2

#define ACTIVITY_INC 	0
#define ACTIVITY_MAX 	1
#define ACTIVITY_RND 	2

#define INIT_DONE 		1
#define MEM_TEST_DONE 	2

#define LFSR_SEED 53893933692096485

typedef ap_uint<64> 		data_t;
typedef ap_axiu<64,4,5,5> 	AXI_VAL;

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

int mem_hw(AXI_VAL out[SIZE], AXI_VAL in[SIZE], int rw, unsigned long mask, int start, int test_init, data_t test_init_arr[SIZE]);

#endif

