function dy = seir(t,y)
    %initial conditions
    dy = [0 0 0 0];
    



tspan = [0 100];

N = 38005238;
gamma = 1/14;
r_0 = 2.1;
beta = gamma.*r_0;
sigma = 1/5;


