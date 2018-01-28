clear

% Weight
a = 1;
b = 1;

% Constant
Ts = 0.2;
g = 9.81;
Zc = 1;
Tc = sqrt(Zc/g);
ST = sinh(Ts/Tc);
CT = cosh(Ts/Tc);
DT = a*CT^2 + b*(ST/Tc)^2;


% Matrix
M = [CT Tc*ST; ST/Tc CT];



xi1 = 0;
vi1 = 0.1; 
% Initial state in body frame in x direction

[foot_pos_fix_y] = yfootplace(0, 0.1, 0, -0.1, M);

[foot_pos_fix_x] = xfootplace(0, 0.1, 0, 0.1, M);


figure;
scatter(foot_pos_fix_x,foot_pos_fix_y)

%plot(foot_pos_fix_x,foot_pos_fix_y)
save('foot_pos_fix.mat','foot_pos_fix_x','foot_pos_fix_y')








