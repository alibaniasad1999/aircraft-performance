P_0 = 2116.22;
g_0 = 32.17405;
T_0 = 518.67;
rho_0 = 0.0023769;
R = 1716.55;
h = 1:1:36089;
a = -0.00356616;
T = T_0+a*h;
theta = T/T_0;
P = P_0*((theta).^(-g_0/(a*R)));
% delta = (theta).^(-g_0/(a*R));
rho = rho_0*((theta).^(-(g_0/(a*R)+1)));
% sigma = (theta).^(-(g_0/(a*R)+1));
h_1 = (h(length(h))+1):1:65616;
T_1(1:length(h_1)) = T(length(T));
P_1 = P(length(P))*exp(g_0./(R*T_1).*(h_1(1)-h_1));
rho_1 = (P_1)./(R*T_1);
% total
T_t = [T, T_1];
h_t = [h, h_1];
P_t = [P, P_1];
rho_t = [rho, rho_1];
theta = T_t/T_0;
delta = rho_t/rho_0;
sigma = P_t/P_0;
figure;
plot(T_t, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$temperature(R^{\circ})$', 'Interpreter','latex','FontSize', 20);
figure;
plot(P_t, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$Pressure(psf)$', 'Interpreter','latex','FontSize', 20);
figure
plot(rho_t, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$\rho (slug/ft^3)$', 'Interpreter','latex','FontSize', 20);
figure;
plot(theta, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$\theta$', 'Interpreter','latex','FontSize', 20);
figure;
plot(sigma, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$\sigma$', 'Interpreter','latex','FontSize', 20);
figure
plot(rho_t, h_t)
ylabel('$altitude(ft)$', 'Interpreter','latex','FontSize', 20);
xlabel('$\delta$', 'Interpreter','latex','FontSize', 20);
input_altitude = input('Enter altitude in foot: ');
if input_altitude < 36089
    fprintf('Point is in Troposphere\n')
elseif input_altitude == 36089
        fprintf('Point is in boundary between Troposphere and tropopause\n')
else
    fprintf('Point is in tropopause\n')
end
if input_altitude ~= 0
    fprintf('Temperature(Rankine) is %f\n', T_t(input_altitude));
    fprintf('Pressure(psf) is %f\n', P_t(input_altitude));
    fprintf('Density slug cubic foot is %f\n', rho_t(input_altitude));
    fprintf('sigma is %f\n', sigma(input_altitude));
    fprintf('theta is %f\n', theta(input_altitude));
    fprintf('delta is %f\n', delta(input_altitude));
else
        fprintf('Temperature(Rankine) is %f\n', T_0);
    fprintf('Pressure(psf) is %f\n', P_0);
    fprintf('Density slug cubic foot is %f\n', rho_0);
    fprintf('sigma is %f\n', 	1);
    fprintf('theta is %f\n', 1);
    fprintf('delta is %f\n', 1);
end