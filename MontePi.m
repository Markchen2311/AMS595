function results = MontePi()
%^main idea of this coding:
%1.Input the number (n) of random points to generate. 
%2.A counter is initialized at 0 to keep track of the number of points that fall inside the quarter circle.
%3.Monte Carlo Simulation
%4.Calculate π and error Calculation
%5.Results display show the three values required in order of Approximated value for π,Absolute error and Relative error

    % Input the number of points to generate
    n = input('Enter the number of points for the Monte Carlo approximation: ');

    % The real value of pi
    pi_true = pi;

    % Counter for the number of points inside the quarter circle
    count_inside = 0;

    for i = 1:n
        % Generate random point (x, y) in [0, 1] x [0, 1]
        x = rand();
        y = rand();

        % Check whether the point is inside the quarter circle
        if x^2 + y^2 <= 1
            count_inside = count_inside + 1;
        end
    end

    % Approximate pi by the Monte Carlo method
    pi_approx = 4 * count_inside / n;

    % Compute the absolute error
    abs_error = abs(pi_true - pi_approx);

    % Compute the relative error
    rel_error = abs_error / pi_true;

    % Display the results
    fprintf('Approximated value for π: %f\n', pi_approx);
    fprintf('Absolute Error: %f\n', abs_error);
    fprintf('Relative Error: %f\n', rel_error);

    % Return the results as an array not only the value for the approximated value for π
    results = [pi_approx, abs_error, rel_error];
end
