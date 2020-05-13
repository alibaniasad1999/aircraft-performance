HW2_Q_com_1
s = 65617;
sigma = (s-h_t)./(h_t+s);
eta = 0.88;
W = 97000;
S = 1800;
P_es = 4207500*sigma.^(0.65);
P_a = P_es*eta;
K = 0.05;
C_D_0 = 0.015;
C_L_1_3_max = (1/4)*((3/(K*(C_D_0^(1/3))))^0.75);
P_alt = sqrt(2*W^3./(rho_t*S))/C_L_1_3_max;
plot(h_t, P_alt)
hold
plot(h_t, P_a)
altitude = 0;
for i  = 1:1:63615
    if abs(P_alt(i) - P_a(i))<50
        altitude = i;
        break
    end
end
xlabel('$altitude_{ft}$', 'Interpreter','latex','FontSize', 20);
ylabel('$Power_{_{ft.lb/s}}$', 'Interpreter','latex','FontSize', 20);
legend('Power require', 'Power available') 