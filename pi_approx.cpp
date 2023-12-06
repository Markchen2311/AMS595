
#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <vector>

// Define a struct to hold the approximation and the error.
struct PiResults {
    double approx;
    double error;
};

// Function to approximate pi using the trapezoidal rule.
PiResults pi_approx(int N) {
    double a = 0.0, b = 1.0; // Limits of integration
    double h = (b - a) / N;   // Width of each trapezoid
    double sum = 0.0;         // Initialize sum to zero

    // Apply the trapezoidal rule
    for (int i = 1; i < N; i++) {
        double x_i = a + i * h;
        sum += sqrt(1 - x_i * x_i);
    }
    // Add the first and last terms
    sum += (sqrt(1 - a * a) + sqrt(1 - b * b)) / 2.0;
    double pi_approx = 4 * h * sum; // Approximation of pi

    PiResults results;
    results.approx = pi_approx;
    results.error = std::abs(M_PI - pi_approx); // Absolute error

    return results;
}

// Main function to display the approximation and error.
int main() {
    int N; // Number of intervals
    std::cout << "Enter the number of intervals (N): ";
    std::cin >> N;

    PiResults results = pi_approx(N);

    std::cout << "Approximated value of pi: " << results.approx << std::endl;
    std::cout << "Absolute error: " << results.error << std::endl;

    return 0;
}
