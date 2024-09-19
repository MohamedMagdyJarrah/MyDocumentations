# This Documentation contains the following:
- [This Documentation contains the following:](#this-documentation-contains-the-following)
- [Matchers](#matchers)
- [Why use Matchers?](#why-use-matchers)
- [Comparison Matchers](#comparison-matchers)
  - [Generic and Numeric Comparison](#generic-and-numeric-comparison)
  - [Boolean and Pointer Comparison](#boolean-and-pointer-comparison)
  - [Reference Matcher](#reference-matcher)
  - [TypedEq Matcher](#typedeq-matcher)
  - [Wildcard](#wildcard)
- [String Matchers](#string-matchers)
  - [Regex in Matchers](#regex-in-matchers)
- [Floating-Point Matchers](#floating-point-matchers)
- [Composite Matchers](#composite-matchers)
    - [Examples:](#examples)
- [Container Matchers](#container-matchers)

# Matchers
A **matcher** matches a single argument.
| **Macro** | **Description**  |
| --------- | ---------------- |
| `EXPECT_THAT(actual_value, matcher)`	| Asserts that actual_value matches matcher. |
| `ASSERT_THAT(actual_value, matcher)`  |The same as EXPECT_THAT(actual_value, matcher), except that it generates a fatal failure. |

**BEST PRACTICE:** Prefer to make the comparison explicit via `EXPECT_THAT(actual_value, Eq(expected_value))` or `EXPECT_EQ(actual_value, expected_value)`.

Built-in matchers (where argument is the function argument, e.g. actual_value in the example above, or when used in the context of `EXPECT_CALL(mock_object, method(matchers))`, the arguments of method) are divided into several categories. All matchers are defined in the ::testing namespace unless otherwise noted.

# Why use Matchers?
**For example:**
We have here a test case use the matchers in different ways<br>
![alt text](Images/image43.png)<br>
- **Concise** and **Readable** <br>
    **Like:**<br>
    ```c++
    EXPECT_THAT(test_string, StartWith("Hello"));
    ```
- Already **Tested**<br>
  - As `StartWith` , `MatchesRegex` and `AllOf` are tested already before and its not necessary to re-invent the wheel and implement methods already implemented.
- Can be **Chained**
    **Like:**<br>
    ```c++
    EXPECT_THAT(test_value, AllOf(Gt(0),Lt(100)));
    ```
- Can be **Customized**
  - As we can make our own matcher to use it like the matchers provided from GTest, **Like:**<br>
  ![alt text](Images/image44.png)

> You can use this matchers directly with `using` keyword to use the matchers from `::testing::` namespace without qualifying the namespace.

```c++
using ::testing::AllOf;
using ::testing::Gt;
using ::testing::Lt;
using ::testing::MatchesRegex;
using ::testing::StartWith;
```

# Comparison Matchers
## Generic and Numeric Comparison
![alt text](Images/image45.png)
| **Macro** | **Description**  |
| --------- | ---------------- |
| `Eq(value)` or `value` | 	argument == value |
| `Ge(value)`	| argument >= value | 
| `Gt(value)`	| argument > value |
| `Le(value)`	| argument <= value |
| `Lt(value)`	| argument < value |
| `Ne(value)`	| argument != value |

## Boolean and Pointer Comparison
![alt text](Images/image46.png) ![alt text](Images/image47.png)
| **Macro** | **Description**  |
| --------- | ---------------- |
| `IsFalse()` | argument evaluates to false in a Boolean context. |
| `IsTrue()`	| argument evaluates to true in a Boolean context. |
| `IsNull()`	| argument is a NULL pointer (raw or smart).|
| `NotNull()`	| argument is a non-null pointer (raw or smart).|

## Reference Matcher
![alt text](Images/image48.png)
| **Macro** | **Description**  |
| --------- | ---------------- |
| `Ref(variable)`	| argument is a reference to variable. |

## TypedEq Matcher
![alt text](Images/image49.png)
| **Macro** | **Description**  |
| --------- | ---------------- |
| `TypedEq<type>(value)`	| argument has type type and is equal to value. You may need to use this instead of `Eq(value)` when the mock function is overloaded.|

## Wildcard
![alt text](Images/image50.png) ![alt text](Images/image51.png)
| **Macro** | **Description**  |
| --------- | ---------------- |
| `_`	| argument can be any value of the correct type. |
| `A<type>() or An<type>()`	| argument can be any value of type type.|

# String Matchers
![alt text](Images/image52.png)<br>
The argument can be either a C string or a C++ string object:
| **Macro** | **Description**  |
| --------- | ---------------- |
| `StrEq(string)` |	argument is equal to string. |
| `StrNe(string)` |	argument is not equal to string. |
| `StrCaseEq(string)`	| argument is equal to string, ignoring case. |
| `StrCaseNe(string)` |	argument is not equal to string, ignoring case. |
| `IsEmpty()` |	argument is an empty string.|

## Regex in Matchers
![alt text](Images/image53.png)<br>
| **Macro** | **Description**  |
| --------- | ---------------- |
| `ContainsRegex(string)` |	argument matches the given regular expression. |
| `EndsWith(suffix)` | argument ends with string suffix. |
| `HasSubstr(string)`| argument contains string as a sub-string. |
| `MatchesRegex(string)` | argument matches the given regular expression with the match starting at the first character and ending at the last character.|
| `StartsWith(prefix)` | argument starts with string prefix.|

# Floating-Point Matchers
These matchers use ULP-based comparison (the same as used in googletest). They automatically pick a reasonable error bound based on the absolute value of the expected value. 
![alt text](Images/image54.png)
![alt text](Images/image55.png) ![alt text](Images/image56.png)<br>
| **Macro** | **Description**  |
| --------- | ---------------- |
| `DoubleEq(a_double)`|	argument is a double value approximately equal to `a_double`, treating two `NaNs` as unequal.|
| `FloatEq(a_float)`| argument is a float value approximately equal to `a_float`, treating two `NaNs` as unequal.|
| `NanSensitiveDoubleEq(a_double)`| argument is a double value approximately equal to `a_double`, treating two `NaNs` as equal.|
| `NanSensitiveFloatEq(a_float)`|	argument is a float value approximately equal to `a_float`, treating two `NaNs` as equal.|
| `IsNan()`| argument is any floating-point type with a NaN value.| 


# Composite Matchers
You can make a matcher from one or more other matchers:
| **Macro** | **Description**  |
| --------- | ---------------- |
| `AllOf(m1, m2, ..., mn)`|argument matches all of the matchers m1 to mn.|
| `AllOfArray({m0, m1, ..., mn})`, `AllOfArray(a_container)`, `AllOfArray(begin, end)`, `AllOfArray(array)`, or `AllOfArray(array, count)`|The same as `AllOf()` except that the matchers come from an initializer list, STL-style container, iterator range, or C-style array.|
| `AnyOf(m1, m2, ..., mn)` |argument matches at least one of the matchers m1 to mn.|
| `AnyOfArray({m0, m1, ..., mn})`, `AnyOfArray(a_container)`, `AnyOfArray(begin, end)`, `AnyOfArray(array)`, or `AnyOfArray(array, count)`|The same as `AnyOf()` except that the matchers come from an initializer list, STL-style container, iterator range, or C-style array.|
| `Not(m)`| argument doesn’t match matcher m.|
| `Conditional(cond, m1, m2)`|	Matches matcher `m1` if `cond` evaluates to true, else matches `m2`.|
### Examples:
![alt text](Images/image57.png) ![alt text](Images/image58.png)
You can create a vector of `Matchers` and send it to `AllOfArray` as shown in the previous picture.

# Container Matchers
