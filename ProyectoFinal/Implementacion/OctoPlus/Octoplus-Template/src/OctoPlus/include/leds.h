/*
 * leds.h
 *
 * DeepSea Developments
 *
 * Developed for the OctopusBot BTonly version. Open Source
 *
 * Created: 25/07/2013 11:34:40 p.m.
 *  Author: Nick
 */ 


#ifndef LEDS_H_
#define LEDS_H_

#include "../OctoPlus.h"

#define LED1 IOPORT_CREATE_PIN(PORTA, 0)
#define LED2 IOPORT_CREATE_PIN(PORTA, 1)
#define LED3 IOPORT_CREATE_PIN(PORTA, 2)
#define LED4 IOPORT_CREATE_PIN(PORTA, 3)


#define ANIMATION_MAX 100
enum{
	OFF,
	ON,
	TOGGLE
};


void leds_init(void);
void led1(int state);
void led2(int state);
void led3(int state);
void led4(int state);
void leds_state(int leds);
void animation(void);


#endif /* LEDS_H_ */