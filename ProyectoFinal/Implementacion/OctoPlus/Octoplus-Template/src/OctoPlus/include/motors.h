/*
 * motors.h
 *
 * Created: 03/04/2015 01:10:58 a.m.
 *  Author: Nick
 */ 


#ifndef MOTORS_H_
#define MOTORS_H_

#include "OctoPlus/OctoPlus.h"

//Basic Definitions
#define FORWARD 1
#define BACKWARD 0

// By changing the direction of each motor from FORWARD to BACKWARD the default direction of the motor can be change without rewiring or changing a lot of code 
#define MOTOR_1_DIR FORWARD
#define MOTOR_2_DIR FORWARD
#define MOTOR_3_DIR FORWARD
#define MOTOR_4_DIR FORWARD

#define MOTOR_FREQ 10000

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

//Definitions of pins
ioport_pin_t M1_A;
ioport_pin_t M1_B;
ioport_pin_t M2_A;
ioport_pin_t M2_B;
ioport_pin_t M3_A;
ioport_pin_t M3_B;
ioport_pin_t M4_A;
ioport_pin_t M4_B;

//Definition of pwm structures
const struct pwm_config M1_pwm;
const struct pwm_config M2_pwm;
const struct pwm_config M3_pwm;
const struct pwm_config M4_pwm;

//Function Declaration
void init_M1(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM);
void init_M2(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM);
void init_M3(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM);
void init_M4(ioport_pin_t PIN_A,ioport_pin_t PIN_B, int PWM);
void motor1(int speed);
void motor2(int speed);
void motor3(int speed);
void motor4(int speed);


#endif /* MOTORS_H_ */