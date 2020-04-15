v= 0:0.01:130;
T=(1-2.52*10^(-3)*v+4.3*10^(-6)*v.^2)*50000;
plot(v, T);
xlabel('$T(lb)$', 'Interpreter','latex','FontSize', 20)
ylabel('$v_{\infty}(m/s)$', 'Interpreter','latex','FontSize', 20)
M = 0.45:0.001:0.625;
T_T_0 = 0.369* M.^(-0.305);
v1 = 0.45:0.001:0.625;
v1 = v1*340.3;
T1=(1-2.52*10^(-3)*v1+4.3*10^(-6)*v1.^2);
plot(M, T_T_0)
hold
plot(M, T1)
ylabel('$\frac{T}{T_{v = 0}}$', 'Interpreter','latex','FontSize', 20)
xlabel('$M_{\infty}$', 'Interpreter','latex','FontSize', 20)
legend('altitude 3km', 'sea level')
