
#include <iostream>
#include <vector>
#include <cmath>
#include "pi_approx.h"
#include "approximations.h"

int main() {
    // Print the π approximation and error for N = 10000 using Q1
    PiResults result_q1 = pi_approx(10000);
    std::cout << "Pi approximation using 10000 intervals: " << result_q1.approx
              << ", Error: " << result_q1.error << std::endl;

    // Create a vector with elements {10^1, 10^2, ..., 10^7}
    std::vector<int> intervals;
    for (int i = 1; i <= 7; ++i) {
        intervals.push_back(std::pow(10, i));
    }

    // Print out the elements of the array from Q2 using this vector as an input
    PiResults* results_q2 = approximations(intervals);
    for (size_t i = 0; i < intervals.size(); ++i) {
        std::cout << "Pi approximation using " << intervals[i] << " intervals: "
                  << results_q2[i].approx << ", Error: " << results_q2[i].error << std::endl;
    }

    // Cleanup dynamically allocated memory
    delete[] results_q2;

    return 0;
}
