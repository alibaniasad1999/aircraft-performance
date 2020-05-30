HW2_Q_com_1;
logical_Str = input('Enter your motor kind\n turbofan or turbojet:   ', 's');
lower(logical_Str);
% Optimize thrust vs altitude
T_SL = input('Enter Thrust in sea level(please enter in lb):   ');
if strcmp('turbojet', logical_Str)
    T_A = T_SL*rho_t/rho_t(1);
else
    m = input('Enter relation between sea level thrust and thrust in altitude to density\n(if you dont khow enter 0 and progran assume 0.6)');
    if m == 0
        m = 0.6;
    end
    T_A = T_SL*((rho_t/rho_t(1))^0.6);
end
W = input('Enter Weight in sea level(please enter in lb):   ');
C_D_0 = input('Enter C_D zero in drag polar eq:   ');
K = input('Enter K in drag polar eq:   ');
S = input('Enter surface(please enter in square ft):   ');
%}
%{
T_SL = 27700;
W = 73000;
S = 950;
C_D_0 = 0.015;
K = 0.08;
T_A = T_SL*((rho_t/rho_t(1)));
%}
% T_A = T_SL;
L_D_max = sqrt(1/(4*C_D_0*K));
Z = 1 + sqrt(1+3./(L_D_max^2*((T_A/W).^2)));
R_C_max = sqrt(T_A/S.*Z./(3*rho_t*C_D_0)).*(T_A/W-Z.*T_A/6/W-6*K*C_D_0./(T_A/W.*Z));
Er = 0.01;
h_max = 0;
%{
for i = 1:h_t
    if abs(R_C_max(i))<Er
        h_max = i;
    end
    if i == (max(h_t)-1)
        if h_max == 0
            i = 0;
            Er = Er*2;
        end
    end
end
%}
i = 1;
while true
    if abs(R_C_max(i))<Er
        h_max = i;
        break;
    end
    i = i+1;
    if i == (max(h_t)-1)
        disp(i);
        if h_max == 0
            i = 1;
            Er = Er*2;
        end
    end
end
h1 = input('Enter first altitude(enter min for sea level):   ', 's');
h1 = lower(h1);
h2 = input('Enter second altitude(enter max for sea level):   ', 's');
h2 = lower(h2);
if strcmpi('min', h1)
    h1 = 1;
else
    h1 = str2double(h1);
end
if strcmpi('max', h2)
    h2 = h_max;
else
    h2 = str2double(h2);
end
while h2 > h_max
    fprintf('Oooops!!! we can not go there. maximum altitude is:')
    disp(h_max);
    h2 = input('If you want go maximum altitude enter yes else enter altitude below maximum altitude):   ', 's');
    h2 = lower(h2);
    if strcmpi('yes', h2)
        h2 = h_max;
    else
        h2 = str2double(h2);
    end
end
    
n = input('Enter steps\n(if you wants program work automatically with higher Accuracy enter 0):   ');
if n == 0
    n = (h2-h1);
end
time = 0;
step = (h2-h1)/n;
R_C_max_invers = R_C_max.^-1;
for i = h1:step:(h2-step)
    time = time + (R_C_max_invers(floor(i))+R_C_max_invers(floor(i+step)))/2*step;
end
fprintf('minimum time to climb is %f sec\n %f min\n %f hr\n', time, time/60, time/3600);
logic = input('for more details Enter 1:   ');
if logic == 1
    plot(h_t(1:h_max), R_C_max(1:h_max));
    ylabel('$RC_{{\max}(m/s)}$', 'Interpreter','latex','FontSize', 20);
    xlabel('$altitude_{m}$', 'Interpreter','latex','FontSize', 20);
    fprintf('maximum altitude is %f\n', h_max);
    fprintf('maximum RC(in sea level)  is %f\n', max(R_C_max));
end
fprintf('Good luck!\n');