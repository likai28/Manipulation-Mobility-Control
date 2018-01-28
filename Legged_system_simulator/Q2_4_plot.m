% This file is used to creat plot for Q2_4
load('apex_60.mat');
load('apex_68.mat');
load('apex_75.mat');
saved_apex_68 = Q2_4(68);
save('apex_68.mat','saved_apex_68');
saved_apex_60 = Q2_4(60);
save('apex_60.mat','saved_apex_60');
saved_apex_75 = Q2_4(75);
save('apex_75.mat','saved_apex_75');
plot(saved_apex_68(1,:),saved_apex_68(2,:),'r');
hold on; 
plot(saved_apex_60(1,:),saved_apex_60(2,:),'g');
hold on;
plot(saved_apex_75(1,:),saved_apex_75(2,:),'b');
hold on;
plot([0,3],[0,3],'y');
axis([0,3,0.8,2.5]);
