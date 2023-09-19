function x = GaussElim()
%the main idea of this coding:
%1.take the matrix A and vector b as inputs and check if they are vaild.
%2.augment A with b to form the matrix [A|b].
%3.perform Gaussian elimination on the augmented matrix and find the solution vector x from the last column of the augmented matrix.


    % Input A and b
    A = input('Enter the matrix A belongs to R^(n*n): ');
    b = input('Enter the vector b belongs to R^(n): ');

    % Check if A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A is not square.');
    end

    % Check if the dimensions of A and b match
    if length(b) ~= n
        error('Dimensions of A and b do not match.');
    end

    % Augment A with b to form [A|b]
    AugmentedMatrix = [A b];

    % Gaussian elimination
    for col = 1:n
        % Find the maximum in the column as pivot
        [~, max_row] = max(abs(AugmentedMatrix(col:end, col)));
        max_row = max_row + col - 1;
        
        % Swap the row containing the maximum value and the current row
        if max_row ~= col
            AugmentedMatrix([col, max_row], :) = AugmentedMatrix([max_row, col], :);
        end
        
        % Make sure pivot is not zero
        if AugmentedMatrix(col, col) == 0
            error('Matrix is singular.');
        end
        
        % Normalize the pivot row
        AugmentedMatrix(col, :) = AugmentedMatrix(col, :) / AugmentedMatrix(col, col);
        
        % Eliminate other rows
        for row = 1:n
            if row ~= col
                factor = -AugmentedMatrix(row, col);
                AugmentedMatrix(row, :) = AugmentedMatrix(row, :) + factor * AugmentedMatrix(col, :);
            end
        end
    end

    % Return the solution vector x
    x = AugmentedMatrix(:, end);

    % Display the result as a matrix
    fprintf('The solution matrix x is:\n');
    fprintf('| %f |\n', x);
end

