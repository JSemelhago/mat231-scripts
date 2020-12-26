%Simple script to draw the slope field for a differential equation 

%Points to calculate arrow at
[x,y] = meshgrid(-2:0.1:2, -2:0.1:2);

%Equation in form of y'=f(x,y)
y_prime = sin(2.*y);
L = sqrt(1+y_prime.^2);

quiver(x,y,1./L,y_prime./L);