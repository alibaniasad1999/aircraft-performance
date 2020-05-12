syms T
L_D_max = 18.6339;
W = 157000;
S = 45;
rho = 1.225;
C_D_0 = 0.016;
K = 0.045;
Z = 1+sqrt(1+3/(L_D_max^2*T*T/(W^2)));
RateOfClimb = ((T*Z/S)/(3*rho*C_D_0))*(T/W-Z*T/(6*W)-6*K*C_D_0/(T*Z/W));
thrust = solve(RateOfClimb);
Thrust = max(thrust);
