HW2_Q_com_1;
T_A = 23500*rho_t/rho_t(1);
h_ft = 0:1:65615;
h_m = h_ft*0.3048;
C_D_0 = 0.015;
C_L_max = 1.8;
e = 0.9;
b = 17;
S = 32;
W = 50000;
AR = b^2/S;
K3 = 1/(pi*e*AR);
K = K3+K3/3;
L_D_max = sqrt(1/(4*C_D_0*K));
rho_t_m = rho_t*515.379;
Z = 1 + sqrt(1+3./(L_D_max^2*((T_A/W).^2)));
R_C_max = sqrt(T_A/S.*Z./(3*rho_t_m*C_D_0)).*(T_A/W-Z.*T_A/6/W-6*K*C_D_0./(T_A/W.*Z));
% R_C_max = sqrt(T_max/S.*Z./(3*rho_t_m*C_D_0)).*(T_max/W-Z.*T_max/6/W-6*K*C_D_0./(T_max/W.*Z));
plot(h_m, R_C_max);
axis([0 17000 0 55])
ylabel('$RC_{{\max}m/s}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
Service_Ceiling(1,1:65616) = 100/60*0.3048;
hold
plot(h_m, Service_Ceiling)
legend({'$RC_{{\max}}$', '$Service~Ceiling$'},'Interpreter','latex','FontSize', 20);
title('maximum rate of climb versus altitude');