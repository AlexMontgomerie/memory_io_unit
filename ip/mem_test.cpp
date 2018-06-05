#include "mem.h"

#define MASK 0xFFFFFFFFFFFFFFFF
#define ID   0
#define DEST 0

//#undef SIZE
//#define SIZE 1024

void init_stream(AXI_STREAM& stream)
{
	AXI_VAL axi;
	for(int i=0;i<SIZE;i++)
	{
		axi.data = (data_t) i;
		axi.user = (i==0) 			? 1 : 0;
		axi.last = (i==(SIZE-1)) 	? 1 : 0;
		axi.id = 0;
		axi.dest = 0;

		stream << axi;
	}
}

/*
int check_stream(AXI_STREAM& stream, data_t data[SIZE])
{
	int err = 0;
	AXI_VAL axi;

	for(int i=0;i<SIZE;i++)
	{
		stream >> axi;
		err += (
				!(axi.data==(data_t) data[i]) ||
				!(axi.user==(i==0) ? 1 : 0) ||
				!(axi.last==(i==(SIZE-1)) ? 1 : 0) ||
				!(axi.dest==DEST) ||
				!(axi.id  ==ID  )
				);
		if(err)
			printf("error: %d\n",err);
		//printf("data[%d] = %ld\n",i,axi.data.to_long());

	}

	return err;
}
*/

int check_stream(AXI_STREAM& stream, data_t data[SIZE])
{
	int err = 0;
	AXI_VAL axi;

	for(int i=0;i<SIZE;i++)
	{
		stream >> axi;
		//printf("data[%d] = %ld\n",i,axi.data.to_long());

	}

	return err;
}


int main() {

	srand(1);

	AXI_VAL axi;

	int err = 0;

	int status = 0;

	printf("%d,%d,%d\n",SIZE,TEST_ARR_SIZE,SIZE/TEST_ARR_SIZE);

	//test arrays
	AXI_STREAM test_in, test_out;

	data_t test_arr[TEST_ARR_SIZE];

	//initialise test array
	for(int i=0;i<TEST_ARR_SIZE;i++)
		test_arr[i] = (data_t) i;

	//data_t res_arr[SIZE];
	data_t * res_arr;
	/*
	for(int i=0;i<((int) (SIZE/TEST_ARR_SIZE));i++)
		for(int j=0;j<TEST_ARR_SIZE;j++)
			res_arr[i*TEST_ARR_SIZE+j] = (data_t) j;
	*/
	//############################################
	//test full run
	init_stream(test_in);

	mem_hw(test_out,test_in,(READ|WRITE),MASK,test_arr);

	err = check_stream(test_out,res_arr);
	if(err)
		return err;

	printf("full run test successful \n");

	//############################################

	//############################################
	//test full run
	init_stream(test_in);

	mem_hw(test_out,test_in,WRITE,MASK,test_arr);

	err = check_stream(test_out,res_arr);

	if(err)
		return err;

	printf("full run test successful \n");

	//############################################

	printf("size: %d\n",((int) (SIZE/TEST_ARR_SIZE)));

	return err;
}
