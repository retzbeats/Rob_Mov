
#!/usr/bin/python

import smbus
import sys
import time;  # This is required to include time module.


#ticks = time.time()
#print "Number of ticks since 12:00am, January 1, 1970:", ticks

arg1 = int(sys.argv[1])
arg2 = int (sys.argv[2])

#parametros robot
r = 5	# wheel radius
l = 15	# distance between wheels



bus = smbus.SMBus(1)    # 0 = /dev/i2c-0 (port I2C0), 1 = /dev/i2c-1 (port I2C1)

DEVICE_ADDRESS = 0x60      #7 bit address (will be left shifted to add the read write bit)

DEVICE_REG_W_REF = 0x00
DEVICE_REG_W_REAL = 0x01

delta_t = 0.0012 # time between PID executions

#Write a single register
#bus.write_byte_data(DEVICE_ADDRESS, DEVICE_REG_MODE1, 0x00)

#Write an array of registers
w_ref_val = [arg1 & 0xff, arg1 >> 8, arg2 & 0xff, arg2 >> 8] 
w_real_val = [0x00, 0x00, 0x00, 0x00]
#ledout_values = [0x02, 0x30, 0x02, 0x30]
bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)
#ticks_ini = time.time()
#i_ini = 0

while 1 :
	 w_real_val = bus.read_i2c_block_data(DEVICE_ADDRESS,DEVICE_REG_W_REAL)
	 #ticks_fin = time.time()
	 #i_fin = (w_real_val[7] << 8) | w_real_val[6]
	 #print ((ticks_fin - ticks_ini)/(i_fin - i_ini))
	 #ticks_ini = ticks_fin
	 #i_ini = i_fin
	 i = (w_real_val[7] << 8) | w_real_val[6]
	 abs_time = i*delta_t
	 sense_l = ((w_real_val[3] << 8) | w_real_val[2])/100.0
	 sense_r = ((w_real_val[1] << 8) | w_real_val[0])/100.0
	 pwm_l = w_real_val[5]
	 pwm_r = w_real_val[4]
	 print "i=",i;
	 print "abs_time=", abs_time
	 print "sense_l=",sense_l;
	 print "sense_r=",sense_r;
	 print "pwm_l=",pwm_l;
	 print "pwm_r=",pwm_r; 

	#fi_dot = (sense_r - sense_l)*r/l
	