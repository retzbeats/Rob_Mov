/*
 * motors.c
 *
 * Created: 03/04/2015 01:11:12 a.m.
 *  Author: Nick
 */ 

#include "../include/motors.h"



int select_timer(int pin_pwm)
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

int select_channel(int pin_pwm)
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

void init_M1(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM)
{
	M1_A=PIN_A;
	M1_B=PIN_B;
	set_pin_as_output(M1_A);
	set_pin_as_output(M1_B);
	pwm_init(&M1_pwm, select_timer(PWM), select_channel(PWM), MOTOR_FREQ);
	pwm_start(&M1_pwm,0);
}

void init_M2(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM)
{
	M2_A=PIN_A;
	M2_B=PIN_B;
	set_pin_as_output(M2_A);
	set_pin_as_output(M2_B);
	pwm_init(&M2_pwm, select_timer(PWM), select_channel(PWM), MOTOR_FREQ);
	pwm_start(&M2_pwm,0);
}

void init_M3(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM)
{
	M3_A=PIN_A;
	M3_B=PIN_B;
	set_pin_as_output(M3_A);
	set_pin_as_output(M3_B);
	pwm_init(&M3_pwm, select_timer(PWM), select_channel(PWM), MOTOR_FREQ);
	pwm_start(&M3_pwm,0);
}

void init_M4(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM)
{
	M4_A=PIN_A;
	M4_B=PIN_B;
	set_pin_as_output(M4_A);
	set_pin_as_output(M4_B);
	pwm_init(&M4_pwm, select_timer(PWM), select_channel(PWM), MOTOR_FREQ);
	pwm_start(&M4_pwm,0);
}


void motor1(int speed)
{
	if (speed<0 )
	{
		if (MOTOR_1_DIR==FORWARD)
		{
			pin_level(M1_A,1);
			pin_level(M1_B,0);
		}
		else
		{
			pin_level(M1_A,0);
			pin_level(M1_B,1);
		}
		pwm_start(&M1_pwm, -speed);
	}
	else
	{
		if (MOTOR_1_DIR==FORWARD)
		{
			pin_level(M1_A,0);
			pin_level(M1_B,1);
		}
		else
		{
			pin_level(M1_A,1);
			pin_level(M1_B,0);
		}
		pwm_start(&M1_pwm, speed);
	}
}

void motor2(int speed)
{
	if (speed<0 )
	{
		if (MOTOR_2_DIR==FORWARD)
		{
			pin_level(M2_A,1);
			pin_level(M2_B,0);
		}
		else
		{
			pin_level(M2_A,0);
			pin_level(M2_B,1);
		}
		pwm_start(&M2_pwm, -speed);
	}
	else
	{
		if (MOTOR_2_DIR==FORWARD)
		{
			pin_level(M2_A,0);
			pin_level(M2_B,1);
		}
		else
		{
			pin_level(M2_A,1);
			pin_level(M2_B,0);
		}
		pwm_start(&M2_pwm, speed);
	}
}

void motor3(int speed)
{
	if (speed<0 )
	{
		if (MOTOR_3_DIR==FORWARD)
		{
			pin_level(M3_A,1);
			pin_level(M3_B,0);
		}
		else
		{
			pin_level(M3_A,0);
			pin_level(M3_B,1);
		}
		pwm_start(&M3_pwm, -speed);
	}
	else
	{
		if (MOTOR_3_DIR==FORWARD)
		{
			pin_level(M3_A,0);
			pin_level(M3_B,1);
		}
		else
		{
			pin_level(M3_A,1);
			pin_level(M3_B,0);
		}
		pwm_start(&M3_pwm, speed);
	}
}

void motor4(int speed)
{
	if (speed<0 )
	{
		if (MOTOR_4_DIR==FORWARD)
		{
			pin_level(M4_A,1);
			pin_level(M4_B,0);
		}
		else
		{
			pin_level(M4_A,0);
			pin_level(M4_B,1);
		}
		pwm_start(&M4_pwm, -speed);
	}
	else
	{
		if (MOTOR_4_DIR==FORWARD)
		{
			pin_level(M4_A,0);
			pin_level(M4_B,1);
		}
		else
		{
			pin_level(M4_A,1);
			pin_level(M4_B,0);
		}
		pwm_start(&M4_pwm, speed);
	}
}