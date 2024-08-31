# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-src")
  file(MAKE_DIRECTORY "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-src")
endif()
file(MAKE_DIRECTORY
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-build"
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix"
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/tmp"
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/src"
  "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/My Data/Personal Documentation Repo/MyDocumentations/2. GTest/Practice/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
