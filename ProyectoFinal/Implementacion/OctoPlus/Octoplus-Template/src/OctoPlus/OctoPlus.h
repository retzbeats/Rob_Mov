/*
 * OctoPlus.h
 *
 * Created: 10/08/2014 05:54:00 p.m.
 *  Author: Nick
 */ 


#ifndef OCTOPLUS_H_
#define OCTOPLUSS_H_

#include <asf.h>
#include <stdio.h>
#include "include/leds.h"
#include "include/switch.h"
#include "include/usb_serial.h"
#include "include/io_port.h"
#include "include/motors.h"
#include "include/Servo.h"
#include "include/line_sensor.h"
#include "include/gesture_ligth_sensor.h"

#define PA4 IOPORT_CREATE_PIN(PORTA, 4)
#define PA5 IOPORT_CREATE_PIN(PORTA, 5)
#define PA6 IOPORT_CREATE_PIN(PORTA, 6)
#define PA7 IOPORT_CREATE_PIN(PORTA, 7)
#define PB0 IOPORT_CREATE_PIN(PORTB, 0)
#define PB1 IOPORT_CREATE_PIN(PORTB, 1)
#define PB2 IOPORT_CREATE_PIN(PORTB, 2)
#define PB3 IOPORT_CREATE_PIN(PORTB, 3)
#define PC0 IOPORT_CREATE_PIN(PORTC, 0)
#define PC1 IOPORT_CREATE_PIN(PORTC, 1)
#define PC2 IOPORT_CREATE_PIN(PORTC, 2)
#define PC4 IOPORT_CREATE_PIN(PORTC, 4)
#define PC5 IOPORT_CREATE_PIN(PORTC, 5)
#define PC6 IOPORT_CREATE_PIN(PORTC, 6)
#define PC7 IOPORT_CREATE_PIN(PORTC, 7)
#define PD0 IOPORT_CREATE_PIN(PORTD, 0)
#define PD1 IOPORT_CREATE_PIN(PORTD, 1)
#define PD2 IOPORT_CREATE_PIN(PORTD, 2)
#define PD3 IOPORT_CREATE_PIN(PORTD, 3)
#define PD4 IOPORT_CREATE_PIN(PORTD, 4)
#define PD5 IOPORT_CREATE_PIN(PORTD, 5)
#define PE0 IOPORT_CREATE_PIN(PORTE, 0)
#define PE1 IOPORT_CREATE_PIN(PORTE, 1)
#define PE2 IOPORT_CREATE_PIN(PORTE, 2)
#define PE3 IOPORT_CREATE_PIN(PORTE, 3)
#define PR0 IOPORT_CREATE_PIN(PORTR, 0)
#define PR1 IOPORT_CREATE_PIN(PORTR, 1)

/************************************************************************/
/* Configuration in initiation. To disable one of the following options, comment it.*/
/************************************************************************/
#define ENABLE_USB
//#define ENABLE_RTC

/************************************************************************/
/* Printf and scan f function can be use with usb or Bluetooth. Choose the communication method you are going to use*/
/************************************************************************/
#define PRINTF_USB



void init_OctoPlus(void);





#endif /* OCTOPLUS_H_ */