#include <stdexcept>

// Function to test
int Divide(int a, int b) {
    if (b == 0) {
        throw std::invalid_argument("Division by zero");
    }
    return a / b;
}

// Test case
#include <gtest/gtest.h>

TEST(DivideTest, HandlesDivisionByZero) {
    EXPECT_THROW(Divide(10, 0), std::invalid_argument);
}

TEST(DivideTest, HandlesValidDivision) {
    EXPECT_EQ(Divide(10, 2), 5);
}
