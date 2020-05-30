HW2_Q_com_1;
W = 73000;
S = 960;
a = 1126;
T_A_max_SL = 13850;
C_D_0 = 0.015;
K = 0.08;
V = 50:1:1250;
T_R = 0.5*S*rho_t(1)*V.^2.*(C_D_0+K.*((2*W./(rho_t(1)*S*V.^2)).^2));
M = V/a;
T_A = 0.4*T_A_max_SL*(M).^(-0.6);
T_A = T_A*2;
plot(M, T_R,'LineWidth',3);
hold;
plot(M, T_A,'LineWidth',3);
xlabel('$M_{\infty}$', 'Interpreter','latex','FontSize', 20);
ylabel('$Force_{lb}$', 'Interpreter','latex','FontSize', 20);
legend({'$Thrust~require$', '$Thrust~available$'},'Interpreter','latex','FontSize', 20);
title('Thrust require V.S Thrust available in sea level');
V_max = 0;
for i = 1:1201
    if abs(T_A(i)-T_R(i))< 100
        V_max = V(i);
    end
end
hold off;
M_max = V_max/a;
V_30000 = 150:1:1000;
a_30000 = 994.42257369;
T_R_30000 = 0.5*S*rho_t(30000)*V_30000.^2.*(C_D_0+K.*((2*W./(rho_t(30000)*S*V_30000.^2)).^2));
M_30000 = V_30000/a_30000;
T_A_30000 = 0.222*T_A_max_SL*(M_30000).^(-0.6);
T_A_30000 = T_A_30000*2;
plot(M_30000, T_R_30000,'LineWidth',3);
hold;
plot(M_30000, T_A_30000,'LineWidth',3);
xlabel('$M_{\infty}$', 'Interpreter','latex','FontSize', 20);
ylabel('$Force_{lb}$', 'Interpreter','latex','FontSize', 20);
legend({'$Thrust~require$', '$Thrust~available$'},'Interpreter','latex','FontSize', 20);
title('Thrust require V.S Thrust available in 30000ft altitude');
V_max_30000 = 0;
for i = 1:850
    if abs(T_A_30000(i)-T_R_30000(i))< 200
        V_max_30000 = V(i);
    end
end
M_max_30000 = V_max_30000/a_30000;
hold off
        
