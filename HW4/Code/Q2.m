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
ylabel('$RC_{{\max}(m/s)}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
Service_Ceiling(1,1:65616) = 100/60*0.3048;
hold
plot(h_m, Service_Ceiling)
legend({'$RC_{{\max}}$', '$Service~Ceiling$'},'Interpreter','latex','FontSize', 20);
title('maximum rate of climb versus altitude');
hold off;
close;
for i = 1:65616
    if abs(R_C_max(i)-100/60*0.3048)<0.001
        h_Service_ceiling = i;
        break;
    end
end
R_C_mac_invers = 1./R_C_max;
R_C_mac_invers = R_C_mac_invers(1:h_Service_ceiling+200);
figure;
plot(h_m(1:h_Service_ceiling+200), R_C_mac_invers,'LineWidth',3);
hold;
x(1:1966) = h_Service_ceiling*0.3048;
hh = (0:0.001:R_C_mac_invers(h_Service_ceiling));
plot(x(1:1966), hh,'LineWidth',3)
% plot(h_m, 1./R_C_max);
area(h_m(1:h_Service_ceiling), R_C_mac_invers(1:54169));
ylabel('$(RC_{{\max}(m/s)})^{-1}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
legend({'$(RC_{{\max}(m/s)})^{-1}$', '$Service~Ceiling$'},'Interpreter','latex','FontSize', 20);
title('Graphical representation of the time to climb to altitude ServiceCeiling');
close;
t_min_g = 0;
for i = 1:h_Service_ceiling
    t_min_g = t_min_g + (R_C_mac_invers(i)*0.3048);
end
n = length(h_t);
S_h = sum(h_m(1:h_Service_ceiling));
S_RC = sum(R_C_max(1:h_Service_ceiling));
S_hRC = sum(h_m(1:h_Service_ceiling).*R_C_max(1:h_Service_ceiling));
S_hh = sum(h_m(1:h_Service_ceiling).^2);
b_f = (n*S_hRC-S_h.*S_RC)./(n*S_hh-(S_h).^2);
a_f = (S_hh.*S_RC-S_hRC.*S_h)./(n*S_hh-(S_h).^2);
t_min_T = (1/b_f)*(log(a_f+b_f*16511)-log(a_f));
syms rhot
T_A_T = rhot/rho_t(1)*23500/515.379;
Z = 1 + sqrt(1+3/(L_D_max^2*((T_A_T/W)^2)));
R_C_max_T = sqrt(T_A_T/S*Z/(3*rhot*C_D_0))*(T_A_T/W-Z.*T_A_T/6/W-6*K*C_D_0./(T_A_T/W.*Z));
h_max = 0;
for i = 1:65616
    if abs(rho_t_m(i)-0.14588207536285415574934795219178)<0.00001
        h_max = i;
        break;
    end
end
syms rhoV
% V = sqrt((2/rhoV)*sqrt(K/C_D_0)*W/S)-88;
for i = 1:65616
    if abs(rho_t_m(i)-0.75290172621636279919433608721523)<0.00001
        h_theta_min_88 = i;
        break;
    end
end
V = sqrt((2/rhoV)*sqrt(K/3/C_D_0)*W/S)-88;
for i = 1:65616
    if abs(rho_t_m(i)-0.43468801430435094943925322388341)<0.00001
        h_theta_min_88 = i;
        break;
    end
end
C_L_32 = 0.25*(3/(K*C_D_0^(1/3)))^0.75;
CL_32 = sqrt(3*C_D_0/K);
CD_32 =CL_32^1.5/C_L_32;

