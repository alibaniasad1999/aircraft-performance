b = 17;
S = 37.8;
W = 960;
C_D_0 = 0.02;
K = 0.062;
T_max_SL = 202;
L_D_max = sqrt(1/(4*K*C_D_0));
W_S = W/S;
theta_min = atan(1/L_D_max);
%h = 10000;
syms density
Z = 1 + sqrt(1+3./(L_D_max^2*((T_max_SL*density/rho_t(1))/W).^2));
R_C_max = 100/60 - sqrt((T_max_SL*density/rho_t(1))/S*Z/(3*rho_t(1)*C_D_0)).*((T_max_SL*density/rho_t(1))/W-Z.*(T_max_SL*density/rho_t(1))/6/W-6*K*C_D_0./((T_max_SL*density/rho_t(1))/W*Z));
 for i = 1:65616
     if abs(rho_t(i)-(0.00089115362334086263707372334699072))<0.000000001
         h_Service_ceiling = i;
         break;
     end
end