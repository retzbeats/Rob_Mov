
#!/usr/bin/python

import smbus
import sys
import time;  # This is required to include time module.


#ticks = time.time()
#print "Number of ticks since 12:00am, January 1, 1970:", ticks


file = sys.argv[1]
#w_ref_r = int (sys.argv[2])


#parametros robot
r = 2.25	# wheel radius
l = 19	# distance between wheels

#variables
wr_ref = []
wl_ref = []
time_points = []
abs_time = 0


bus = smbus.SMBus(1)    # 0 = /dev/i2c-0 (port I2C0), 1 = /dev/i2c-1 (port I2C1)

DEVICE_ADDRESS = 0x60      #7 bit address (will be left shifted to add the read write bit)
DEVICE_REG_W_REF = 0x00
DEVICE_REG_W_REAL = 0x01

delta_t = 0.0012 # time between PID executions

#print "Type the filename to open:"
#file = raw_input("> ")

txt = open(file)
data = txt.readlines()
#print data
lenght = 0

for line in data:
	words = line.split()
	time_points.append (words [0])
	wl_ref.append (words [1])
	wr_ref.append (words [2])
	lenght = lenght+1


print wr_ref
print wl_ref
print time_points

# When finishing reading the file, we close it    
txt.close()

#Write a single register
#bus.write_byte_data(DEVICE_ADDRESS, DEVICE_REG_MODE1, 0x00)

#Write an array of registers
#w_ref_val =  [w_ref_l & 0xff, w_ref_l >> 8, w_ref_r & 0xff, w_ref_r >> 8] 
w_real_val = [0x00, 0x00, 0x00, 0x00]
#ledout_values = [0x02, 0x30, 0x02, 0x30]

#ticks_ini = time.time()
#i_ini = 0
j = 0
w_real_val = bus.read_i2c_block_data(DEVICE_ADDRESS,DEVICE_REG_W_REAL)
i_past = ((w_real_val[7] << 8) | w_real_val[6] )
print "i_past=",i_past
w_ref_val =  [int(wl_ref[j]) & 0xff, int(wl_ref[j]) >> 8, int(wr_ref[j]) & 0xff, int(wr_ref[j]) >> 8] 
bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)

while j<lenght-1 :
	w_real_val = bus.read_i2c_block_data(DEVICE_ADDRESS,DEVICE_REG_W_REAL)
	#ticks_fin = time.time()
	#i_fin = (w_real_val[7] << 8) | w_real_val[6]
	#print ((ticks_fin - ticks_ini)/(i_fin - i_ini))
	#ticks_ini = ticks_fin
	#i_ini = i_fin
	
	print int(wl_ref[j])

	
	print w_ref_val
	i = (w_real_val[7] << 8) | w_real_val[6]
	if i_past > i:
		delta_i = 65500 - i_past + i 
	else:
		delta_i = i - i_past
	print "i_actual=", i
	abs_time = abs_time + delta_i*delta_t
	i_past = i

	sense_l = ((w_real_val[3] << 8) | w_real_val[2])/100.0
	sense_r = ((w_real_val[1] << 8) | w_real_val[0])/100.0
	pwm_l = w_real_val[5]
	pwm_r = w_real_val[4]

	print "current abs_time= ", abs_time
	print "time_point=",float(time_points[j+1])
	print "resta_time=", abs_time
	print "current j=", j;
	
	while  abs_time > float(time_points[j+1]):
		j=j+1
		if j == lenght-1:
			break
	
	w_ref_val =  [int(wl_ref[j]) & 0xff, int(wl_ref[j]) >> 8, int(wr_ref[j]) & 0xff, int(wr_ref[j]) >> 8]
	bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)		

	#while  (abs_time - i_past) < float(time_points[j+1]):
	#	w_ref_val =  [int(wl_ref[j]) & 0xff, int(wl_ref[j]) >> 8, int(wr_ref[j]) & 0xff, int(wr_ref[j]) >> 8]
	#	bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)
	#	print "current abs_time= ", abs_time
	#	print "time_point=",float(time_points[j+1])
	#	print "resta_time=", abs_time - i_past
	#	print "current j=", j;
	#j=j+1

	#if abs_time >= float(time_points[j]):
	#	w_ref_val =  [int(wl_ref [j+1]) & 0xff, int(wl_ref[j+1]) >> 8, int(wr_ref[j+1]) & 0xff, int(wr_ref[j+1]) >> 8] 
	#	j= j+1
	#else:
	w_ref_val =  [int(wl_ref[j]) & 0xff, int(wl_ref[j]) >> 8, int(wr_ref[j]) & 0xff, int(wr_ref[j]) >> 8]
	bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)

	#print "i=",i;
	#print "abs_time=", abs_time
	#print "sense_l=",sense_l;
	#print "sense_r=",sense_r;
	#print "pwm_l=",pwm_l;
	#print "pwm_r=",pwm_r; 
	#print "current j=", j;
	
	#print "current wl_ref", wl_ref[j];


	#fi_dot = (sense_r - sense_l)*r/l
w_ref_val =  [0 & 0xff, 0 >> 8, 0 & 0xff, 0 >> 8]
bus.write_i2c_block_data(DEVICE_ADDRESS, DEVICE_REG_W_REF, w_ref_val)