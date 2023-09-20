# AMS595
project 1
Q1

main idea:
1.Change the number from base-n to base-10.
2.Change the base-10 number to base-m.
3.Display the result.

run the BaseConverter.m and input the n, a number in base n and the m,
then the result will be displayed. 
Any errors with numbers will be indicated by the corresponding error message.

Q2

Main idea:1.take the matrix A and vector b as inputs and check if they are vaild.
2.augment A with b to form the matrix [A|b].
3.perform Gaussian elimination on the augmented matrix and find the solution vector x from the last column of the augmented matrix.

run the GaussElim.m and input the matrix A and vector b then the result x will be displayed.
Any errors with numbers will be indicated by the corresponding error message.

Q3
(a)main idea:
1.Input the number (n) of random points to generate. 
2.A counter is initialized at 0 to keep track of the number of points that fall inside the quarter circle.
3.Monte Carlo Simulation
4.Calculate π and error Calculation
5.Results display show the three values required in order of Approximated value for π,Absolute error and Relative error

run the MontePi.m and input the number (n) of random points to generate,then the result will be displayed in order of Approximated value for π,Absolute error and Relative error.

(b)main idea:
1.A range of values n_values is defined, arrays execution_times and absolute_errors are initialized.
2.For each value of n in n_values, use the Monte Carlo method to approximate the execution time of each approximation is recorded.The absolute error is also computed.
3.Obtain plots 1 and 2 as required in question 1 and 2.
4.The random point generation process is shown by a fixed number of points n_fixed(in my case I choose 10000). The random points are plotted in two colors: inside the quarter circle and outside the quarter circle.
5.Save the plots in the MATLAB working directory.
6.Add nested funtion MontePi(n).

run the MontePiPlots then 3 plots as required will Automatically be saved in the the MATLAB working directory for analysis.
