/*
 * io_port.c
 *
 * Created: 21/03/2015 03:05:34 p.m.
 *  Author: Nick
 */ 

#include "./../include/io_port.h"

void set_pin_as_output(ioport_pin_t pin)
{
	ioport_set_pin_dir(pin,IOPORT_DIR_OUTPUT);
}
void set_pin_as_input(ioport_pin_t pin)
{
	ioport_set_pin_dir(pin,IOPORT_DIR_INPUT);
}
int pin_state(ioport_pin_t pin)
{
	return ioport_get_pin_level(pin);
}

void set_pin_as_pulldown(ioport_pin_t pin)
{
	ioport_set_pin_mode(pin,IOPORT_MODE_PULLDOWN);
}

void set_pin_as_pullup(ioport_pin_t pin)
{
	ioport_set_pin_mode(pin,IOPORT_MODE_PULLUP);
}

void set(ioport_pin_t pin)
{
	ioport_set_pin_level(pin,1);
}
void reset(ioport_pin_t pin)
{
	ioport_set_pin_level(pin,0);
}
void pin_level(ioport_pin_t pin, int level)
{
	ioport_set_pin_level(pin,level);
}

int read_pin(ioport_pin_t pin)
{
	return ioport_get_pin_level(pin);
}