# Matchers
A **matcher** matches a single argument.
| **Macro** | **Description**  |
| --------- | ---------------- |
| `EXPECT_THAT(actual_value, matcher)`	| Asserts that actual_value matches matcher. |
| `ASSERT_THAT(actual_value, matcher)`  |The same as EXPECT_THAT(actual_value, matcher), except that it generates a fatal failure. |

**BEST PRACTICE:** Prefer to make the comparison explicit via `EXPECT_THAT(actual_value, Eq(expected_value))` or `EXPECT_EQ(actual_value, expected_value)`.

Built-in matchers (where argument is the function argument, e.g. actual_value in the example above, or when used in the context of `EXPECT_CALL(mock_object, method(matchers))`, the arguments of method) are divided into several categories. All matchers are defined in the ::testing namespace unless otherwise noted.

## Why use Matchers?
### For example:
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

### You can use this matchers directly with `using` keyword to use the matchers from `::testing::` namespace without qualifying the namespace.
```c++
using ::testing::AllOf;
using ::testing::Gt;
using ::testing::Lt;
using ::testing::MatchesRegex;
using ::testing::StartWith;
```

## Comparison Matchers
