function MontePiPlots()
% main idea of this coding:
%1.A range of values n_values is defined, arrays execution_times and absolute_errors are initialized.
%2.For each value of n in n_values, use the Monte Carlo method to approximate the execution time of each approximation is recorded.The absolute error is also computed.
%3.Obtain plots 1 and 2 as required in question 1 and 2.
%4.The random point generation process is shown by a fixed number of points n_fixed(in my case I choose 10000). 
% The random points are plotted in two colors: inside the quarter circle and outside the quarter circle.
%5.Save the plots in the MATLAB working directory.
%6.Add nested funtion MontePi(n).
    n_values = [10, 100, 1000, 5000, 10000, 50000, 100000];

    % Initialize arrays to store execution times and absolute errors
    execution_times = zeros(size(n_values));
    absolute_errors = zeros(size(n_values));

    % 1. Time for various values of n
    for idx = 1:length(n_values)
        n = n_values(idx);
        
        tic;  % Start the timer
        results = MontePi(n);
        % Store the elapsed time
        execution_times(idx) = toc;  

        % 2. Store the absolute error for the current n
        absolute_errors(idx) = results(2);
    end

    % Plot execution times against n (1)
    figure;
    plot(n_values, execution_times, '-o');
    xlabel('Number of Points (n)');
    ylabel('Execution Time (s)');
    title('Execution Time vs. n');
    grid on;
    saveas(gcf, 'Plot 1"ExecutionTime vs n".png');

    % Plot absolute errors against n (2)
    figure;
    plot(n_values, absolute_errors, '-o');
    xlabel('Number of Points (n)');
    ylabel('Absolute Error');
    title('Absolute Error vs. n');
    grid on;
    saveas(gcf, 'Plot 2"AbsoluteError_vs_n".png');

    % 3. Display the random points for a fixed value of 10000
    n_fixed = 10000;
    results = MontePi(n_fixed);
    pi_approx = results(1);
    
    x_inside = zeros(1, n_fixed);
    y_inside = zeros(1, n_fixed);
    x_outside = zeros(1, n_fixed);
    y_outside = zeros(1, n_fixed);

    count_inside = 0;
    count_outside = 0;

    for i = 1:n_fixed
        x = rand();
        y = rand();
        
        if x^2 + y^2 <= 1
            count_inside = count_inside + 1;
            x_inside(count_inside) = x;
            y_inside(count_inside) = y;
        else
            count_outside = count_outside + 1;
            x_outside(count_outside) = x;
            y_outside(count_outside) = y;
        end
    end

    % put the arrays in the actual size
    x_inside = x_inside(1:count_inside);
    y_inside = y_inside(1:count_inside);
    x_outside = x_outside(1:count_outside);
    y_outside = y_outside(1:count_outside);
    figure;
    plot(x_inside, y_inside, 'g.', x_outside, y_outside, 'r.');
    xlabel('x');
    ylabel('y');
    title(['Random Points for n = ', num2str(n_fixed), '; π ≈ ', num2str(pi_approx)]);
    legend('Inside Circle', 'Outside Circle');
    axis equal;
    grid on;
    saveas(gcf, 'Plot 3"RandomPoints_n".png');

end

% Make MontePi function in part(a) as a subfunction
function results = MontePi(n)
    pi_true = pi;
    count_inside = 0;

    for i = 1:n
        x = rand();
        y = rand();

        if x^2 + y^2 <= 1
            count_inside = count_inside + 1;
        end
    end

    pi_approx = 4 * count_inside / n;
    abs_error = abs(pi_true - pi_approx);
    rel_error = abs_error / pi_true;
    results = [pi_approx, abs_error, rel_error];
end



