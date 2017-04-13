%%PID Controller
Gp = tf([13.9674/0.0116],[0,1,1/0.0116])
zoh = tf([2],[1,2/0.00116])
Gpd = feedback(zoh*Gp,1)
Gc = tf ([0.991859,1.17331],[1,0])
Gcd = c2d (Gc, 0.00116, 'tustin')