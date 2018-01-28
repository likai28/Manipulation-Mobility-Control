 function [saved_apex]= Q2_4(alpha_degree) 
  m=80;
  k=20000;
  l0=1;
  g=9.8;
  alpha = pi*alpha_degree/180;
  energy  = 0.5*m*5^2 + m*g*1;
  mass_pose=zeros(4,1);
  saved_apex = [];
  
 for i=1:30
      i
     init_y = 0.8+ (i-1)*0.05;
    init_vx = sqrt((energy - m*g*init_y)/(0.5*m));
    mass_pose = [0; init_y; init_vx; 0]; 
    foot_pose = [0;0;0;0];
            
  save_pose = [];
  state=1;
  tspan = [0:0.0001:0.002]; 

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

            if(sqrt(relative_pose(1)^2+relative_pose(2)^2)>l0 && relative_pose(4)>0)
              state = 1;    
            
            end

    end  
end

   [y_peak, index] = findpeaks(save_pose(2,:));
    num = index(1);
    apex1 = save_pose([1:2],num);
    save_y_apex = [init_y; apex1(2)];
    saved_apex = [saved_apex save_y_apex];

end
 
%  save('apex_68.mat','saved_apex');
%  plot(saved_apex(1,:),saved_apex(2,:))



