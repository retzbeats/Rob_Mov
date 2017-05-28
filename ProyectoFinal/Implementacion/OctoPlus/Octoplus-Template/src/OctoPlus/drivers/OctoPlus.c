/*
 * DomOctopus.c
 *
 * Created: 07/08/2014 12:16:41 p.m.
 *  Author: Nick
 *	
 * Revision A: NA
 * Revision B: NA
 * Revision C: NA
 * Revision D: NA
  *Revision E: NA
 */ 

#include "../OctoPlus.h"

void init_OctoPlus(void)
{
	sysclk_init();
	ioport_init();
	leds_init();
	switch_init();
	
	#ifdef ENABLE_RTC
		rtc_init();
	#endif
	#ifdef ENABLE_USB
		usb_init();
	#endif
	
	/************************************************************************/
	/* Direcion of IOs                                                                     */
	/************************************************************************/
// 	ioport_set_pin_dir(IO_1,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_2,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_3,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_4,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_5,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_6,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_dir(IO_7,IOPORT_DIR_OUTPUT);
// 	ioport_set_pin_mode(IO_8,IOPORT_MODE_PULLDOWN);
// 	ioport_set_pin_dir(IO_8,IOPORT_DIR_INPUT);
	
}