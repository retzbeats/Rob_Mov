/*
 * line_sensor.c
 *
 * Created: 04/04/2015 02:53:48 p.m.
 *  Author: Nick
 */ 


#include "OctoPlus/include/line_sensor.h"

void sensor_array_init(TWI_t *TWI_PORT)
{
	twi_master_options_t opt = {
		.speed = 50000,
		.chip  = 0x20
	};
	twi_master_setup(TWI_PORT, &opt);
}

int sensor_array_read(TWI_t *TWI_PORT)
{
	
	uint8_t data_received[10];
	twi_package_t packet_read = {
		.addr         = 0xFF,      // TWI slave memory address data
		.addr_length  = 0,    // TWI slave memory address data size
		.chip         = 0x20,      // TWI slave bus address
		.buffer       = data_received,        // transfer data destination buffer
		.length       = 1                    // transfer data size (bytes)
	};
	
	if(twi_master_read(TWI_PORT, &packet_read) == TWI_SUCCESS)
	{
		return data_received[0];
	}
}

void sensor_dual_init(ioport_pin_t PIN_A,ioport_pin_t PIN_B)
{
	SENS1 = PIN_A;
	SENS2 = PIN_B;
	set_pin_as_input(SENS1);
	set_pin_as_input(SENS2);
}

void sensor_dual_read(int *sensor1, int *sensor2)
{
	*sensor1 = read_pin(SENS1);
	*sensor2 = read_pin(SENS2);
}





