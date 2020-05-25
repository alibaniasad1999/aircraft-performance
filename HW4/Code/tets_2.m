syms alpha beta CD CL K
eq = (alpha*(0.5*CL^(-0.5)*CD-1.5*K*CL^(1.5))+beta*(CD-K*CL^2))/((CD+K*CL^2)^2);
% R = alpha*(CL^0.5)./(CD+K*(CL^2))+beta*(CL)/(CD+K*(CL^2));