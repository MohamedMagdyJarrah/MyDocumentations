add_test([=[DivideTest.HandlesDivisionByZero]=]  [==[C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/Debug/2_TestingforExceptions.exe]==] [==[--gtest_filter=DivideTest.HandlesDivisionByZero]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[DivideTest.HandlesDivisionByZero]=]  PROPERTIES WORKING_DIRECTORY [==[C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build]==] SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test([=[DivideTest.HandlesValidDivision]=]  [==[C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/Debug/2_TestingforExceptions.exe]==] [==[--gtest_filter=DivideTest.HandlesValidDivision]==] --gtest_also_run_disabled_tests)
set_tests_properties([=[DivideTest.HandlesValidDivision]=]  PROPERTIES WORKING_DIRECTORY [==[C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build]==] SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set(  2_TestingforExceptions_TESTS DivideTest.HandlesDivisionByZero DivideTest.HandlesValidDivision)