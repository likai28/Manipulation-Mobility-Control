function [foot_pos_fix_x] = xfootplace(xi1, vi1, xd, vd, M)

a = 1;
b = 1;

% Constant
Ts = 0.4;
g = 9.81;
Zc = 1;
Tc = sqrt(Zc/g);
ST = sinh(Ts/Tc);
CT = cosh(Ts/Tc);
DT = a*CT^2 + b*(ST/Tc)^2;

foot_pos_fix_x = [];
x_world = 0;

for i = 1:20
state_f1 = M*[xi1; vi1];

xf1 = state_f1(1);
vf1 = state_f1(2);

vi2 = vf1;
xi2 = (a*CT*(xd-ST*Tc*vi2) + b*ST/Tc*(vd-CT*vi2))/DT;



x_world = x_world - xi2 + xf1 - xi1;

foot_pos_fix_x = [foot_pos_fix_x x_world];

state_f2 = M*[xi2; vi2];

xf2 = state_f2(1);
vf2 = state_f2(2);

xi1 = xf2;
vi1 = vf2;



end

end