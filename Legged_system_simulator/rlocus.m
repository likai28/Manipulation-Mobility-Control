clear;
G=tf([0 0 0 1 10],[1 71 1070 1000 0]);
rlocus(G);

%% testing the settleing time
Kp=3.70e3;
H=tf([0 0 0 Kp 10*Kp],[1 71 1070 (1000+Kp) 10*Kp]);
step(H);
