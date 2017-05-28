/*
 * bluetooth.c
 *
 * Created: 26/07/2013 11:11:32 a.m.
 *  Author: Nick
 */ 

#include "./../include/bluetooth.h"

/*see if 2 strings are equal. the length is the length of the word*/
int compare(char* a,char* b,int length)
{
	int i=0;
	int equal=TRUE;
	while(i<length)
	{
		if(a[i]!=b[i])
		{
			equal=FALSE;
		}
		i++;
	}
	return equal;
}

void bluetooth_init(void)
{
	ioport_set_pin_dir(BT_TX,IOPORT_DIR_OUTPUT);
	
	static usart_serial_options_t usart_options = {
		.baudrate = 115200,
		.charlength = USART_CHSIZE_8BIT_gc,
		.paritytype = USART_PMODE_DISABLED_gc,
		.stopbits = false
	};
	usart_serial_init(BLUETOOTH, &usart_options);
	
	#ifdef PRINTF_BLUETOOTH
	// setup our stdio stream
	stdout = &mystdout;
	stdin = &mystdout;
#endif
	
}

void bluetooth_init_interrupt(void)
{
	pmic_init();
	pmic_set_scheduling(PMIC_SCH_ROUND_ROBIN);
	USARTD0.CTRLA = USART_RXCINTLVL_HI_gc;
	cpu_irq_enable();
}

void bluetooth_putchar(char a)
{
	usart_putchar(BLUETOOTH,a);
}

char bluetooth_getchar(void)
{
	return usart_getchar(BLUETOOTH);
}

int bluetooth_readchar(char * a)
{
	int timeout = 0;
	while(timeout < MAX_TIMEOUT)
	{
		if(bluetooth_is_rx_complete()==true)
		{
			a = bluetooth_getchar();
			return SUCCESS;
		}
	delay_ms(1);
	timeout ++;
	}
	return FAILURE;
}

int bluetooth_is_rx_complete(void)
{
	return usart_rx_is_complete(BLUETOOTH);
}

int bluetooth_get_line(char * data)
{
	char aux;
	int i=0;
	int end=0;

	while(end==0)
	{
		aux=bluetooth_getchar();
		if (aux==0x0D)
		{
			data[i]=0;
			end=1;
		}
		else
		{
			data[i]=aux;
		}
		i+=1;
	}
	return SUCCESS;
}

int bluetooth_read_line(char * data)
{
	char aux;
	int i=0;
	int end=0;
	int timeout = 0;
	while(end==0)
	{
		timeout = 0;
		while(1)
		{
			if(bluetooth_is_rx_complete())
			{
				break;
			}
			if(timeout>MAX_TIMEOUT)
			{
				data[i]=0;
				return FAILURE;
			}
			delay_ms(1);
			timeout ++;
		}
		
		aux=bluetooth_getchar();
		if (aux==CR)
		{
			data[i]=0;
			end=1;
		}
		else
		{
			data[i]=aux;
		}
		i+=1;
	}
	return SUCCESS;
}

void bluetooth_write_line(char * string)
{
	while (*string != '\0')
	bluetooth_putchar(*string++);
}


#ifdef PRINTF_BLUETOOTH

int bluetooth_putchar_printf(char var, FILE *stream) {
	// translate \n to \r for br@y++ terminal
	if (var == '\n') bluetooth_putchar('\r');
	bluetooth_putchar(var);
	return 0;
}

int bluetooth_getchar_scanf(FILE *stream)
{
	uint8_t u8Data;
	// Wait for byte to be received
	u8Data=bluetooth_getchar();
	//echo input data
	bluetooth_putchar_printf(u8Data,stream);
	// Return received data
	return u8Data;
}

#endif




void bluetooth_enter_cmd(void)
{
	char data[6];
	bluetooth_write_line("$$$");
	delay_ms(AUX_DELAY);
	bluetooth_read_line(data); //dummy read to flush buffer
}

void bluetooth_send_cmd(char * cmd)
{
	bluetooth_write_line(cmd);
	bluetooth_putchar(CR);
	delay_ms(AUX_DELAY);
}

void bluetooth_exit_cmd(void)
{
	char data[6];
	bluetooth_send_cmd("---");
	delay_ms(AUX_DELAY);
	bluetooth_read_line(data); //dummy read to flush buffer
}

int bluetooth_connect2address(char * address)
{
	char aux[20];
	sprintf(aux,"C,%s",address);
	
	bluetooth_enter_cmd();
	bluetooth_send_cmd(aux);
}

int bluetooth_verify_conection(void)
{
	volatile int conected=NOT_CONNECTED;
	volatile int i=0;
	char data[20];
	
	bluetooth_enter_cmd();
	
	bluetooth_send_cmd("GK");

	bluetooth_read_line(data);
	if(data[0]=='1')
	{
		conected=CONNECTED;
	}
	bluetooth_exit_cmd();
	return conected;
}

int bluetooth_kill_conection(void)
{
	bluetooth_enter_cmd();
	bluetooth_send_cmd("K,");
}

int bluetooth_link_quality(void)
{
	bluetooth_send_cmd("l");
}