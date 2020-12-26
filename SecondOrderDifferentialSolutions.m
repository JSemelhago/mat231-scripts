%Simple script to solve second order ODEs

syms y(x) b

%diff(y, order) == f(x)
eq = diff(y,2)-3.*y==2.*x+x.*sin(x);

dy = diff(y,x);
cond=[y(0)==0,dy(0)==1]

%Add conditions for C1, C2
sol = simplify(dsolve(eq, cond))

fplot(sol)
grid on
%Particular solution only
%yp=subs(sol, symvar(sol), [0,0,x]);