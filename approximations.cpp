
#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <vector>

// Reusing the PiResults struct and pi_approx function from the previous solution
struct PiResults {
    double approx;
    double error;
};

PiResults pi_approx(int N) {
    double a = 0.0, b = 1.0;
    double h = (b - a) / N;
    double sum = (sqrt(1 - a * a) + sqrt(1 - b * b)) / 2.0;
    for (int i = 1; i < N; i++) {
        double x_i = a + i * h;
        sum += sqrt(1 - x_i * x_i);
    }
    double pi_approx = 4 * h * sum;
    PiResults results{pi_approx, std::abs(M_PI - pi_approx)};
    return results;
}

// Function to take a vector of integers and return a dynamically allocated array of PiResults
PiResults* approximations(const std::vector<int>& intervals) {
    PiResults* results = new PiResults[intervals.size()]; // dynamic allocation
    for (size_t i = 0; i < intervals.size(); ++i) {
        results[i] = pi_approx(intervals[i]);
    }
    return results;
}

// Example usage
int main() {
    std::vector<int> intervals{10, 100, 1000, 10000}; // example intervals
    PiResults* results = approximations(intervals);

    // Output the results
    for (size_t i = 0; i < intervals.size(); ++i) {
        std::cout << "Approximation with " << intervals[i] << " intervals: "
                  << results[i].approx << ", Error: " << results[i].error << std::endl;
    }

    // Don't forget to deallocate the dynamic memory
    delete[] results;
    return 0;
}
