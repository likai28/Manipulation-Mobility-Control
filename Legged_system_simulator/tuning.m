function tuning()
h = tf([1 10],[1 71 1070 1000 0]);
kp =360;
ki = 102.5;
kd =580; 
C = pid(kp,ki,kd);
 
plant = feedback(C*h,1);
 
step(plant,100);
% show the information 
stepinfo(plant)