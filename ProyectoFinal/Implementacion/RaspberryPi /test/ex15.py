from sys import argv

script, filename = argv

wr_ref = []
wl_ref = []
time_points = []
#txt = open(filename)

#print "Here's your file %r:" % filename
#print txt.read()

#print "Type the filename again:"
#file_again = raw_input("> ")

txt = open(filename)

data = txt.readlines()
print data

for line in data:
	words = line.split()
	time_points.append (words [0])
	wr_ref.append (words [1])
	wl_ref.append (words [2])
	
print wr_ref
print wl_ref
print time_points

# When finishing reading the file, we close it    
txt.close()

# Now that all the data inside the file has been read, and store in our arrays
#    we have to use it to create / print it in an HTML table