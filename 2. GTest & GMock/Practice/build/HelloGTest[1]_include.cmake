if(EXISTS "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/HelloGTest[1]_tests.cmake")
  include("C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/HelloGTest[1]_tests.cmake")
else()
  add_test(HelloGTest_NOT_BUILT HelloGTest_NOT_BUILT)
endif()
