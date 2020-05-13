W = 2450;
S = 174;
b = 36;
eta = 0.8;
C_D_0 = 0.02;
AR= b^2/S;
e = 1.25^2/(pi*AR)/(0.07);
K = 1/(e*AR*pi);
max_power_S_L = 200;
C_L_max = 1.6;
rho_SL = 23.77e-4;
rho_5 = 20.48e-4;
V_min_SL = sqrt(2*W/(rho_SL*C_L_max*S));
V_min_5 = sqrt(2*W/(rho_5*C_L_max*S));
syms V_max_Sl V_max_5
C_L_SL = 2*W/(rho_SL*(V_max_Sl^2)*S);
P_A = 88000;
C_L_5 = 2*W/(rho_5*(V_max_5^2)*S);
eq1 = 88000 == 0.5*rho_SL*V_max_Sl^3*S*C_D_0+2*W/(rho_SL*V_max_Sl*S);
% V_max_Sl = max(vpa(solve(eq1, V_max_Sl)));
% syms z
% eq2 = z^4 - (20291418481080506777600000*z)/1430538085387148211 + 13617185759016668807498262086288408576000000/75794044953449175774078355825203723;
eq2 = 88000 == 0.5*rho_5*V_max_5^3*S*C_D_0+2*W/(rho_5*V_max_5*S);