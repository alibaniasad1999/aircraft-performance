syms T
L_D_max = 18.6339;
W = 157000;
S = 45;
rho = 1.225;
C_D_0 = 0.016;
K = 0.045;
Z = 1+sqrt(1+3/(L_D_max^2*T*T/(W^2)));
RateOfClimb = 152.6;
eq = RateOfClimb == ((T*Z/S)/(3*rho*C_D_0))*(T/W-Z*T/(6*W)-6*K*C_D_0/(T*Z/W));
Thrust = max(solve(eq, T));
% HW2_Q_com_1
s = 65617;
T_R = 8.4255e+03;
sigma = (s-h_t)./(h_t+s);
altitude = 0;
T_A = 1.0699e+04*sigma.^(0.6);
for i  = 1:1:63615
    if abs(T_R - T_A(i))<0.1
        altitude = i;
        break
    end
end
theta_min = atan(640/3100);
syms V
T_a = 10699;
eq1 = V*sin(theta_min) == V*(T_a/W-0.5*rho*(V^2)*(S/W)*C_D_0-W/S*2*K/(rho*V^2));
