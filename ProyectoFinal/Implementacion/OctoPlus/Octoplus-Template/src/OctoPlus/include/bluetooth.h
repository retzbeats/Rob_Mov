/*
 * bluetooth.h
 *
 * DeepSea Developments
 *
 * Developed for the OctopusBot BTonly version. Open Source
 *
 * Created: 25/07/2013 11:05:56 p.m.
 *  Author: Nick
 */ 


#ifndef BLUETOOTH_H_
#define BLUETOOTH_H_

#include "./../DomOctopus.h"

#define MAX_TIMEOUT 1000
#define AUX_DELAY 400
#define BT_RX IOPORT_CREATE_PIN(PORTD, 2)
#define BT_TX IOPORT_CREATE_PIN(PORTD, 3)
#define BLUETOOTH &USARTD0

enum{
	FALSE=0,
	TRUE
};


enum chars{
	BACKSPACE=0x08,
	TAB=0x09,
	LF=0x0A,
	CR=0x0D
	};

enum{
	FAILURE=0,
	SUCCESS
	};
	
enum{
	NOT_CONNECTED=0,
	CONNECTED 
	};

void bluetooth_init(void);
void bluetooth_init_interrupt(void);
void bluetooth_putchar(char a);
char bluetooth_getchar(void);

int bluetooth_readchar(char * a);
int bluetooth_is_rx_complete(void);
int bluetooth_get_line(char * data);
int bluetooth_read_line(char * data);
void bluetooth_write_line(char * data);

void bluetooth_enter_cmd(void);
void bluetooth_send_cmd(char * cmd);
void bluetooth_exit_cmd(void);
int bluetooth_connect2address(char * address);
int bluetooth_kill_conection(void);
int bluetooth_link_quality(void);
int bluetooth_verify_conection(void);

int compare(char* a,char* b,int length);



#ifdef PRINTF_BLUETOOTH

	int bluetooth_putchar_printf(char var, FILE *stream);
	int bluetooth_getchar_scanf(FILE *stream);
	static FILE mystdout = FDEV_SETUP_STREAM(bluetooth_putchar_printf, bluetooth_getchar_scanf, _FDEV_SETUP_RW);

#endif


/* ---------------Example of use-----------------------------
 char input;
 int aux;
 printf("Opciones del bluetooth\n");
 for(;;)
 {
 	scanf("%c",&input);
 	switch(input)
 	{
 		case '?':
 		printf("l -> link status\n");
		printf("c -> enter cmd mode\n");
		printf("q -> close cmd mode\n");
		printf("s -> connection status\n");
		break;
		case 'c':
		bluetooth_enter_cmd();
		break;
		case 'q':
		bluetooth_exit_cmd();
		break;
		case 's':
		aux=bluetooth_verify_conection();
		printf("%d\n",aux);
		break;
	}
}
*/


#endif /* BLUETOOTH_H_ */