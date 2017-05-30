/**
 * \file
 *
 * \brief Empty user application template
 *
 */

/**
 * \mainpage User Application template doxygen documentation
 *
 * \par Empty user application template
 *
 * Bare minimum empty user application template
 *
 * \par Content
 *
 * -# Include the ASF header files (through asf.h)
 * -# "Insert system clock initialization code here" comment
 * -# Minimal main function that starts with a call to board_init()
 * -# "Insert application code here" comment
 *
 */

/*
 * Include header files for all drivers that have been imported from
 * Atmel Software Framework (ASF).
 */
#include <asf.h>
#include "OctoPlus/OctoPlus.h"




int size(int *val)
{
	int n;
	for(n=0;*val!='\0';val++)
	{
			n++;
	}	
	return n;
}

void gesture_enable_irq(void)
{
	ioport_set_pin_dir(PE2,IOPORT_DIR_INPUT);
	pmic_init();
	pmic_set_scheduling(PMIC_SCH_ROUND_ROBIN);
	cpu_irq_disable();
	PORTE.INTCTRL |= 0x01; 
	PORTE.INT0MASK = (1<<2);
	PORTE.PIN2CTRL |= (1<<1);
	cpu_irq_enable();
}
void sensor_array_enable_irq(void)
{
	pmic_init();
	pmic_set_scheduling(PMIC_SCH_ROUND_ROBIN);
	cpu_irq_disable();
	PORTE.INTCTRL |= 0x04;
	PORTE.INT1MASK = (1<<3);
	PORTE.PIN3CTRL |= (1<<1);
	cpu_irq_enable();
}
void gesture_disable_irq(void)
{
	cpu_irq_disable();
	PORTE.INTCTRL &=~(0x04);
	cpu_irq_enable();
}

void gesture_set_on(void)
{
	delay_s(2);
	if(APDS9960_init())
	{
		printf("Inicializacion Correcta\n");
	}
	else
	{
		printf("Error en inicio\n");
	}
	delay_s(1);
	if(enableGestureSensor(TRUE))
	{
		printf("Sensor de gestos activado\n");
	}
	else
	{
		printf("fallo en inicio sensor de gestos\n");
	}
	delay_s(1);
	if(setGestureIntEnable(TRUE))
	{
		printf("Interrupcion activado\n");
	}
	else
	{
		printf("fallo en inicio interrupcion\n");
	}
	
	
	
	
}

int return_gesture(void)
{
	if(isGestureAvailable())
	{
		return readGesture();
	}
}

void print_gesture(void)
{
	if(isGestureAvailable())
	{
		switch(readGesture())
		{
			case DIR_UP:
			printf("UP \n");
			break;
			case DIR_DOWN:
			printf("DOWN \n");
			break;
			case DIR_LEFT:
			printf("LEFT \n");
			break;
			case DIR_RIGHT:
			printf("RIGHT \n");
			break;
			case DIR_NEAR:
			printf("NEAR \n");
			break;
			case DIR_FAR:
			printf("FAR \n");
			break;
			default:
			printf("NONE \n");
		}
	}
	
}

ISR(PORTE_INT0_vect) //  Sensor gestos
{
	print_gesture();
	led2(TOGGLE);
}
ISR(PORTE_INT1_vect) // sensor Linea
{
	
	led1(TOGGLE);
}

//Variables globales

#define num_pulses 600
uint8_t delta_time[num_pulses];



//Comunication variables
uint16_t i_comm=0;
uint8_t pwm_l=0;
uint8_t pwm_r=0;
uint16_t sens_r=0;
uint16_t sens_l=0;
uint16_t ref_l=0;
uint16_t ref_r=0;

void pid_control_right(uint32_t ref, uint32_t sens)
{
	static int32_t e_past = 0;
	static double u_past = 0;
	static int32_t e = 0;
	static int32_t e_i = 0;
	static double u = 0;
	static int u_motor=0;
	//static double Kp=0.025; This 2 lines of code worked. saved just in case
	//u = Kp*e; //Ki*e_i;
	
	static double Kp=0.00004;//0.01054;
	static double Ki=0.0072;//19.62;
	static double KpKiT = 0.0024;//0.0022;//
	
	cli(); //Deactivate interrupts to avoid problems with the i2c communications
	if (ref>1428)
	{
		ref = 1428;
	}
	else if (ref < 1)
	{
		ref=0;
	}
	else if (ref < 150)
	{
		ref = 150;
	}
	e = ref - sens;
	sei(); //Reactivate interrupts
	u = u_past - Kp*(e-e_past) + KpKiT*e;
	e_i += e;
	
	u_motor = (int)u;
	
	if(u>99)
	{
		u=99;
	}
	else if(u < 0)
	{
		u=0;
	}
	
	//Update comunication variables
	cli(); //deactivate interruptions to avoid problem with the I2C function
	sens_l = sens;
	pwm_l = u_motor;
	sei(); //Reactivate interruptions
	
	if (ref == 0)
	{
		motor1(0);
	}
	else
	{
		motor1(u_motor);
	}
	u_past=u;
	e_past = e;
}

void pid_control_left(uint32_t ref, uint32_t sens)
{
	static int32_t e_past = 0;
	static double u_past = 0;
	static int32_t e = 0;
	static int32_t e_i = 0;
	static double u = 0;
	static int u_motor=0;
	//static double Kp=0.025; This 2 lines of code worked. saved just in case
	//u = Kp*e; //Ki*e_i;
	
	static double Kp=0.00004;//0.01054;
	static double Ki=0.0072;//19.62;
	static double KpKiT = 0.0024;//0.0022;//
	
	cli(); //Deactivate interrupts to avoid problems with the i2c communications
	if (ref>1428)
	{
		ref = 1428;
	}
	else if (ref < 1)
	{
		ref=0;
	}
	else if (ref < 150)
	{
		ref = 150;
	}
	e = ref - sens;
	sei(); //Reactivate interrupts
	u = u_past - Kp*(e-e_past) + KpKiT*e;
	e_i += e;
		
	u_motor = (int)u;
		
	if(u>99)
	{
		u=99;
	}
	else if(u < 0)
	{
		u=0;
	}
		
	//Update comunication variables
	cli(); //deactivate interruptions to avoid problem with the I2C function
	sens_l = sens;
	pwm_l = u_motor;
	i_comm++;
	if (i_comm>65500)
	{
		i_comm=0;
	}
	sei(); //Reactivate interruptions
		
	if (ref == 0)
	{
		motor2(0);
	}
	else
	{
		motor2(u_motor);
	}
	u_past=u;
	e_past = e;
}


#define TWI_SLAVE        TWIE
#define TWI_SPEED        50000
#define TWI_SLAVE_ADDR   0x60
#define DATA_LENGTH     8

TWI_Slave_t slave;

static void slave_process(void) 
{	
	switch(slave.receivedData[0])
	{
		case 0: //Write only address
			ref_l = (slave.receivedData[4] << 8) | (slave.receivedData[3]);
			ref_r = (slave.receivedData[2] << 8) | (slave.receivedData[1]);
		break;
		case 1: // Read only address
			slave.sendData[0] = (sens_r & 0x00ff);
			slave.sendData[1] = (sens_r >> 8);
			slave.sendData[2] = (sens_l & 0x00ff);
			slave.sendData[3] = (sens_l >> 8);
			slave.sendData[4] = pwm_r;
			slave.sendData[5] = pwm_l;
			slave.sendData[6] = (i_comm & 0x00ff);
			slave.sendData[7] = (i_comm >> 8);
			//slave.sendData[0] = (ref_l & 0x00ff);
			//slave.sendData[1] = (ref_l >> 8);
			//slave.sendData[2] = (ref_r & 0x00ff);
			//slave.sendData[3] = (ref_r >> 8);
		break;
	}
	led1(TOGGLE);
}

ISR(TWIE_TWIS_vect) {
	TWI_SlaveInterruptHandler(&slave);
}

void i2c_configuration()
{
	uint8_t i;
	irq_initialize_vectors();
	sysclk_enable_peripheral_clock(&TWI_SLAVE);
	TWI_SlaveInitializeDriver(&slave, &TWI_SLAVE, *slave_process);
	TWI_SlaveInitializeModule(&slave, TWI_SLAVE_ADDR, TWI_SLAVE_INTLVL_MED_gc);
	for (i = 0; i < TWIS_SEND_BUFFER_SIZE; i++) {
		slave.receivedData[i] = 0;
	}
	cpu_irq_enable();

}



int main (void)
{
	init_OctoPlus();
	animation();
	init_M1(PA4,PA5, PWM_PC0);
	init_M2(PA6,PA7, PWM_PC1);
	
	//Encoder line of Motor 1
	ioport_set_pin_dir(PC6,IOPORT_DIR_INPUT);
	ioport_set_pin_dir(PC7,IOPORT_DIR_INPUT);
	ioport_set_pin_mode(PC6,IOPORT_MODE_PULLUP);
	ioport_set_pin_mode(PC7,IOPORT_MODE_PULLUP);
	
	//Encoder line of Motor 2
	ioport_set_pin_dir(PC4,IOPORT_DIR_INPUT);
	ioport_set_pin_dir(PC5,IOPORT_DIR_INPUT);
	ioport_set_pin_mode(PC4,IOPORT_MODE_PULLUP);
	ioport_set_pin_mode(PC5,IOPORT_MODE_PULLUP);

	//I2C configuration with communication with the Raspberry pi
	i2c_configuration();
	
	//-------Timer Setup-------
	tc_enable(&TCC1); // enable the clock to the TCC0
	TCC1_PER=0xFFFF; //Set up the period to achieve the 100ms tick
	TCC1_CTRLA=TC_CLKSEL_DIV1024_gc; //Setup the preescaler.
    
	
	
	uint16_t past_counter = 0;
	uint16_t sens_right = 0;
	uint16_t sens_left = 0;
	uint16_t sensCurrent_right=0;
	uint16_t sensCurrent_left=0;
	uint16_t tick_time=0;
	uint8_t encoder_state_right = 0;
	uint8_t encoder_state_left = 0;
	TCC1_CNT = 0;
	
	motor1(0);
	motor2(0);
	
	past_counter = TCC1_CNT;

	while(1)
	{
		if (tick_time > 54)
		{
			pid_control_right(ref_r,sens_right);
			pid_control_left(ref_l,sens_left);
			tick_time = 0;
		}
		
		if (past_counter != TCC1_CNT)
		{
			
			tick_time++;
			past_counter=TCC1_CNT;
			sensCurrent_right++;
			sensCurrent_left++;
			//Check rigth encoder
			if (encoder_state_right == 1 && read_pin(PC6)==0)
			{
				if (sensCurrent_right>2999)
				{
					sensCurrent_right = 3000;
				}
				sens_right = 184200/sensCurrent_right;
				sensCurrent_right = 0;
				encoder_state_right = 0;
			}
			else if (encoder_state_right != read_pin(PC6))
			{
				encoder_state_right = 1;
			}

			//Now check left encoder
			if (encoder_state_left == 1 && read_pin(PC4)==0)
			{
				if (sensCurrent_left>2999)
				{
					sensCurrent_left = 3000;
				}
				sens_left = 2*184200/sensCurrent_left;
				sensCurrent_left = 0;
				encoder_state_left = 0;
			}
			else if (encoder_state_left != read_pin(PC4))
			{
				encoder_state_left = 1;
			}
		}
	}
}
