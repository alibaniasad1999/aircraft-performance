plot(h_m(1:h_max), V_v_theta_min(1:h_max))
hold
plot(a*0.3048,V_v_theta_min(a),'ko','markerfacecolor','k')
plot(h_m(1:h_max), V_v_theta_min_sinrate(1:h_max))
plot(a*0.3048,V_v_theta_min_sinrate(a),'bo','markerfacecolor','k')
title('Vertical velocity in minimum theta and Vertical velocity in minimum sink rate')
ylabel('$(m/s)$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
legend({'$V_{V_{\theta_{\min}}}$', '$20~Step~V_{V_{\theta_{\min}}}$','$V_{V_{\theta_{\min sink~rate}}}$', '$20~Step~V_{V_{\theta_{\min sink~rate}}}$'},'Interpreter','latex','FontSize', 20);