cmake_minimum_required(VERSION 3.14)
project(Practice)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(
  1_BasicTestCase
  1_BasicTestCase.cpp
)
target_link_libraries(
  1_BasicTestCase
  GTest::gtest_main
)

add_executable(
  2_TestingforExceptions
  2_TestingforExceptions.cpp
)
target_link_libraries(
  2_TestingforExceptions
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(1_BasicTestCase)
gtest_discover_tests(2_TestingforExceptions)