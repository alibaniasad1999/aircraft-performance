clear
W0 = 50e3;
W1 = 40e3;
C_D_0 = 0.025;
K = 0.05;
S = 30;
eta = 0.85;
P = 840e3;
c = 4.5/3600/1000;
rho = 1.007;
L_D = (4*C_D_0*K)^-0.5;
R_max1 = (eta/c)*L_D*log(W0/W1);
xi = (W0-W1)/W0;
R_max2 = (2*eta/c)*L_D*atan(xi/(2*sqrt(1-xi)));
L_D_3_2 = 0.25*(3/(K*C_D_0^(1/3)))^0.75;
E_max1 = (eta/c)*sqrt(2*rho*S)*L_D_3_2*(W1^-0.5-W0^-0.5);
E_max2 = (2*eta/c)*(2/3^0.75)*3^0.25*L_D_3_2*sqrt(rho*S/2/W0)*atan(3^0.5*xi/(4-3*xi));
W1P = W0/exp(R_max1/2*c/eta/L_D);
C_L = sqrt(C_D_0/K);
V = sqrt(2*W1P/(rho*C_L));
% P_R = sqrt(2*W0^3./(rho_t_m*S))*1/L_D_3_2;
v = 25:0.1:150;
T_R = 0.5*S*C_D_0*rho*v.^2+2*K*S./(rho*v.^2)*(W0/S)^2;
P_R = T_R.*v;
plot(v, P_R);
diffX = 0;
for i  = 2:length(v)-2
    diffX(i) = (P_R(i+1)-P_R(i-1))/0.2;
end
Vtw = 10;
V1tw = 0;
Vhw = 10;
V1hw = 0;
for i = 1:length(diffX)
    if Vtw == v(i)
        continue
    end
    abs(P_R(i)/(v(i)+Vtw)-diffX);
    if abs(P_R(i)/(v(i)+Vtw)-diffX(i))< 5
%         aaaabs(P_R(i)/(v(i)-Vtw)-diffX);
        V1tw = v(i);
        i1 = i;
    end
end
for i = 1:length(diffX)
    if Vhw == v(i)
        continue
    end
    abs(P_R(i)/(v(i)-Vhw)-diffX);
    if abs(P_R(i)/(v(i)-Vhw)-diffX(i))< 10
%         aaaabs(P_R(i)/(v(i)-Vtw)-diffX);
        V1hw = v(i);
        i2 = i;
    end
end
VnW = 0;
for i = 2:length(diffX)
    abs(P_R(i)/(v(i))-diffX);
    if abs(P_R(i)/(v(i))-diffX(i))< 10
%         aaaabs(P_R(i)/(v(i)-Vtw)-diffX);
        VnW = v(i);
        i3 = i;
    end
end
plot(v, P_R);
hold
plot([-10 v(i1)], [0, P_R(i1)])
plot([10 v(i2)], [0, P_R(i2)])
plot([0 v(i3)], [0, P_R(i3)])
hold
axis([-20 110 0 8e5])
xlabel('$V_{\infty}(m/s)$', 'Interpreter','latex','FontSize', 20);
ylabel('$P_R(W)$', 'Interpreter','latex','FontSize', 20);
legend({'$P_R$', '$tailwind$', '$headwind$', '$no~wind$'},'Interpreter','latex','FontSize', 20);