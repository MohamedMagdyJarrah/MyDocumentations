# What is Function Overloading?
Function overloading in C++ means you can define multiple functions with the same name but with different parameter types, order, or count.

# Why we need it?
To allow intuitive, clean, and reusable code, especially when an operation makes sense on different data types.

# Example Code:
```cpp
#include <iostream>

void print(int x) {
    std::cout << "Integer: " << x << std::endl;
}

void print(double x) {
    std::cout << "Double: " << x << std::endl;
}

void print(const std::string& x) {
    std::cout << "String: " << x << std::endl;
}
```
### This will call:
```cpp
print(42);         // calls print(int)
print(3.14);       // calls print(double)
print("hello");    // calls print(const std::string&)
```

# 🧠 What Happens Internally? (Name Mangling)
C++ uses a technique called name mangling to distinguish between overloaded functions behind the scenes.<br>
Each overloaded version gets a unique symbol name based on:<br>
- Function name
- Parameter types
- Number of parameters
- Parameter order
- (In some cases) const-ness and references
### 🔍 Example:
```cpp
void show(int);
void show(double);
```
They will be internally translated to something like:
```
_show_i    // for show(int)
_show_d    // for show(double)
```

# 📌 Rules for Function Overloading
You can overload a function if the signature is unambiguously different. Signatures include:
- Number of parameters
- Types of parameters
- Order of parameters

### 🟢 Valid Overloading:
```cpp
void add(int, int);
void add(double, double);
void add(int, double);
```

### 🔴 Invalid Overloading:
```cpp
int get();
double get();  // ❌ Error: only return type is different
```

# 🔥 Advanced Note: Default Arguments Can Cause Ambiguity
```cpp
void fun(int x);
void fun(int x, int y = 10); // ❌ Calling fun(5) is ambiguous!
```
Avoid default parameters in overloaded functions unless you're very careful.

# 🛠 Compiler Behavior Summary
1. When compiling, the compiler generates mangled names for each overloaded function.
2. During a function call, the compiler resolves which version to call based on best match (via overload resolution rules).
3. If it can’t find a clear match, it throws a compile-time error (ambiguous or no matching function).