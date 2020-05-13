syms x y alpha beta;
eqn = [x+y == alpha, x-y == beta];
ali = solve(eqn, [x, y])
alpha = 1;
beta = 1;
disp(ali.x);
