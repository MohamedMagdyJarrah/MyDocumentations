if(EXISTS "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/death_test[1]_tests.cmake")
  include("C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/death_test[1]_tests.cmake")
else()
  add_test(death_test_NOT_BUILT death_test_NOT_BUILT)
endif()