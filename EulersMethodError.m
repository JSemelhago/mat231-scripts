%Executable used to calculate Euler's method and its absolute error

prompt_x_0 = 'What is the x-value of the initial value? ';
x_0 = input(prompt_x_0)

prompt_x = 'What x-value needs approximating? ';
x = input(prompt_x)

prompt_y = strcat('What is y(',string(x_0),')? ');
y_input = input(prompt_y)

prompt_eq = "What is y' (in terms of a (usually x, t, or i), b (usually y))? ";
eq = input(prompt_eq, 's');
syms f(a, b)
f(a, b) = str2sym(eq)

approximate_values_string = {};
approximate_values = {};

error_values_string = {};
error_values = {};

prompt_input = 'How many h values? ';
h_n = input(prompt_input);

diff_eq = strrep(eq, 'b', 'b(a)')

h_values = {};



for i=1:h_n
    prompt_h = strcat('Give h',string(i),': ');
    h = input(prompt_h)
    h_values = [h_values, h];

    x_input = [x_0:h:x]';

    N = fix((x-x_0)/h);
    y = sym(zeros(N+1, 1));

    y(1) = y_input

    n = numel(y)

    
    
    for j = 1:N
        y(j+1) = y(j) + h*vpa(f(x_input(j), y(j)));
    end

    disp(strcat('y(',string(x),') = ',string(vpa(y(N+1)))))

    approximate_values = [approximate_values, vpa(y(N+1))];
    approximate_values_string = [approximate_values_string, strcat('h value of ',string(h),': ',string(vpa(y(N+1))))];
    
    
    %Error solving here
    syms b(a) a
    ode = diff(b, a) == str2sym(diff_eq);
    cond = b(x_0) == y_input;
    ode_solved = dsolve(ode, cond)
    
    
    ode_solved_output = vpa(subs(ode_solved, x_input))
    
    error_values = [error_values, max(abs(ode_solved_output-y))];
    error_values_string = [error_values_string, strcat('h value of ',string(h),': ',string(max(abs(ode_solved_output-y))))];

    hold on

    plot(x_input,y);
    plot(x_input,ode_solved_output);
    grid on
end

%Plot the result (which should be linear)
legend('h=0.1','h=0.1error','h=0.2','h=0.2error','h=0.3','h=0.3error','h=0.4','h=0.4error','h=0.5','h=0.5error','h=0.6','h=0.6error','h=0.7','h=0.7error','h=0.8','h=0.8error','h=0.9','h=0.9error','h=1','h=1error')

figure()
scatter(linspace(1,11,10), error_values)
grid on

approximate_values_string
error_values_string