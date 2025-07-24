# What is `auto` in C++?
auto tells the compiler to **deduce the type** of a variable **from its initializer** at compile time.
```cpp
auto x = 42;          // int
auto name = "Ali";    // const char*
auto pi = 3.14;       // double
```

# 🔧 Why Use `auto`?
✅ Avoid redundancy <br>
✅ Simplify complex types (especially iterators, lambdas, templates) <br>
✅ Make refactoring easier <br>
✅ More readable and less error-prone <br>

# ✅ Usage Examples

### 🔹 Basic Variables
```cpp
auto a = 5;          // int
auto b = 5.0;        // double
auto c = 'c';        // char
auto s = "Hello";    // const char*
```

### 🔹 With Containers and Iterators
Without `auto`:
```cpp
std::vector<int> vec = {1, 2, 3};
std::vector<int>::iterator it = vec.begin();
```
With `auto`:
```cpp
auto it = vec.begin();  // much cleaner!
```


### 🔹 With Ranges and Loops
```cpp
for (auto it = vec.begin(); it != vec.end(); ++it) {
    std::cout << *it << '\n';
}

for (auto x : vec) {
    std::cout << x << '\n';
}
```

### 🔹 With Lambda Expressions
```cpp
auto add = [](int a, int b) {
    return a + b;
};
std::cout << add(2, 3);  // 5
```

# 🚨 Watch Out: Type Deduction Rules
### 1. Top-level `const` is dropped:
```cpp
const int x = 5;
auto a = x;        // a is int, not const int
```
To preserve `const`:
```cpp
const auto b = x;  // b is const int
```
### 2. References are dropped by default:
```cpp
int x = 10;
int& ref = x;
auto y = ref;     // y is int, NOT int&
```
To keep the reference:
```cpp
auto& z = ref;    // z is int&
```

### 3. References and Pointers with const variable:
Complier is smart enough to catch const with references and pointers
```cpp
const int x = 10;
auto &var1 = x;     // const int& var1 = x
auto ptr = &x;      // const int* var1 = x
```

# 🧠 Best Practices
| Tip                            | Reason                                |
|--------------------------------|----------------------------------------|
| Use `auto` for iterators       | Avoid long, unreadable types           |
| Use `auto` when type is obvious| Improves readability                   |
| Use `auto` with lambdas        | Type is impossible to write manually   |
| Don’t overuse `auto`           | It can make code harder to understand  |
| Use `auto&` or `const auto&`   | If you want to keep reference behavior |
