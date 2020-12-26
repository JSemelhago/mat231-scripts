%Executable to approximate solution using Euler's method

prompt_x_0 = 'What is the x-value of the initial value? ';
x_0 = input(prompt_x_0)

prompt_y = strcat('What is y(',string(x_0),')? ');
y_0 = input(prompt_y)

prompt_eq = "What is y' (in terms of a (usually x, t, or i), b (usually y))? ";
eq = input(prompt_eq, 's');
syms f(a, b)
f(a, b) = str2sym(eq)

prompt_h = 'What is the h value? ';
h = input(prompt_h)

prompt_n = 'What is the n value? ';
n = input(prompt_n)

t_n = x_0
y_n = y_0
for i=1:n
    t_n = t_n+h;
    y_n = y_n + h*f(t_n, y_n);
end


disp(strcat('Approximate value of slope field at ', string(x_0), ' over ', string(n), ' iterations is ', string(vpa(y_n))))