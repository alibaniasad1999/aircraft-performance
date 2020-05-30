t_theta_min = 0;
for i = 1:h_max
    t_theta_min = t_theta_min + 0.3048/V_v_theta_min(i);
end
plot(h_m(1:h_max), 1./V_v_theta_min(1:h_max),'LineWidth',3);
hold;
area(h_m(1:h_max), 1./V_v_theta_min(1:h_max));
ylabel('$(V_{V_{\theta_{\min}}})^{-1}_{s/m}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
legend({'$(V_{V_{\theta_{\min}}})^{-1}_{s/m}$', '$Area = time$'},'Interpreter','latex','FontSize', 20);
t_theta_min_sinrate = 0;
hold off;
close
for i = 1:h_max
    t_theta_min_sinrate = t_theta_min_sinrate + 0.3048/V_v_theta_min_sinrate(i);
end
plot(h_m(1:h_max), 1./V_v_theta_min_sinrate(1:h_max),'LineWidth',3);
hold
ylabel('$(V_{V_{\theta_{\min sink~rate}}})^{-1}_{s/m}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
area(h_m(1:h_max), 1./V_v_theta_min_sinrate(1:h_max));
legend({'$(V_{V_{\theta_{\min sink~rate}}})^{-1}_{s/m}$', '$Area = time$'},'Interpreter','latex','FontSize', 20);