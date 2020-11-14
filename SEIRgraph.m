

N = 38005237;
R = 100000;
I = 100000;
E = 1000000;
S = N-R-I-E;

initial_value = [S E I R];
%x-axis
tspan = [0 100];

[t, y] = ode45(@seir, tspan, initial_value);
% plot(t, y);

f = figure;
ax = axes('Parent',f,'Position',[0.13 0.39  0.77 0.54]);
h = plot(ax, [t,y]);

legend('S','E','I','R');

b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
              'value',R, 'min',0, 'max',N);
bgcolor = f.Color;
bl1 = uicontrol('Parent',f,'Style','text','Position',[50,54,23,23],...
                'String','0','BackgroundColor',bgcolor);
bl2 = uicontrol('Parent',f,'Style','text','Position',[500,54,23,23],...
                'String','38005238','BackgroundColor',bgcolor);
bl3 = uicontrol('Parent',f,'Style','text','Position',[240,25,100,23],...
                'String','R','BackgroundColor',bgcolor);

b.Callback = @(es,ed) updateSystem(h, ode45(@seir, tspan, [S E I R])); 

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
    %Return column vector
    dy = dy(:);
end
    