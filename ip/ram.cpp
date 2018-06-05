#include "ram.h"

template <typename T, int U, int TI, int TD>
void ram(AXI_VAL out_stream[SIZE], AXI_VAL in_stream[SIZE], unsigned long mask, int rw, data_t test_init[SIZE])
{
  //check size of data
  assert(sizeof(T)*8 == 64);

  T w_tmp = 0;
  T r_tmp;

  for(int i=0;i<SIZE;i++)
  {
#pragma HLS PIPELINE II=1

	  switch(rw)
	  {
	  case RW_READ:
		  r_tmp = pop_stream<T,U,TI,TD>(in_stream[i]);
		  break;

	  case RW_WRITE:
		  out_stream[i] = push_stream<T,U,TI,TD>((test_init[i]), i==(SIZE-1));
		  break;

	  case RW_READWRITE:
		  r_tmp = pop_stream<T,U,TI,TD>(in_stream[i]);
		  out_stream[i] = push_stream<T,U,TI,TD>((test_init[i]), i==(SIZE-1));
		  break;

	  default:
		  r_tmp = pop_stream<T,U,TI,TD>(in_stream[i]);
		  out_stream[i] = push_stream<T,U,TI,TD>((r_tmp), i==(SIZE-1));
		  break;
	  }
  }
}

int ram_hw(data_t ram_in[SIZE])
{
	#pragma HLS INTERFACE s_axilite port=test_arr bundle=CONTROL_BUS
	#pragma HLS INTERFACE axis port=out
	#pragma HLS INTERFACE axis port=in

	static data_t tmp[SIZE];
	//#pragma HLS RESOURCE variable=tmp core=RAM_1P_BRAM

	if(test_init)
	{
		for(int i=0;i<SIZE;i++)
			tmp[i] = test_init_arr[i];
		return INIT_DONE;
	}

	if(start)
	{
		mem<data_t,4,5,5>(out,in,mask,rw,tmp);
		return MEM_TEST_DONE;
	}
	return 0;
}
