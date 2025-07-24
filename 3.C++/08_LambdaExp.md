# What is Lambda Expression?
It is an anonymous function—a function defined without a name—that you can define directly in the place where it’s invoked or passed as an argument. It was introduced in C++11 and has become more powerful in later standards like C++14, C++17, and C++20.

# Basic Syntax of Lambda Expression
```cpp
[capture](parameters) -> return_type { // We can remove the return_type and the complier will deduce it
    // function body
}
```
- `capture`: Defines which variables from the surrounding scope are accessible inside the lambda.
- `parameters`: List of parameters like a normal function.
- `return_type`: (Optional) The return type of the lambda.
- `{}`: Function body.

# Example
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> numbers = {1, 2, 3, 4, 5};

    // Lambda that prints each number
    std::for_each(numbers.begin(), numbers.end(), [](int n) {
        std::cout << n << " ";
    });

    return 0;
}
```
Output:
> 1 2 3 4 5

We can call the lambda expression direct like this:
```cpp
[](){
    std::cout << "Standalone lambda expression" << std::endl;
}();
```

Since `c++14`, we can initailize variable by reference or value in the capture clause:
```cpp
int temp = 5;
auto fun = [&v = temp, x = 6](){
    std::cout << v << std::endl;
    std::cout << x << std::endl;
};
```
**Note**: We can change only `v` as it passed by reference, but we can't change `x` as it passed by value and we should use keyword `mutable` to manipulate it.

# Capture Clause
The capture clause is used to specify which variables from the outer scope you want to use inside the lambda.
| Capture     | Meaning                                      |
|-------------|----------------------------------------------|
| `[ ]`       | Capture nothing                              |
| `[=]`       | Capture all external variables by value      |
| `[&]`       | Capture all external variables by reference  |
| `[x]`       | Capture `x` by value                         |
| `[&x]`      | Capture `x` by reference                     |
| `[=, &x]`   | Capture all by value, but `x` by reference   |
| `[this]`    | Capture `this` pointer (useful in classes)   |


# Lambda behind the scenes:
- ## Simple Lambda
    ```cpp
    auto lambda = [](int x) { return x * 2; };
    int result = lambda(5);
    ```
    ### That Internally Transformed (C++ Compiler Perspective) to:
    ```cpp
    class __Lambda_1 {
    public:
        int operator()(int x) const {
            return x + a;
        }
    };

    __Lambda_1 lambda;
    int result = lambda(5);
    ```
    💡 So a lambda is just a compiler-generated class with an overloaded `operator()`.

- ## Lambda with Capture by Value
    ```cpp
    int a = 10;
    auto lambda = [a](int x) { return x + a; };
    ```

    ### Internally Desugared
    ```cpp
        int a = 10;

    class __lambda_6_15
    {
    public: 
    inline /*constexpr */ int operator()(int x) const
    {
        return x + a;
    }

    private: 
    int a;

    public:
    __lambda_6_15(int & _a)
    : a{_a}
    {}

    };

    __lambda_6_15 lambda = __lambda_6_15{a};
    ```
    💡 The value from the capture list will be copied inside the member of the lambda class but we can't manipulate this copy as we didn't specifiy lambda as mutable

- ## Mutable Lambda (Allows Modifying Captured-by-Value Variables)
    ```cpp
    int a = 10;
    auto lambda = [a]() mutable {
        a += 5;
        return a;
    };
    ```
    ### Internally Desugared
    ```cpp
        int a = 10;
    class __lambda_6_19
    {
        public: 
        inline /*constexpr */ int operator()()
        {
        a = a + 5;
        return a;
        }
        
        private: 
        int a;
        
        public:
        __lambda_6_19(int & _a)
        : a{_a}
        {}
        
    };
    
    __lambda_6_19 lambda = __lambda_6_19{a};
    ```
    💡 Here as we specified the lambda with `mutable` the const keyword from the opertaor overloading is removed and we can change in the copy we took.

- ## Lambda with Capture by Reference
    ```cpp
    int a = 10;
    auto lambda = [&a](int x) { return x + a; };
    ```
    ### Internally Desugared
    ```cpp
    int a = 10;
        
    class __lambda_6_15
    {
        public: 
        inline /*constexpr */ int operator()(int x) const
        {
        return x + a;
        }
        
        private: 
        int & a;
        
        public:
        __lambda_6_15(int & _a)
        : a{_a}
        {}
        
    };
    
    __lambda_6_15 lambda = __lambda_6_15{a};
    ```
    💡 Here the member inside the lambda class is a refrenece with the same data type in the capture clause, So any change with this member will change the original one.
    > You can change the value of the variable passed by ref in caputure and no need to specify lambda with `mutable`

# Note:
We can assign the lambda expression to a pointer to function like this:
```cpp
void (*pf)(int x) = [](int x){
    std::cout << "Pointer to function" << std::endl;
};
pf(2);
```
but if there is any variable passed in the capture clause, this will cause an error:
```cpp
// Errror !!!!!
void (*pf)(int x) = [number](int x){
    std::cout << "Pointer to function" << std::endl;
};
```
Then you will need to assign the lambda expression to `function` class object from `std`:
```cpp
std::function<void(int x)> pf = [number](int x){
    std::cout << "Function object" << std::endl;
};
pf(2);
```
or using `auto` keyword:
```cpp
auto pf = [number](int x){
    std::cout << "Function object" << std::endl;
};
pf(2);
```

# Do Lambdas Take More Space in the `.text` Section?
✅ Sometimes. But Not Always. It Depends.
### 🔸 1. Stateless Lambdas (No Capture)
```cpp
auto lambda = [](int a, int b) { return a + b; };
```
- This is functionally identical to:
    ```cpp
    int add(int a, int b) { return a + b; }
    ```
- In this case, the compiler may optimize the lambda to use a regular function pointer internally.
- Text section size difference: negligible or none.<br>

🟢 No practical increase in .text size.


### 🔸 2. Capturing Lambdas
```cpp
int x = 5;
auto lambda = [x](int a) { return a + x; };
```
- The compiler generates a **unique class** with:
    - A `constructor`
    - A call operator (i.e., `operator()`)
- These functions live in the `.text` section.<br>

🟡 May increase `.text` size slightly due to extra code.


### 🔸 3. Use with `std::function`
When you wrap a lambda in `std::function`, things can get heavier:
```cpp
std::function<int(int)> f = [x](int a) { return a + x; };
```
- You get:
    - Type-erased wrappers
    - Possibly more indirections
    - Virtual function-like behavior <br>

🔴 Likely increases `.text` (and `.rodata`) size more noticeably.

# ✅ When to Use Lambda Expressions?
## 1. Short, One-Off Functions
Use lambdas when you need a small function used only once, especially if defining a named function would be overkill.
```cpp
std::vector<int> v{1, 2, 3, 4};
std::for_each(v.begin(), v.end(), [](int x) {
    std::cout << x << " ";
});
```
✔️ Cleaner than writing a full function.

## 2. Custom Sorting and Comparisons
Perfect for passing quick comparison logic to `std::sort`, `std::set`, etc.
```cpp
std::sort(v.begin(), v.end(), [](int a, int b) {
    return a > b;
});
```
✔️ More readable than writing a comparator function separately.

## 3. Callbacks and Event Handlers
Useful in GUI code, networking, async systems, etc.
```cpp
register_callback([](int status) {
    std::cout << "Status: " << status << "\n";
});
```
✔️ Allows logic to be defined where it's used.

## 4. Functional Programming Style
Use lambdas with STL algorithms like `transform`, `filter`, `reduce`, etc.
```cpp
std::transform(v.begin(), v.end(), v.begin(), [](int x) {
    return x * x;
});
```
✔️ Encourages functional, expressive code.

## 5. Capturing Local Variables for Later Use
Especially useful when closures are needed.
```cpp
int offset = 5;
auto adder = [offset](int x) {
    return x + offset;
};
std::cout << adder(10);  // prints 15
```
✔️ Captures context and holds state.

## 6. Generic Lambdas (Since C++14)
Great for reusable inline templates.
```cpp
auto add = [](auto a, auto b) { return a + b; };
std::cout << add(3, 4);       // 7
std::cout << add(1.5, 2.5);   // 4.0
```
✔️ Simple, reusable generic functions without templates.

