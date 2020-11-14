

N = 38005238;
R = 10000;
I = 10000;
E = 10000;
S = N-R-I-E;

vars = [S E I R];
%x-axis
tspan = [0 100];

[t, y] = ode45('seir', tspan, vars);
plot(t, y);



%Define function
function dy = seir(t,y)
    %initial conditions of derivatives (0) + constants
    dy = [0 0 0 0];
    N = 38005238;
    gamma = 1/14;
    r_0 = 2.1;
    beta = gamma.*r_0;
    sigma = 1/5;
    %System of equations - S=y1,E=y2,I=y3,R=y4
    dy(1) = (-beta./N).*y(1).*y(3);
    dy(2) = (beta./N).*y(1).*y(3)-sigma.*y(2);
    dy(3) = sigma.*y(2)-(gamma.*y(3));
    dy(4) = gamma.*y(3);
end
    