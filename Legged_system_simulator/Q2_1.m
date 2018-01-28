function Q2_1
clear all; close all; clc

  m=80;
  k=20000;
  l0=1;
  g=9.8;
  alpha = pi*68/180;
  mass_pose = [0;1;5;0];
  foot_pose = [0;0;0;0];
            
  save_pose = [];
  state=1;
  tspan = [0:0.0001:0.002]; 
 
 
  load('circle_cor.mat')
  figure;
  axis normal;
  axis([0 11 0 2]);
  grid on;
  hold on;
  h = patch('XData',cir_x, 'YData', cir_y); % COG
  
for t=1:0.001:2
    
    switch state
        case 1 
            % Flight
           

            save_pose = [save_pose mass_pose];
            relative_pose = mass_pose - foot_pose;
            options = odeset('Events',@event_function);
            [t,relative_pose,TE,VE] = ode45(@flying_situation,tspan,relative_pose,options);
            
            relative_pose=relative_pose(end,:);
            relative_pose=relative_pose';
   
            mass_pose = relative_pose + foot_pose;
             
            set(h,'XData', cir_x+mass_pose(1) ,'YData', cir_y+mass_pose(2));
            plot(mass_pose(1),mass_pose(2),'.')
%             p = line([mass_pose(1) foot_pose(1)],[mass_pose(2) foot_pose(2)]);
            drawnow
%            delete(p);
            
            if(relative_pose(2)<l0*sin(alpha) && relative_pose(4)<0)
            state = 2;
             foot_pose(1) = mass_pose(1) + l0*cos(alpha);
            foot_pose(2) = mass_pose(2) - l0*sin(alpha);
           
            end
      
        
        case 2 
            % Stance
            
            save_pose = [save_pose mass_pose];
            relative_pose = mass_pose - foot_pose;
            
            options = odeset('Events',@event_function2);
            [t,relative_pose,TE,VE] = ode45(@stance_situation,tspan,relative_pose,options);

            relative_pose = relative_pose(end,:);
            relative_pose = relative_pose';
            mass_pose = relative_pose + foot_pose;
 
            set(h,'XData',  cir_x+mass_pose(1), 'YData', cir_y +mass_pose(2));
            plot(mass_pose(1),mass_pose(2),'.','color','r')

            p = line([mass_pose(1) foot_pose(1)],[mass_pose(2) foot_pose(2)]);
            drawnow
            
            delete(p);
            if(sqrt(relative_pose(1)^2+relative_pose(2)^2)>l0 && relative_pose(4)>0)
              state = 1;    
%                foot_pose(1) = mass_pose(1) - l0*cos(1.1*alpha);
%                foot_pose(2) = mass_pose(2) - l0*sin(1.1*alpha);
            
            end

    end  
end
save('saved_data.mat','save_pose');




