
%Initial values
N = 38005237;
R = 0;
I = 20;
E = 691;
S = N-R-I-E;

initial_value = [S E I R];

%x-axis day range
tspan = [0 365];

%Solve ODE using ode45 solver
[t, y] = ode45(@seir, tspan, initial_value);

%Plot solution
plot(t, y);
legend('Susceptible','Exposed','Infected','Removed');
title('SEIR Model for Covid-19 in Canada');
xlabel('Days');
ylabel('Population');

%Define function for model
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
    %Return column vector
    dy = dy(:);
end
    