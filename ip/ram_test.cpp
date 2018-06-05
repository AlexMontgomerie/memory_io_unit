#include "mem.h"

#define MASK 0xFFFFFFFFFFFFFFFF

int main() {

	srand(1);

	//test arrays
	AXI_VAL test_in[SIZE], test_out[SIZE];

	data_t test_arr[SIZE];

	//initialise test array
	for(int i=0;i<SIZE;i++)
		test_arr[i] = (data_t) i;

	int last = 0;
	//initialise test_in array
	for(int i;i<SIZE;i++)
	{
		if(i==(SIZE-1))
			last = 1;
		test_in[i].data = (data_t) i;
		test_in[i].user = 0;
		test_in[i].last = last ? 1 : 0;
		test_in[i].id = 0;
		test_in[i].dest = 0;
	}

	int err = 0;

	//test init

	int status = mem_hw(test_out,test_in,3,MASK,0,1,test_arr);
	if(status!=INIT_DONE)
	{
		printf("error initialising test\n");
		return 1;
	}

	status = mem_hw(test_out,test_in,3,MASK,1,0,test_arr);
	if(status!=MEM_TEST_DONE)
	{
		printf("error running test\n");
		return 1;
	}

	for(int i;i<SIZE;i++)
	{
		err = (
				!(test_out[i].data==test_in[i].data) ||
				!(test_out[i].user==test_in[i].user) ||
				!(test_out[i].id  ==test_in[i].id  ) ||
				!(test_out[i].dest==test_in[i].dest)
				);
	}
	if(err)
		return err;

	printf("read and write only test successful \n");

	printf("mask test successful \n");

	return err;
}
