clear all
load('foot_pos_fix.mat')
foot_pose = [foot_pos_fix_x ;foot_pos_fix_y];

rotate = [cos(pi/10) sin(pi/10);-sin(pi/10) cos(pi/10)];



save_new_foot = [];
new_foot = foot_pose(:,1);


figure
axis normal;
axis ([-0.3 0.3 -0.2 0.2])
hold on


for i = 2:20

save_new_foot = [save_new_foot new_foot];
plot(new_foot(1),new_foot(2),'o','color','b') 
relative = foot_pose(:,i) - foot_pose(:,i-1);
increment  = rotate^i*relative;
new_foot = new_foot + increment;
end






    
    

