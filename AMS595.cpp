//AMS595 
//1.
#include <iostream>

int main() {
    int n;
    std::cout << "Enter a number: ";
    std::cin >> n;

    switch (n) {
        case -1:
            std::cout << "negative one" << std::endl;
            break;
        case 0:
            std::cout << "zero" << std::endl;
            break;
        case 1:
            std::cout << "positive one" << std::endl;
            break;
        default:
            std::cout << "other value" << std::endl;
            break;
    }

    return 0;
}

//2.
#include <iostream>
#include <vector>

void print_vector(const std::vector<int>& v) {
    for (int i = 0; i < v.size(); ++i) {
        std::cout << v[i];
        if (i < v.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl; // Adds a newline
}

//3.
#include <iostream>

void print_fibonacci_up_to(int limit) {
    int a = 1, b = 2; // Start with the first two terms

    // Print the first two terms
    std::cout << a << ", " << b;

    // Generate the next terms by Starting  the while loop
    while (true) {
        int next = a + b; // Next term is the sum of the last two terms
        if (next > limit) // If the next term exceeds the limit, exit
            break;

        std::cout << ", " << next; // Print the next term
        a = b; // Move forward
        b = next;
    }
    std::cout << std::endl; // End with a newline character
}

int main() {
    print_fibonacci_up_to(4000000); // Call the function with 4,000,000 as the limit
    return 0;
}

//4.a
#include <iostream>
#include <cmath>

bool isprime(int n) {
    if (n <= 1) {
        return false; // 0 and 1 are not prime
    }
    if (n <= 3) {
        return true; // 2 and 3 are prime
    }
    if (n % 2 == 0 || n % 3 == 0) {
        return false; // exclude multiples of 2 and 3
    }
    for (int i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) {
            return false; // exclude other non-prime
        }
    }
    return true; // n is prime
}

void test_isprime() {
    std::cout << "isprime(2) = " << isprime(2) << '\n';
    std::cout << "isprime(10) = " << isprime(10) << '\n';
    std::cout << "isprime(17) = " << isprime(17) << '\n';
}

int main() {
    test_isprime();
    return 0;
}

//4b.
#include <iostream>
#include <vector>

std::vector<int> factorize(int n) {
    std::vector<int> answer;
    for (int i = 1; i <= n; ++i) {
        if (n % i == 0) {
            answer.push_back(i);
        }
    }
    return answer;
}

// print_vector function is defined in 2.
void print_vector(const std::vector<int>& v) {
    for (int i = 0; i < v.size(); ++i) {
        std::cout << v[i];
        if (i < v.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;
}

void test_factorize() {
    print_vector(factorize(2));
    print_vector(factorize(72));
    print_vector(factorize(196));
}

int main() {
    test_factorize();
    return 0;
}

//4c.
#include <iostream>
#include <vector>

std::vector<int> prime_factorize(int n) {
    std::vector<int> answer;
    while (n % 2 == 0) {
        answer.push_back(2);
        n = n / 2;
    }
    // Check for the possible odd numbers
    for (int i = 3; i * i <= n; i += 2) {
        while (n % i == 0) {
            answer.push_back(i);
            n = n / i;
        }
    }
    if (n > 2) {
        answer.push_back(n);
    }
    return answer;
}

// print_vector function is defined in 2.
void print_vector(const std::vector<int>& v) {
    for (int i = 0; i < v.size(); ++i) {
        std::cout << v[i];
        if (i < v.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;
}

void test_prime_factorize() {
    print_vector(prime_factorize(2));
    print_vector(prime_factorize(72));
    print_vector(prime_factorize(196));
}

int main() {
    test_prime_factorize();
    return 0;
}

//5
#include <iostream>
#include <vector>

void printPascalsTriangle(int n) {
    std::vector<int> previousRow, currentRow;
  
    for (int i = 0; i < n; i++) {
        currentRow.resize(i + 1);
        currentRow[0] = currentRow[i] = 1; 
        
        // Calculate the current row by using the previous row
        for (int j = 1; j < i; j++) {
            currentRow[j] = previousRow[j - 1] + previousRow[j];
        }
        
        // Print the current row
        for (int j = 0; j <= i; j++) {
            std::cout << currentRow[j] << " ";
        }
        std::cout << std::endl;
        
        // The current row becomes the previous row for the next iteration
        previousRow = currentRow;
    }
}