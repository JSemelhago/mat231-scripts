%Script to generate a phase portrait for a given differential

%Matrix of values, must be changed along with inputted differential  
A = [1 -1; -3 1];
%Evec = eigenvectors, eval = eigenvalues
[evec, eval] = eig(A);
e1 = evec(:,1);
e2 = evec(:,2);

%Use this to check phase portrait with notes
eval

%Input differential equation
f=@(t,Y) [A(1,1).*Y(1)+A(1,2).*Y(2); A(2,1).*Y(1)+A(2,2).*Y(2)];

y1 = linspace(-5, 5, 20);
y2 = linspace(-5, 5, 20);

[x,y] = meshgrid(y1, y2);

u = zeros(size(x));
v = zeros(size(y));

t=0;
for i = 1:numel(x)
    Yprime = f(t, [x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

quiver(x, y, u, v, 'r');
figure(gcf)
xlabel('x');
ylabel('y');
title('Phase Portrait');
axis tight equal;

hold on

%Follow quiver arrows, not given arrowheads

%IMPORTANT: Adjust t values if graph is too close/far zoomed
max_t = 0.15;

%y20: number of starting points
for y20 = [0 0.5 1 1.5 2 2.5 3 3.5 4]
    [ts, ys] = ode45(f, [0,max_t], [0;y20]);
    plot(ys(:,1),ys(:,2))
    %Starting
    plot(ys(1,1),ys(1,2),'bo', 'MarkerSize', 3)
    %Ending
    plot(ys(end,1),ys(end,2),'k>')
end

%Negative starting points
for y20 = [-0.5 -1 -1.5 -2 -2.5 -3 -3.5 -4]
    [ts, ys] = ode45(f, [0,max_t], [0;y20]);
    plot(ys(:,1),ys(:,2))
    %Starting
    plot(ys(1,1),ys(1,2),'bo', 'MarkerSize', 3)
    %Ending - arrows in MATLAB are broken  
    plot(ys(end,1),ys(end,2),'k>')
end

%Get individual eigenvectors "end"
e11 = e1(1);
e12 = e1(2);
e21 = e2(1);
e22 = e2(2);

%Plot eigenvectors (trajectories)
multiplier = 5;
plot([0,e11*multiplier],[0,e12*multiplier]);
plot([0,e21*multiplier],[0,e22*multiplier]);
hold off
