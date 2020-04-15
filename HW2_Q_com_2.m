j = 0:0.1:4.5;
figure;
hold;
maximum = 0;
i = 1;
for beta = 15:5:35
    eta = 390*(j.^2).*(1-8*j.*(beta^-1)).*((1+13*j*beta).^-1);
    maximum(i) = max(eta);
    plot(j, eta);
    i=i+1;
    
    
end
axis([0 4.5 0 1])
legend('15^{\circ}','20^{\circ}','25^{\circ}','30^{\circ}','35^{\circ}')
text(1.35,0.4,'15^{\circ} \rightarrow')
text(1.8,0.4,'20^{\circ} \rightarrow')
text(2.4,0.4,'25^{\circ} \rightarrow')
text(2.9,0.4,'30^{\circ} \rightarrow')
text(3.5,0.4,'45^{\circ} \rightarrow')
title('Propeller efficincy as a function of odvonce ratio fur various pitch angles')
ylabel('$\eta_{pr}$', 'Interpreter','latex','FontSize', 20);
xlabel('$\frac{V}{ND}$', 'Interpreter','latex','FontSize', 20);
ii = 1;
for i = 15:5:35
    fprintf('maximum efficincy in %d pitch angle is %f\n', i, maximum(ii));
    ii=ii+1;
end

