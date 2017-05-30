/*
 * leds.c
 *
 * Created: 26/07/2013 12:16:40 a.m.
 *  Author: Nick
 */ 

#include "./../include/leds.h"

void leds_init(void)
{
	ioport_set_pin_dir(LED1, IOPORT_DIR_OUTPUT);
	ioport_set_pin_dir(LED2, IOPORT_DIR_OUTPUT);
	ioport_set_pin_dir(LED3, IOPORT_DIR_OUTPUT);
	ioport_set_pin_dir(LED4, IOPORT_DIR_OUTPUT);

}

void leds_state(int leds)
{
	led1( ( leds & (1<<0) ) && (1<<0)  );
	led2( ( leds & (1<<1) ) && (1<<1)  );
	led3( ( leds & (1<<2) ) && (1<<2)  );
	led4( ( leds & (1<<3) ) && (1<<3)  );

}

void led1(int state)
{
	switch (state)
	{
		case ON:
			ioport_set_pin_level(LED1,1);
		break;
		case OFF:
			ioport_set_pin_level(LED1,0);
		break;
		case TOGGLE:
			ioport_toggle_pin_level(LED1);
		break;
	}
}

void led2(int state)
{
	switch (state)
	{
		case ON:
		ioport_set_pin_level(LED2,1);
		break;
		case OFF:
		ioport_set_pin_level(LED2,0);
		break;
		case TOGGLE:
		ioport_toggle_pin_level(LED2);
		break;
	}
}

void led3(int state)
{
	switch (state)
	{
		case ON:
		ioport_set_pin_level(LED3,1);
		break;
		case OFF:
		ioport_set_pin_level(LED3,0);
		break;
		case TOGGLE:
		ioport_toggle_pin_level(LED3);
		break;
	}
}

void led4(int state)
{
	switch (state)
	{
		case ON:
		ioport_set_pin_level(LED4,1);
		break;
		case OFF:
		ioport_set_pin_level(LED4,0);
		break;
		case TOGGLE:
		ioport_toggle_pin_level(LED4);
		break;
	}
}


void animation(void)
{
	volatile int i;
	for(i = 50;i<ANIMATION_MAX;i+=15)
	{
		led1(ON);
		delay_ms(i);
		led2(ON);
		delay_ms(i);
		led3(ON);
		delay_ms(i);
		led4(ON);
		delay_ms(i);
		
		led1(OFF);
		delay_ms(i);
		led2(OFF);
		delay_ms(i);
		led3(OFF);
		delay_ms(i);
		led4(OFF);
		delay_ms(i);
	}
}
