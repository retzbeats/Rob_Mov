/*
 * Servo.h
 *
 * Created: 03/04/2015 10:35:30 p.m.
 *  Author: Nick
 */ 


#ifndef SERVO_H_
#define SERVO_H_

#include "OctoPlus/OctoPlus.h"

//Avaiable PWM ports
#define PWM_DISABLED 0
#define PWM_PC0 1
#define PWM_PC1 2
#define PWM_PC2 3
#define PWM_PC4 4
#define PWM_PC5 5
#define PWM_PD0 6
#define PWM_PD1 7
#define PWM_PD2 8
#define PWM_PD3 9
#define PWM_PD4 10
#define PWM_PD5 11
#define PWM_PE0 12
#define PWM_PE1 13
#define PWM_PE2 14
#define PWM_PE3 15

void servo_init(struct pwm_config *config,int pwm_pin);
void pwm_update(struct pwm_config *config,int duty);
int select_timer_aux(int pin_pwm);
int select_channel_aux(int pin_pwm);





#endif /* SERVO_H_ */