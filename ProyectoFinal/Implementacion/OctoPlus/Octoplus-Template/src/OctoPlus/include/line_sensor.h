/*
 * line_sensor.h
 *
 * Created: 04/04/2015 02:54:06 p.m.
 *  Author: Nick
 */ 


#ifndef LINE_SENSOR_H_
#define LINE_SENSOR_H_

#include "OctoPlus/OctoPlus.h"

#define I2C_PORT &TWIE

void sensor_array_init(TWI_t *TWI_PORT);
int sensor_array_read(TWI_t *TWI_PORT);
void sensor_dual_init(ioport_pin_t PIN_A,ioport_pin_t PIN_B);
void sensor_dual_read(int *sensor1, int *sensor2);

ioport_pin_t SENS1;
ioport_pin_t SENS2;

#endif /* LINE_SENSOR_H_ */