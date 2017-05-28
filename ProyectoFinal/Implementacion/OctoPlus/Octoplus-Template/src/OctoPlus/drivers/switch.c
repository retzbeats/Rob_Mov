/*
 * switch.c
 *
 * Created: 26/07/2013 10:40:52 a.m.
 *  Author: Nick
 */ 

#include "./../include/switch.h"

void switch_init(void)
{
	ioport_set_pin_dir(SW1_PIN, IOPORT_DIR_INPUT);
}

int switch_state(void)
{
	return !ioport_get_pin_level(SW1_PIN);

}