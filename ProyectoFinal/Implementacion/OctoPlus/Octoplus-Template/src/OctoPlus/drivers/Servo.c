/*
 * Servo.c
 *
 * Created: 03/04/2015 10:35:18 p.m.
 *  Author: Nick
 */ 


#include "../include/Servo.h"

int select_timer_aux(int pin_pwm)
{
	if(pin_pwm==PWM_PC0 || pin_pwm==PWM_PC1 || pin_pwm==PWM_PC2)
	{
		return PWM_TCC0;
	}
	else if(pin_pwm==PWM_PC4 || pin_pwm==PWM_PC5)
	{
		return PWM_TCC1;
	}
	else if(pin_pwm==PWM_PD0 || pin_pwm==PWM_PD1 || pin_pwm==PWM_PD2 || pin_pwm==PWM_PD3)
	{
		return PWM_TCD0;
	}
	else if(pin_pwm==PWM_PD4 || pin_pwm==PWM_PD5)
	{
		return PWM_TCD1;
	}
	else if(pin_pwm==PWM_PE0 || pin_pwm==PWM_PE1 || pin_pwm==PWM_PE2 || pin_pwm==PWM_PE3)
	{
		return PWM_TCE0;
	}
	return FAIL;
}

int select_channel_aux(int pin_pwm)
{
	if(pin_pwm==PWM_PC0 || pin_pwm==PWM_PC4 || pin_pwm==PWM_PD0 || pin_pwm==PWM_PD4 || pin_pwm==PWM_PE0 )
	{
		return PWM_CH_A;
	}
	else if(pin_pwm==PWM_PC1 || pin_pwm==PWM_PC5 || pin_pwm==PWM_PD1 || pin_pwm==PWM_PD5 || pin_pwm==PWM_PE1)
	{
		return PWM_CH_B;
	}
	else if (pin_pwm==PWM_PC2 || pin_pwm==PWM_PD2 || pin_pwm==PWM_PE2)
	{
		return PWM_CH_C;
	}
	else if (pin_pwm==PWM_PD3 || pin_pwm==PWM_PE3)
	{
		return PWM_CH_D;
	}
	return FAIL;
}

void servo_init(struct pwm_config *config,int pwm_pin)
{
	pwm_init(config, select_timer_aux(pwm_pin), select_channel_aux(pwm_pin), 50);
	pwm_start(config,7.5);
}

//Duty Cycle between 1 and 1000
void pwm_update(struct pwm_config *config,int duty)
{
	//Assert( duty <= 1000 );
	tc_write_cc_buffer(config->tc, (enum tc_cc_channel_t)config->channel,
	(uint16_t)(((double)config->period *
	(double)duty) / 1000));
	
}
