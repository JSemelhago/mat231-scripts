%Simple script to solve a differential equation

syms y(t)

%Differential given in form y(t)
ode = diff(y,t) == y/t;

%Optional initial condition
cond = y(0) == 0;

ySol(t) = dsolve(ode, cond)
