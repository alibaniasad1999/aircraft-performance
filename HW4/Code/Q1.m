HW2_Q_com_1
b = 17;
S = 37.8;
W = 960;
C_D_0 = 0.02;
K = 0.062;
T_max_SL = 202;
L_D_max = sqrt(1/(4*K*C_D_0));
W_S = W/S;
theta_min = atan(1/L_D_max);
h = 10000;
c_t = 1.3/3600;

R_max = h/tan(theta_min);
V_theta_min_10000 = sqrt((2/rho_t(h))*sqrt(K/C_D_0)*W_S);
V_theta_min_SL = sqrt((2/rho_t(1))*sqrt(K/C_D_0)*W_S);
T_max = rho_t./rho_t(1)*T_max_SL;
Z = 1 + sqrt(1+3./(L_D_max^2*((T_max/W).^2)));
R_C_max = sqrt(T_max/S.*Z./(3*rho_t*C_D_0)).*(T_max/W-Z.*T_max/6/W-6*K*C_D_0./(T_max/W.*Z));
plot(h_t, R_C_max);
axis([0 38000 0 35])
ylabel('$RC_{{\max}ft/s}$', 'Interpreter','latex','FontSize', 20);
xlabel('$altitude_{ft}$', 'Interpreter','latex','FontSize', 20);
Service_Ceiling(1,1:65616) = 100/60;
hold
plot(h_t, Service_Ceiling)
h_ans(1,1:100) = 31118;
x(1,1:100) = 100/60;
plot(h_ans, x, '--')

legend({'$R_{C_{\max}}$'},'Interpreter','latex','FontSize', 20);
title('maximum rate of climb versus altitude');
text(11462,6200,'Service ceiling');
h_Service_ceiling = 0;
for i = 1:65616
    if abs(R_C_max(i)-100/60)<0.001
        h_Service_ceiling = i;
        break;
    end
end
n = length(h_t);
S_h = sum(h_t);
S_RC = sum(R_C_max);
S_hRC = sum(h_t.*R_C_max);
S_hh = sum(h_t.^2);
b_f = (n*S_hRC-S_h.*S_RC)./(n*S_hh-(S_h).^2);
a_f = (S_hh.*S_RC-S_hRC.*S_h)./(n*S_hh-(S_h).^2);
t_min = (1/b_f)*(log(a_f+b_f*10000)-log(a_f));

W_0 = 960;
W_1 = 550;
C_L_12_C_D_max = (3/4)*((1/(3*K*C_D_0^3))^0.25);
RangeMax10000 = (2/c_t)*sqrt(2/(rho_t(10000)*S))*C_L_12_C_D_max*(W_0^0.5-W_1^0.5);
V_max_range = sqrt((2/rho_t(10000)*sqrt(3*K/C_D_0)*W/S));
E_max = (1/c_t)*L_D_max*log(W_0/W_1);
alpha = (2/c_t)*sqrt(2/(rho_t(10000)*S))*(W_0^0.5-W_1^0.5);
V_tw = 58.666667;
beta = V_tw*(1/c_t)*log(W_0/W_1);
C_L = 0.1:0.0001:2;

R = alpha*(C_L.^0.5)./(C_D_0+K*(C_L.^2))+beta*(C_L)./(C_D_0+K*(C_L.^2));
% R= alpha*(CL^0.5)./(C_D_0+K*(CL^2))+beta*(CL)/(C_D_0+K*(CL^2));
eq = (alpha*(0.5*C_L.^(-0.5)*C_D_0-1.5*K*C_L.^(1.5))+beta*(C_D_0-K*C_L.^2))./((C_D_0+K*(C_L.^2)).^2);
plot(C_L, R);
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20);
ylabel('$R_{ft}$', 'Interpreter','latex','FontSize', 20);
plot(C_L, eq);
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20)
ylabel('$\frac{dR}{dC_L}$', 'Interpreter','latex','FontSize', 20);
[R_max_withWind, C_L_R_max_withWind] = max(R);
C_L_R_max_withWind = C_L_R_max_withWind/10000;