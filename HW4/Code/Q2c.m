theta_min = 0.0559;
V_v_theta_min = sqrt((2./rho_t_m)*sqrt(K/C_D_0)*W/S)*sin(theta_min);
V_v_theta_min_sinrate = sqrt(2./(rho_t_m*C_L_32^2)*W/S);
plot(h_m(1:h_max), V_v_theta_min(1:h_max))
hold
plot(a*0.3048,V_v_theta_min(a),'ko','markerfacecolor','k')
title('Vertical velocity in minimum theta')
ylabel('$V_{V_{\theta_{\min}}}(m/s)$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
legend({'$V_{V_{\theta_{\min}}}$', '$20~Step$'},'Interpreter','latex','FontSize', 20);
figure
plot(h_m(1:h_max), V_v_theta_min_sinrate(1:h_max))
hold
plot(a*0.3048,V_v_theta_min_sinrate(a),'ko','markerfacecolor','k')
title('Vertical velocity in minimum sink rate')
ylabel('$V_{V_{\theta_{\min sink~rate}}}(m/s)$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
legend({'$V_{V_{\theta_{\min sink~rate}}}$', '$20~Step$'},'Interpreter','latex','FontSize', 20);
