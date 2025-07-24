# 🎯 What is Casting?
Casting means converting a value from one type to another. In C++, we can do it using:
- **C-style casting** (like in C)
- **C++ casting** (safer, more expressive, and clearer)

### 🟦 1. Implicit Casting (Type Promotion)
- Done automatically by the compiler
- Safe (usually)
```cpp
int i = 10;
double d = i;  // int → double implicitly
```
### 🟥 2. Explicit Casting (Type Conversion)
- You tell the compiler: “I know what I’m doing” 😎
- Can be done using **C-style** or **C++-style casts**


# 🔧 Types of Casts in C++[]
C++ provides **4 types of explicit casts**, each with a specific purpose:
| Cast Type             | Syntax                       | Use Case           |
|-----------------------|------------------------------|--------------------|
|  `static_cast`        | `static_cast<T>(expr)`       | Most common: for related types (int ↔ float, base ↔ derived) |
|  `const_cast`         | `const_cast<T>(expr)`        | Adds or removes `const` or `volatile` |
|  `reinterpret_cast`   | `reinterpret_cast<T>(expr)`  | Low-level, bitwise reinterpretation (dangerous)  |
|  `dynamic_cast`       | `dynamic_cast<T>(expr)`      | Safe casting for polymorphic types (with `virtual` functions)  |

### Click on the type to read about it 👇:
- [static_cast](#1-static_cast)
- [const_cast](#2-const_cast)
- [reinterpret_cast](#3-reinterpret_cast)
- [dynamic_cast](#4-dynamic_cast)


## 1. `static_cast`
### ✅ Purpose:
- Converts between related types where no runtime check is needed.
- **Safer** than C-style cast — it only allows conversions that make sense.
- Commonly used for:
    - Numeric type conversions
    - Upcasting in class hierarchies
    - Converting void pointers
    - Calling conversion operators
#### 📌 Syntax:
```cpp
static_cast<new_type>(expression);
```
#### ✅ Example 1: Numeric conversion
```cpp
int i = 42;
double d = static_cast<double>(i);  // int → double
```
#### ✅ Example 2: Pointer upcasting (safe)
```cpp
class Base {};
class Derived : public Base {};

Derived d;
Base* b = static_cast<Base*>(&d);  // Derived* → Base*
``` 

## 2. `const_cast`
### ✅ Purpose:
- **Adds** or **removes** `const` or `volatile` qualifiers from a variable
- Allows calling functions that require non-const parameters on const data (⚠️ **carefully**)

#### 📌 Syntax:
```cpp
const_cast<new_type>(expression);
```

### ✅ Example: Removing const to pass into legacy API
```cpp
void legacy_func(char* msg) {
    std::cout << msg << '\n';
}

const char* txt = "Hello";
legacy_func(const_cast<char*>(txt));
```

### ⚠️ Dangerous Case:
```cpp
const int x = 5;
int* p = const_cast<int*>(&x);
*p = 10;  // ❌ UNDEFINED BEHAVIOR!
```
**Why?**<br>
Because `x` was originally declared as `const`. You're now violating the compiler's and optimizer's assumptions.
> The compiler might place `x` in read-only memory (e.g., .`rodata` section). Modifying it could crash your program or silently fail.

### ✅ When Is It Actually Okay to `const_cast`?
When the object was not originally defined as `const`, but it’s been **temporarily** treated as `const`, you can remove the `const` safely.
#### ✅ Safe Example:
```cpp
void printAndModify(int* data) {
    *data = 99;
}

void foo(const int* ptr) {
    printAndModify(const_cast<int*>(ptr));  // OK *IF* original object wasn't const
}

int main() {
    int x = 10;
    foo(&x);  // safe: x is not const
}
```
Here’s what’s happening:
- `x` is non-const.
- You're passing it into a function that expects `const int*` (e.g., an API signature).
- You then remove the const internally and modify it.
- ✅ That’s okay, because the object was **never truly const** to begin with.


### 💡 Golden Rule
> 🟨 Only use `const_cast` to remove `const` **if you're absolutely sure the object was not originally const**.

If you're modifying an object that was declared `const`, don’t do it — it’s not safe, it’s not portable, and it’s not good practice

## 3. `reinterpret_cast`
### ✅ Purpose:
- Reinterpret the **bit pattern** of an object as another type.
- No type safety or guarantees
- Used for:
    - Casting between unrelated pointer types
    - Casting pointers to integers and back
    - Low-level memory manipulation
    - Interfacing with hardware / system calls

#### 📌 Syntax:
```cpp
reinterpret_cast<new_type>(expression);
```

#### ✅ Example: int* → char*
```cpp
int x = 65;
char* p = reinterpret_cast<char*>(&x);
std::cout << *p;  // Might print 'A' depending on endianness
```

### ⚠️ Notes:
- Very low-level — use only when you’re doing something platform-specific or dangerous on purpose.
- Almost never safe for polymorphic classes.

## 4. `dynamic_cast`