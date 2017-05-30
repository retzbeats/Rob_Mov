/*
 * io_port.h
 *
 * Created: 21/03/2015 03:05:56 p.m.
 *  Author: Nick
 */ 


#ifndef IO_PORT_H_
#define IO_PORT_H_

#include "OctoPlus/OctoPlus.h"

void set_pin_as_output(ioport_pin_t pin);
void set_pin_as_input(ioport_pin_t pin);
int pin_state(ioport_pin_t pin);
void set_pin_as_pulldown(ioport_pin_t pin);
void set_pin_as_pullup(ioport_pin_t pin);
void set(ioport_pin_t pin);
void reset(ioport_pin_t pin);
void pin_level(ioport_pin_t pin, int level);
int read_pin(ioport_pin_t pin);

#endif /* IO_PORT_H_ */