W0 = 22000*9.8;
S = 80;
c_t = 6.4e-5;
R_max = 3800e3;
K = 0.06;
C_D_0 = 0.025;
C_LD1_2 = (3/4)*((1/(3*K*C_D_0^3))^0.25);
rho = 1.225*0.5;
W1 = (W0^0.5-R_max/((2/c_t)*sqrt(2/(rho*S))*C_LD1_2))^2;
L_D = (4*C_D_0*K)^(-0.5);
V  = sqrt((2/rho)*sqrt(K/C_D_0)*W/S);
W1_2 = W0/(exp(R_max/((1/c_t)*C_LD1_2*sqrt(2*W0/rho/S))));
E_max = 8*3600;
WE1 = W0/(exp(E_max/((1/c_t)*L_D)));
eq2 = xi/(2*sqrt(2-xi))-0.0715;
alpha = (2/c_t)*sqrt(2/(rho*S))*(W0^0.5-W1^0.5);
V_tw = 10;
beta = V_tw*(1/c_t)*log(W0/W1);
C_L = 0:.001:2;
R = alpha*(C_L.^0.5)./(C_D_0+K*(C_L.^2))+beta*(C_L)./(C_D_0+K*(C_L.^2));
R_wind = max(R);
plot(C_L, R)
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20);
ylabel('$R_{m}$', 'Interpreter','latex','FontSize', 20);
alpha1 = (1/c_t)*sqrt(2*W0/(rho*S))*(log(W0/W1));
R1 = alpha1*(C_L.^0.5)./(C_D_0+K*(C_L.^2))+beta*(C_L)./(C_D_0+K*(C_L.^2));
plot(C_L, R1)
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20);
ylabel('$R_{m}$', 'Interpreter','latex','FontSize', 20);
R1_wind = max(R1);
R_h = alpha*(C_L.^0.5)./(C_D_0+K*(C_L.^2))-beta*(C_L)./(C_D_0+K*(C_L.^2));
R_wind_h = max(R_h);
plot(C_L, R_h)
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20);
ylabel('$R_{m}$', 'Interpreter','latex','FontSize', 20);
R1_windhead = alpha1*(C_L.^0.5)./(C_D_0+K*(C_L.^2))-beta*(C_L)./(C_D_0+K*(C_L.^2));
R2_wind = max(R1_windhead);
plot(C_L, R1_windhead)
xlabel('$C_L$', 'Interpreter','latex','FontSize', 20);
ylabel('$R_{m}$', 'Interpreter','latex','FontSize', 20);

%{
W1_2 = W0/(exp(R_max/(V*L_D/c_t)));
X = R_max/((2/3^0.75)*2*3^0.25/c_t*C_LD1_2*sqrt(2*W0/(rho*S)));
syms xi
eq = sqrt(3)*xi/(4-xi)-0.0614;
W11 = (W0^0.5-(R_max/2)/((2/c_t)*sqrt(2/(rho*S))*C_LD1_2))^2;
XX = (R_max/2)/((2/3^0.75)*2*3^0.25/c_t*C_LD1_2*sqrt(2*W0/(rho*S)));
eq1 = sqrt(3)*xi/(4-xi)-0.0307;
%}


