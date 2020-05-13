syms alpha0 sigma_E_0 T_0
C_D_0 = 0.0270;
C_D_alpha  = 0.1310;
C_D_sigma_E = 0;
C_D_I_H = 0;
C_L_0 = 0.2010;
C_L_alpha  = 5.48;
C_L_sigma_E = 0.6;
C_L_I_H = 1.35;
C_M_0 = 0.05;
C_M_alpha  = -1.890;
C_M_sigma_E = 0.6;
C_M_I_H = -4.1;
s = 280;
q = 128.28;
W = 11000;
c = 6.5;
%%%%%%%%%
I_H_0 = 0;
gama0 = 0;
phi_T = 0;
DT = 0;
%%%%%%%%%
LogicInput = input('If you want customize IhZero or gamaZero or PhiT write 1 else write 0\n');
if LogicInput == 1
    I_H_0 = input('enter IHZero\n');
    gama0 = input('enter gamaZero\n');
    phi_T = input('enter PhiT\n');
end
%%%%%%%%%
eq1 = W*sin(gama0) == -q*s*(C_D_0+C_D_alpha*abs(alpha0)+C_D_sigma_E*abs(sigma_E_0)+C_D_I_H*abs(I_H_0))+T_0*cos(phi_T+alpha0);
eq2 = W*cos(gama0) == q*s*(C_L_0+C_L_alpha*alpha0+C_L_sigma_E*sigma_E_0+C_L_I_H*I_H_0)+T_0*sin(phi_T+alpha0);
eq3 = T_0*DT == q*s*c*(C_M_0+C_M_alpha*alpha0+C_M_sigma_E*sigma_E_0+C_M_I_H*I_H_0);
eq = [eq1, eq2, eq3];
vars = [alpha0, sigma_E_0, T_0];
answers = solve(eq, vars);
fprintf('alphaZero is %f\n', answers.alpha0);
fprintf('SigmaEZero is %f\n', answers.sigma_E_0);
fprintf('TZero is %f\n', answers.T_0);