W = 73000;
C_D_0 = 0.015;
K = 0.08;
S = 950;
rho = 8.91e-4;
rho_0 = 23.77e-4;
V = 100:1:1600;
q = 0.5*V.^2*rho;
C_L = 2*W./(V.^2*S*rho);
T_R = 0.5*S*V.*V*rho.*(C_D_0 + K*C_L.^2);
P_R = T_R.*V;
T_A_0 = 27700;
T_A = T_A_0*((rho/rho_0)^0.6);
P_A = T_A*V;
D_0 = q*S*C_D_0;
D_I = q.*S*K.*C_L.^2;
C_D = C_D_0+K*C_L.^2;
L_D = C_L./C_D;
%figure 5.5
figure
hold
plot(V, D_0, '--')
plot(V, D_I, '--')
plot(V, D_0+D_I)
xlabel('$V_{\infty_{ft/s}}$', 'Interpreter','latex','FontSize', 20);
ylabel('$Drag_{_{lb}}$', 'Interpreter','latex','FontSize', 20);
legend('Zero-lift drag', 'Drag due to lift', 'Total drag')
hold off
% figure 5.8
figure
hold
plot(V, L_D)
xlabel('$V_{\infty_{ft/s}}$', 'Interpreter','latex','FontSize', 20);
ylabel('$\frac{L}{D}$', 'Interpreter','latex','FontSize', 20);
hold off
% figure 5.11
figure
hold
plot(V, C_L./C_D)
plot(V, (C_L.^0.5)./C_D)
plot(V, (C_L.^1.5)./C_D)
xlabel('$V_{\infty_{ft/s}}$', 'Interpreter','latex','FontSize', 20);
ylabel('$\frac{C_L}{C_D},\frac{C_L^{1/2}}{C_D},\frac{C_L^{3/2}}{C_D}$', 'Interpreter','latex','FontSize', 20);
axis([200  1200 0 25])
legend({'$\frac{C_L}{C_D}$','$\frac{C_L^{1/2}}{C_D}$','$\frac{C_L^{3/2}}{C_D}$'},'Interpreter','latex','FontSize', 20)
% figure 5.20
figure
plot(V, P_R);
hold
plot(V, P_A)
xlabel('$V_{\infty_{ft/s}}$', 'Interpreter','latex','FontSize', 20);
ylabel('$Power_{_{ft.lb/s}}$', 'Interpreter','latex','FontSize', 20);
legend('Power require', 'Power available')
hold off
R_C = V.*(T_A/W-0.5*rho*(V.^2)*(S/W)*C_D_0-W/S*2*K./(rho*V.^2));
% figure 5.37
plot(V, R_C)
xlabel('$V_{\infty_{ft/s}}$', 'Interpreter','latex','FontSize', 20);
ylabel('$\frac{R}{C}_{ft/s}$', 'Interpreter','latex','FontSize', 20);