/*
 * pmbus_iic.c
 *
 *  Created on: 25 May 2018
 *      Author: juju
 */

#include "pmbus_iic.h"
#include "math.h"
#include "fcntl.h"

XIicPs iic;
XGpioPs gpio;

int power_table_addr[11][2] = {
		{52,0},
		{52,1},
		{52,2},
		{52,3},
		{53,0},
		{53,1},
		{53,2},
		{53,3},
		{54,0},
		{54,1}
};

double power_table[TABLE_SIZE][11];
int power_table_index = 0;

double default_calibration[][2] = {
		{123.5,0.0},
		{123.5,0.0},
		{123.5,0.0},
		{256.5,0.0},
		{123.5,0.0},
		{256.5,0.0},
		{123.5,0.0},
		{123.5,0.0},
		{123.5,0.0},
		{123.5,0.0}
};

struct voltage_rail zc702_rails[] = {
			{
					name			: "VccInt   ",
					device			: 52,
					page			: 0,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "VccPInt  ",
					device			: 52,
					page			: 1,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "VccAux   ",
					device			: 52,
					page			: 2,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "VccPAux  ",
					device			: 52,
					page 			: 3,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 250,
					iout_cal_gain_l : 1,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "Vadj     ",
					device			: 53,
					page			: 0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "Vcc1V5_PS",
					device			: 53,
					page			: 1,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 0x80,
					iout_cal_gain_l : 0x01,
					iout_cal_offset_u : (0x15<<3),
					iout_cal_offset_l : 1
			},
			{
					name			: "VccMIO_PS",
					device			: 53,
					page			: 2,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0

			},
			{
					name			: "VccBRAM  ",
					device			: 53,
					page			: 3,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "Vcc3V3   ",
					device			: 54,
					page			: 0,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			},
			{
					name			: "Vcc2V5   ",
					device			: 54,
					page			: 1,
					average_current	: 0.0,
					average_power	: 0.0,
					iout_cal_gain_u : 235,
					iout_cal_gain_l : 220,
					iout_cal_offset_u : 128,
					iout_cal_offset_l : 0
			}
};

void simplePowerTestStatistics(void) {
	float powerInfo[10][2][PWR_TEST_SIZE];

	int i;
	for(i=0;i<PWR_TEST_SIZE;i++){
		//device 52
		powerInfo[0][0][i] = readVoltage_real(52,0);
		powerInfo[0][1][i] = readCurrent_real(52,0);

		powerInfo[1][0][i] = readVoltage_real(52,1);
		powerInfo[1][1][i] = readCurrent_real(52,1);

		powerInfo[2][0][i] = readVoltage_real(52,2);
		powerInfo[2][1][i] = readCurrent_real(52,2);

		powerInfo[3][0][i] = readVoltage_real(52,3);
		powerInfo[3][1][i] = readCurrent_real(52,3);

		//device 53
		powerInfo[4][0][i] = readVoltage_real(53,0);
		powerInfo[4][1][i] = readCurrent_real(53,0);

		powerInfo[5][0][i] = readVoltage_real(53,1);
		powerInfo[5][1][i] = readCurrent_real(53,1);

		powerInfo[6][0][i] = readVoltage_real(53,2);
		powerInfo[6][1][i] = readCurrent_real(53,2);

		powerInfo[7][0][i] = readVoltage_real(53,3);
		powerInfo[7][1][i] = readCurrent_real(53,3);

		//device 53
		powerInfo[8][0][i] = readVoltage_real(54,0);
		powerInfo[8][1][i] = readCurrent_real(54,0);

		powerInfo[9][0][i] = readVoltage_real(54,1);
		powerInfo[9][1][i] = readCurrent_real(54,1);
	}

	float i_mean[10], v_mean[10];
	float i_var[10] , v_var[10];

	int j;
	for(i=0;i<10;i++) {
		v_mean[i] = 0;
		i_mean[i] = 0;
		for(j=0;j<PWR_TEST_SIZE;j++) {
			v_mean[i] += powerInfo[i][0][j];
			i_mean[i] += powerInfo[i][1][j];
		}
		v_mean[i] /= PWR_TEST_SIZE;
		i_mean[i] /= PWR_TEST_SIZE;
	}

	for(i=0;i<10;i++) {
		v_var[i] = 0;
		i_var[i] = 0;
		for(j=0;j<PWR_TEST_SIZE;j++) {
			v_var[i] += (powerInfo[i][0][j]-v_mean[i])*(powerInfo[i][0][j]-v_mean[i]);
			i_var[i] += (powerInfo[i][1][j]-i_mean[i])*(powerInfo[i][1][j]-i_mean[i]);
		}
		v_var[i] /= PWR_TEST_SIZE;
		i_var[i] /= PWR_TEST_SIZE;
	}

	printf("VccInt \t\t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[0],i_var[0],v_mean[0],v_var[0]);
	printf("VccPInt \t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",		i_mean[1],i_var[1],v_mean[1],v_var[1]);
	printf("VccAux \t\t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[2],i_var[2],v_mean[2],v_var[2]);
	printf("VccPAux \t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",		i_mean[3],i_var[3],v_mean[3],v_var[3]);
	printf("Vadj \t\t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",		i_mean[4],i_var[4],v_mean[4],v_var[4]);
	printf("Vcc1V5_PS \t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[5],i_var[5],v_mean[5],v_var[5]);
	printf("VccMIO_PS \t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[6],i_var[6],v_mean[6],v_var[6]);
	printf("VccBRAM \t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",		i_mean[7],i_var[7],v_mean[7],v_var[7]);
	printf("Vcc3V3 \t\t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[8],i_var[8],v_mean[8],v_var[8]);
	printf("Vcc2V5 \t\t: current = mean %f, var %f | voltage = mean %f, var %f\n\r",	i_mean[9],i_var[9],v_mean[9],v_var[9]);

	printf("VccInt \t\t: power = low %f, high %f\n\r",	(v_mean[0]-v_var[0])*(i_mean[0]-i_var[0]), (v_mean[0]+v_var[0])*(i_mean[0]+i_var[0]));
	printf("VccPInt \t: power = low %f, high %f\n\r",	(v_mean[1]-v_var[1])*(i_mean[1]-i_var[1]), (v_mean[1]+v_var[1])*(i_mean[1]+i_var[1]));
	printf("VccAux \t\t: power = low %f, high %f\n\r",	(v_mean[2]-v_var[2])*(i_mean[2]-i_var[2]), (v_mean[2]+v_var[2])*(i_mean[2]+i_var[2]));
	printf("VccPAux \t: power = low %f, high %f\n\r",	(v_mean[3]-v_var[3])*(i_mean[3]-i_var[3]), (v_mean[3]+v_var[3])*(i_mean[3]+i_var[3]));
	printf("Vadj \t\t: power = low %f, high %f\n\r",	(v_mean[4]-v_var[4])*(i_mean[4]-i_var[4]), (v_mean[4]+v_var[4])*(i_mean[4]+i_var[4]));
	printf("Vcc1V5_PS \t: power = low %f, high %f\n\r",	(v_mean[5]-v_var[5])*(i_mean[5]-i_var[5]), (v_mean[5]+v_var[5])*(i_mean[5]+i_var[5]));
	printf("VccMIO_PS \t: power = low %f, high %f\n\r",	(v_mean[6]-v_var[6])*(i_mean[6]-i_var[6]), (v_mean[6]+v_var[6])*(i_mean[6]+i_var[6]));
	printf("VccBRAM \t: power = low %f, high %f\n\r",	(v_mean[7]-v_var[7])*(i_mean[7]-i_var[7]), (v_mean[7]+v_var[7])*(i_mean[7]+i_var[7]));
	printf("Vcc3V3 \t\t: power = low %f, high %f\n\r",	(v_mean[8]-v_var[8])*(i_mean[8]-i_var[8]), (v_mean[8]+v_var[8])*(i_mean[8]+i_var[8]));
	printf("Vcc2V5 \t\t: power = low %f, high %f\n\r",	(v_mean[9]-v_var[9])*(i_mean[9]-i_var[9]), (v_mean[9]+v_var[9])*(i_mean[9]+i_var[9]));
}

inline void setupCalibration() {

    //get cal offset
    u8 i_cal_gain[2], i_cal_offset[2];

	int device;
    int page;
    int i;

    //TODO: get double values for each device's gain and offset
    for(i=0;i<10;i++) {
    	zc702_rails[i].iout_cal_gain   = linear11ToFloat(	zc702_rails[i].iout_cal_gain_u  ,
    														zc702_rails[i].iout_cal_gain_l);
    	zc702_rails[i].iout_cal_offset = linear11ToFloat(	zc702_rails[i].iout_cal_offset_u,
    														zc702_rails[i].iout_cal_offset_l);
    }

    //Initialise the gain and offset
    for(i=0;i<10;i++) {

    	device 	= zc702_rails[i].device;
    	page 	= zc702_rails[i].page;

    	i_cal_gain[1] = zc702_rails[i].iout_cal_gain_u;
    	i_cal_gain[0] = zc702_rails[i].iout_cal_gain_l;

    	i_cal_offset[1] = zc702_rails[i].iout_cal_offset_u;
    	i_cal_offset[0] = zc702_rails[i].iout_cal_offset_l;

        pmBusWrite(device, CMD_PAGE, page);
    	pmBusWriteWord(device, CMD_IOUT_CAL_GAIN  , i_cal_gain);
    	pmBusWriteWord(device, CMD_IOUT_CAL_OFFSET, i_cal_offset);

    }

    //check that it's all correct
    for(i=0;i<10;i++) {

    	device 	= zc702_rails[i].device;
    	page 	= zc702_rails[i].page;

    	printf("device: %d, page: %d\n\r",device,page);

        pmBusWrite(device, CMD_PAGE, page);
        while(pmBusRead(device, CMD_IOUT_CAL_GAIN, 2, i_cal_gain)) ;
        while(pmBusRead(device, CMD_IOUT_CAL_OFFSET, 2, i_cal_offset)) ;

    	printf("gain[1]   = %d, gain[0]   = %d\n\r",i_cal_gain[1],i_cal_gain[0]);
    	printf("offset[1] = %d, offset[0] = %d\n\r",i_cal_offset[1],i_cal_offset[0]);

    	//TODO: print in translated format
    	float gain 		= linear11ToFloat(i_cal_gain[1], i_cal_gain[0]);
    	float offset 	= linear11ToFloat(i_cal_offset[1], i_cal_offset[0]);

    	printf("gain: %f, offset: %f\n\r",gain,offset);
    }

    /*
    pmBusWrite(53, CMD_PAGE, 1);
    while(pmBusRead(53, CMD_IOUT_CAL_GAIN, 2, i_cal_gain)) ;
    pmBusWrite(53, CMD_PAGE, 1);
    while(pmBusRead(53, CMD_IOUT_CAL_OFFSET, 2, i_cal_offset)) ;

	printf("gain[1]   = %d, gain[0]   = %d\n\r",i_cal_gain[1],i_cal_gain[0]);
	printf("offset[1] = %d, offset[0] = %d\n\r",i_cal_offset[1],i_cal_offset[0]);

	i_cal_gain[1] = 1;
	i_cal_gain[0] = 0;

	i_cal_offset[1] = 0;
	i_cal_offset[0] = 0;

    pmBusWrite(53, CMD_PAGE, 1);
	pmBusWriteWord(53, CMD_IOUT_CAL_GAIN  , i_cal_gain);
    pmBusWrite(53, CMD_PAGE, 1);
	pmBusWriteWord(53, CMD_IOUT_CAL_OFFSET, i_cal_offset);

    pmBusWrite(53, CMD_PAGE, 1);
    while(pmBusRead(53, CMD_IOUT_CAL_GAIN, 2, i_cal_gain)) ;
    while(pmBusRead(53, CMD_IOUT_CAL_OFFSET, 2, i_cal_offset)) ;

	printf("gain[1]   = %d, gain[0]   = %d\n\r",i_cal_gain[1],i_cal_gain[0]);
	printf("offset[1] = %d, offset[0] = %d\n\r",i_cal_offset[1],i_cal_offset[0]);
	*/
}

int setupIic(void) {
    XIicPs_Config *config;
    int status;
	XGpioPs_Config *gpioConfig;

	gpioConfig = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
	status = XGpioPs_CfgInitialize(&gpio, gpioConfig, gpioConfig->BaseAddr);
	if(status != XST_SUCCESS) {
		return status;
	}

    /* Initialize the IIC controller */
    config = XIicPs_LookupConfig(XPAR_XIICPS_0_DEVICE_ID);
    if(config == NULL) {
        return XST_FAILURE;
    }
    config->InputClockHz = XPAR_XIICPS_0_CLOCK_HZ;
    status = XIicPs_CfgInitialize(&iic, config, config->BaseAddress);
    if(status != XST_SUCCESS) {
        return status;
    }
    status = XIicPs_SelfTest(&iic);
    if(status != XST_SUCCESS) {
        xil_printf("\r\nERROR: IIC self test failed! 0x%08X\r\n", status);
        return status;
    }
    /* Increase the default timeout value to handle clock stretching from the PMBus controllers */
    XIicPs_WriteReg(config->BaseAddress, XIICPS_TIME_OUT_OFFSET, 0x0000007f);
    XIicPs_SetSClk(&iic, 400000);

    /* Reset the IIC mux and then configure it for PMBus access */
    status = iicMuxSetup(IIC_MUX_CHANNEL_MASK);
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to configure IIC mux! 0x%08X\r\n", status);
        return status;
    }

    //get cal offset

    //setupCalibration();

    //simplePowerTestStatistics();

    return XST_SUCCESS;
}

unsigned int pmBusWrite(unsigned char address, unsigned char command, unsigned char data) {
    unsigned char writeBuffer[2];
    unsigned int status;

    /* The register address is the first byte of data sent to the IIC device,
     * followed by the data
     */
    writeBuffer[0] = command;
    writeBuffer[1] = data;

    /* Wait until the bus is available */
    while(XIicPs_BusIsBusy(&iic)) {
        /* NOP */
    }

    /* Write the data at the specified address to the IIC device */
    status =  XIicPs_MasterSendPolled(&iic, writeBuffer, 2, address);

    if(status != XST_SUCCESS) {
        xil_printf("SEND ERROR: 0x%08X\r\n", status);
        return status;
    }

    while(XIicPs_BusIsBusy(&iic)) {
        /* NOP */
    }

    myusleep(250000);

    return XST_SUCCESS;
}

unsigned char pmBusWriteWord(unsigned char address, unsigned char command, unsigned char *data) {
    unsigned int status;
    unsigned char writeBuffer[3];

    /* The register address if the first byte of data to send to the IIC device,
     * followed by the data
     */
    writeBuffer[0] = command;
    writeBuffer[1] = data[0];
    writeBuffer[2] = data[1];

    /* Wait until the bus is available */
    while(XIicPs_BusIsBusy(&iic)) ;

    status = XIicPs_MasterSendPolled(&iic, writeBuffer, 3, address);

    if(status != XST_SUCCESS) {
        xil_printf("SEND ERROR: 0x%08X\r\n", status);
        return 0;
    }

    myusleep(250000);

    return 2;
}

unsigned int pmBusRead(unsigned char address, unsigned char command, unsigned char byteCount, unsigned char *buffer) {
    unsigned int status;

    while(XIicPs_BusIsBusy(&iic)) ;

    status = XIicPs_SetOptions(&iic, XIICPS_REP_START_OPTION);
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to set repeated start option: 0x%08X\r\n", status);
        return status;
    }
    /* Send the command byte to the IIC device */
    while(XIicPs_BusIsBusy(&iic)) ;

    status = XIicPs_MasterSendPolled(&iic, &command, 1, address);
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: RX send error: 0x%08X\r\n", status);
        return status;
    }
    myusleep(10000);

    status = XIicPs_MasterRecvPolled(&iic, buffer, byteCount, address);

    if(status != XST_SUCCESS) {
        status = XIicPs_ReadReg(iic.Config.BaseAddress, XIICPS_ISR_OFFSET);
        xil_printf("ERROR: RX error: 0x%08X\r\n", status);
        return status;
    }

    status = XIicPs_ClearOptions(&iic, XIICPS_REP_START_OPTION);
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to clear repeated start option: 0x%08X\r\n", status);
        return status;
    }

    while(XIicPs_BusIsBusy(&iic)) ;

    return XST_SUCCESS;
}

unsigned char readVoltage(unsigned char deviceAddress, unsigned char pageAddress, unsigned char *receiveBuf) {
    unsigned int status;

    status = pmBusWrite(deviceAddress, CMD_PAGE, pageAddress);
    if(status != XST_SUCCESS) {
        return 0;
    }
    myusleep(10000);
    status = pmBusRead(deviceAddress, CMD_READ_VOUT, 2, receiveBuf);

    if(status != XST_SUCCESS) {
        return 0;
    }

    return 2;
}

unsigned char readCurrent(unsigned char deviceAddress, unsigned char pageAddress, unsigned char *receiveBuf) {
    unsigned int status;

    status = pmBusWrite(deviceAddress, CMD_PAGE, pageAddress);
    if(status != XST_SUCCESS) {
        return 0;
    }
    myusleep(10000);
    status = pmBusRead(deviceAddress, CMD_READ_IOUT, 2, receiveBuf);
    if(status != XST_SUCCESS) {
        return 0;
    }

    return 2;
}

float readVoltage_real(unsigned char deviceAddress, unsigned char pageAddress) {
    u8 SendArray[3];
    u16 Voltage_Data;
    u16 data;
    float voltage;
    myusleep(10000);
    Voltage_Data = readVoltage(deviceAddress,pageAddress ,SendArray);
    if(Voltage_Data!=2) {
    	print("error with data!\n\r");
    }
	//printf("v[0] = %d, v[1] = %d\n\r",SendArray[0],SendArray[1]);
    data = (u16)((SendArray[0]) | (SendArray[1]) << 8);
    voltage = (float)data*0.000244;

    return voltage;
}


double readCurrent_real(unsigned char deviceAddress, unsigned char pageAddress) {
    double current;
    u8 SendArray[3];
    u16 Current_Data;
    u16 data;
    myusleep(10000);
	Current_Data  = readCurrent(deviceAddress, pageAddress, SendArray);
    if(Current_Data!=2) {
    	print("error with data!\n\r");
    }
	//printf("exp = %x, man = %x\n\r",SendArray[1]>>3,(((u16)SendArray[1]<<8 & 0x30)|(u16)SendArray[0]));
	data = (u16)((SendArray[0]) | (SendArray[1]) << 8);
	//printf("data = %x", data);
	current = linear11ToFloat((unsigned char)SendArray[1],(unsigned char)SendArray[0]);

	//int table_index = 4*((int)deviceAddress-52)+(int)pageAddress;

	//TODO: convert using gain and offset values

	//current = (current - zc702_rails[table_index].iout_cal_offset)*(zc702_rails[table_index].iout_cal_gain/default_calibration[table_index][0]);

	//current = (current/(default_calibration[table_index][0]))*zc702_rails[table_index].iout_cal_gain - default_calibration[table_index][1] + (zc702_rails[table_index].iout_cal_offset);

	//printf("current: %f\n\r",current);
	return current;
}


/*
 * This function programs a particular voltage on rail
 *  DevAdrs - 7-bit address of the device
 *  PageAdrs - Page address of the supply voltage rail
 *  SendBufPtr - value to be programmed - expected 2 bytes in LINEAR16 format with LS followed by MS
 *  Command - VOUT_MAX or VOUT_COMMAND for voltage programming
 */
int ProgramVoltage(u8 DevAdrs, u8 PageAdrs, u8 *SendBufPtr, u8 Command)
{
    pmBusWrite(DevAdrs, CMD_PAGE, PageAdrs);
    pmBusWriteWord(DevAdrs, Command, SendBufPtr);
    //- Enable VOUT as nominal voltage programmed by VOUT_COMMAND
    if (Command == CMD_VOUT_COMMAND) {
        pmBusWrite(DevAdrs, CMD_OPERATION, OP_MODE_NOM);
    }
    return XST_SUCCESS;
}


void iicMuxReset(void) {

	XGpioPs_SetDirectionPin(&gpio, IIC_MUX_RESET_B_PIN, 0);
    XGpioPs_SetDirectionPin(&gpio, IIC_MUX_RESET_B_PIN, 1);
    XGpioPs_SetOutputEnablePin(&gpio, IIC_MUX_RESET_B_PIN, 1);

    XGpioPs_WritePin(&gpio, IIC_MUX_RESET_B_PIN, 0);
    XGpioPs_WritePin(&gpio, LED_PIN, 0);

    myusleep(1000000);

    XGpioPs_WritePin(&gpio, IIC_MUX_RESET_B_PIN, 1);
    XGpioPs_WritePin(&gpio, LED_PIN, 1);
    myusleep(100000);
}


int iicMuxSetup(unsigned char channelMask) {
    int status;
    unsigned char buffer;

    buffer = channelMask;

    /* First we need to reset the IIC mux to bring it back to a known state */
    iicMuxReset();

    /* Wait until the IIC bus is idle */
    while(XIicPs_BusIsBusy(&iic)) {
        /* NOP */
    }

    status = XIicPs_MasterSendPolled(&iic, &buffer, 1, IIC_MUX_ADDRESS);
    if(status != XST_SUCCESS) {
        xil_printf("ERROR: Unable to configure IIC mux! 0x%08X\r\n", status);
        return status;
    }

    myusleep(10000);

    status = XIicPs_MasterRecvPolled(&iic, &buffer, 1, IIC_MUX_ADDRESS);

    if(buffer != channelMask) {
        xil_printf("ERROR: IIC mux read back 0x%02X expected 0x%02X\r\n", buffer, channelMask);
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

int myusleep(unsigned int useconds) {
    unsigned long tEnd, tCur;
    unsigned int reg;

    /* check requested delay for out of range */

    if (useconds == 0) {
        return 0;
    }

    if (((COUNTS_PER_SECOND / 1000000) > 0) &&
            (useconds > (0xFFFFFFFF / (COUNTS_PER_SECOND / 1000000)))) {
        return -1;
    }

    /* enable the counter */
    mtcp(XREG_CP15_PERF_MONITOR_CTRL, 1);
#ifdef __GNUC__
    reg = mfcp(XREG_CP15_COUNT_ENABLE_SET);
#else
    { register unsigned int Reg __asm(XREG_CP15_COUNT_ENABLE_SET);
    reg = Reg; }
#endif
    mtcp(XREG_CP15_COUNT_ENABLE_SET, reg | 0x80000000);

#ifdef __GNUC__
    tCur = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);
#else
    { register unsigned int Reg __asm(XREG_CP15_PERF_CYCLE_COUNTER);
    tCur = Reg; }
#endif
    tEnd = tCur + (useconds * (COUNTS_PER_SECOND / 1000000));

    do {
#ifdef __GNUC__
        tCur = mfcp(XREG_CP15_PERF_CYCLE_COUNTER);
#else
        { register unsigned int Reg __asm(XREG_CP15_PERF_CYCLE_COUNTER);
        tCur = Reg; }
#endif
    } while (tCur < tEnd);

    return 0;
}

double linear11ToFloat(unsigned char highByte, unsigned char lowByte) {
	unsigned short combinedWord;
	signed char exponent;
	signed short mantissa;
	double current;


	combinedWord = highByte;
	combinedWord <<= 8;
	combinedWord += lowByte;

	exponent = combinedWord >> 11;
	mantissa = combinedWord & 0x7ff;


	/* Sign extend the exponent and the mantissa */
	/* Sign extend the exponent and the mantissa */

    if(exponent > 0x0f) {
		exponent |= 0xe0;
	}
	if(mantissa > 0x03ff) {
		mantissa |= 0xf800;
	}
    //xil_printf("%f--------%f",mantissa,exponent );
	current = mantissa * pow(2.0,exponent);
	return (float)current;
}

void displayPower() {
	float voltage;
	double current;
	double power;
	int i;
	double total_power;

	int power_elements = sizeof(zc702_rails) / sizeof(struct voltage_rail);

	printf("|---------------------------------------------------------------|\n");
	printf("|                          Power Monitor APP                    |\n");
	printf("|RAIL            |  Voltage(V)   |   Current(mA)  |   Power(mW) |\n");
	printf("|---------------------------------------------------------------|\n");

	for(i = 0; i < power_elements; i++) {
		voltage = readVoltage_real(zc702_rails[i].device, zc702_rails[i].page);
		current = readCurrent_real(zc702_rails[i].device, zc702_rails[i].page) ;
		power = voltage * current * 1000;
		total_power+=power;
		zc702_rails[i].average_current = current;
		zc702_rails[i].average_power = power;
		printf("|%s \t | %f V\t | %f \t|   %.4f \t|\n",zc702_rails[i].name,voltage,zc702_rails[i].average_current* 1000,zc702_rails[i].average_power);
	}
    printf("|TOTAL POWER  %f mW |\n",total_power);
	printf("|---------------------------------------------------------------|\n");
}

void getPowerInfo() {
	float voltage;
	double current;
	double power;
	int i;
	double total_power = 0;

	for(i=0;i<10;i++) {
		voltage = readVoltage_real(power_table_addr[i][0], power_table_addr[i][1]);
		current = readCurrent_real(power_table_addr[i][0], power_table_addr[i][1]);
		power = voltage * current * 1000;
		total_power+=power;
		power_table[power_table_index][i] = power;
	}
	power_table[power_table_index][10] = total_power;
}

void printPowerInfo() {
	int i=0;

	for(i=0;i<power_table_index;i++) {
		printf("VccInt \t\t: %f\n\r",	power_table[i][0]);
		printf("VccPInt \t: %f\n\r",power_table[i][1]);
		printf("VccAux \t\t: %f\n\r",	power_table[i][2]);
		printf("VccPAux \t: %f\n\r",power_table[i][3]);
		printf("Vadj \t\t: %f\n\r",	power_table[i][4]);
		printf("Vcc1V5_PS \t: %f\n\r",	power_table[i][5]);
		printf("VccMIO_PS \t: %f\n\r",	power_table[i][6]);
		printf("VccBRAM \t: %f\n\r",	power_table[i][7]);
		printf("Vcc3V3 \t\t: %f\n\r",	power_table[i][8]);
		printf("Vcc2V5 \t\t: %f\n\r",	power_table[i][9]);
		printf("Total Power \t: %f\n\r",power_table[i][10]);
		print("\n\r");
	}
}

//TODO: function to get i,v,p from device for a device number and page
void getPowerInfoDevice(float data[TEST_MAX_SIZE][3], int devAddr, int pageAddr, int index) {
	data[index][0] = readVoltage_real(devAddr, pageAddr);
	data[index][1] = readCurrent_real(devAddr, pageAddr);
	data[index][2] = data[index][0]*data[index][1]*1000;
}

//TODO: function to get average and variance for above data type
void getPowerInfoStatistics(float data[TEST_MAX_SIZE][3], int size, float res[3][2]) {
	float p_mean=0, p_var=0;
	float v_mean=0, v_var=0;
	float i_mean=0, i_var=0;

	int i;
	for(i=0;i<size;i++) {
		v_mean+=data[i][0];
		i_mean+=data[i][1];
		p_mean+=data[i][2];
	}

	v_mean/=size;
	i_mean/=size;
	p_mean/=size;

	for(i=0;i<size;i++) {
		v_var += (data[i][0]-v_mean)*(data[i][0]-v_mean);
		i_var += (data[i][1]-i_mean)*(data[i][1]-i_mean);
		p_var += (data[i][2]-p_mean)*(data[i][2]-p_mean);
	}

	v_var/=size;
	i_var/=size;
	p_var/=size;

	res[0][0] = v_mean;
	res[0][1] = v_var;

	res[1][0] = i_mean;
	res[1][1] = i_var;

	res[2][0] = p_mean;
	res[2][1] = p_var;
}

