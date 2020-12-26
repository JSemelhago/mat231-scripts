%Simple script to solve a system o fODEs

syms y1(t) y2(t)

%System of equations 

%Create symbolic equation and solve it using ODE45
f1 = @(t,y)[-5.*y(1)+6.*y(2); -2.*y(2)+3.*(y(1)-y(2))*(100-y(2))]

%Opt. conditional
%cond = [y1(0)==1; y2(0)==3];

%Opt. add cond argument
S = ode45(f1, [0 .1], zeros(3,1))