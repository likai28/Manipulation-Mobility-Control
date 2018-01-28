clear;
load('saved_data.mat')
[y_peak, index] = findpeaks(save_pose(2,:));
num = index(1);
apex1 = save_pose(:,num);
% first apex
figure
plot(save_pose(1,1:num),save_pose(2,1:num));
xlabel('x position/m')
ylabel('y position/m')
% v_x
figure
t = [0: 1: (num-1)];
subplot(1,2,1)
plot(t, save_pose(3,1:num))
title('x velocity')
xlabel('s')
ylabel('m/s')
% v_y
subplot(1,2,2)
plot(t, save_pose(4,1:num))
title('y velocity')
xlabel('s')
ylabel('m/s')