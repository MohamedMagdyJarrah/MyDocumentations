if(EXISTS "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/1_BasicTestCase[1]_tests.cmake")
  include("C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/1_BasicTestCase[1]_tests.cmake")
else()
  add_test(1_BasicTestCase_NOT_BUILT 1_BasicTestCase_NOT_BUILT)
endif()