# `const` in C++
- The `const` keyword in C++ means "this value cannot be changed after initialization." like C.
- But there is a difference in C++ as in C the linkage is `global` which will be accessible for other units while in C++ the linkage is `local` which will be accessible only within the same translation unit.
- `const` behaves like `#define` but in compilation process with type data checking, like:
    ```cpp
    const int value = 10;
    int main(void){
        std::cout << value << std::endl; // will be equivalent to (std::cout << 10 << std::endl;) in compilation time
        return 0;
    }
    ```
    But if we assign a variable or anything might or will be changed at the runtime, it will reserve a place in the memory and will not text replace in compilation time as we said.
    ```cpp
    int main(void){
        int x;
        std::cin >> x;
        const int value = x;
        std::cout << value << std::endl;
        return 0;
    }
    ```


# `constexpr` in C++
Introduced in C++11, `constexpr` means "evaluate this expression at compile time." (Forcing the evaluation).<br>
Used for:<br>
- Compile-time constants
- Functions that are evaluated during compilation

### 1. `constexpr` variables
```cpp
constexpr int x = 5; // evaluated at compile time
```
if we tried to assign to `constexpr` variable anything will change in runtime, it will give compilation error.
```cpp
constexpr int x = rand(); // Compilation error!!!
```

### 2. `constexpr` functions
Starting in C++14, `constexpr` functions can have more logic, like `if`, `for`, etc. Before C++14, the function should contain only one return statement.
```cpp
constexpr int square(int x) {
    return x * x;
}

int main() {
    constexpr int result = square(4); // evaluated at compile time
}
```
If there is no errors in `constexpr` scope but its argument working on runtime dependent so it will be a normal function.
```cpp
constexpr int sum(int x, int y) {
    return x + y;
}

int main() {
    const int result = sum(10, rand()); // This will let the sum function to be called and not evaluated in the compilation time. 
    constexpr int result = sum(10, rand()); // Will cause ERROR!!!, as the constexpr strict the evaluation to be in the compilation time and rand() can't be evaluated in compilation time
}
```
So, the best practice is to store the return value from `constexpr` functions in `constexpr` variables.

### 3. `if constexpr`
`if constexpr` causes the compiler to completely remove unnecessary branching.
```cpp
constexpr bool is_debug_mode = false;

void log(const char* msg) {
    if constexpr (is_debug_mode) {
        std::cout << msg << "\n";
    }
}

int main() {
    log("This will be stripped out at compile time");
}
```
The compiler will completely remove the logging code.

