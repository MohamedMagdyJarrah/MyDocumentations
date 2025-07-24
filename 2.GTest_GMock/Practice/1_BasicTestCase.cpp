#include <gtest/gtest.h>

// Function to test
int Add(int a, int b) {
    return a + b;
}

TEST(AddTest, HandlesPositiveNumbers) {
    EXPECT_EQ(Add(2, 3), 5);
}

TEST(AddTest, HandlesNegativeNumbers) {
    EXPECT_EQ(Add(-2, -3), -5);
}

TEST(AddTest, HandlesMixedNumbers) {
    EXPECT_EQ(Add(-2, 3), 1);
}
