# Types of Initialization in C++
In C++, variable initialization is a nuanced topic, especially when you consider the different types of variables—trivial data types (like `int`, `double`, etc.) and user-defined types (like `struct`, `class`).
## 1. Default Initialization
### ➤ Syntax:
```cpp
int x;             // value is **undefined** (garbage) in local scope
MyClass obj;       // calls default constructor (if defined)
```
### ➤ What Happens:<br>
- **Trivial types (e.g., int, float, etc.)**:
    - If declared locally, no value is assigned → it contains garbage (random memory).
    - If declared as global/static, they are zero-initialized by default.
- **User-defined types**:
    - If the class or struct has a default constructor, it will be called automatically.
    - If there’s no constructor, then it behaves like an aggregate (we’ll explain that later).
### ➤ Example:
```cpp
int x; // may contain garbage (uninitialized)

class A {
public:
    A() { std::cout << "Default constructor\n"; }
};

A a; // "Default constructor" is printed
```

<br><br>

## 2. Value Initialization
### ➤ Syntax:
```cpp
int a{};           // zero-initialized
MyClass obj{};     // calls default constructor
```
### ➤ What Happens:
- If the type is **trivial**, it gets zero-initialized.
- If it’s **user-defined**, the default constructor is called, or the object is zero-initialized if there is no constructor.

### ➤ Why It’s Safer:
This guarantees no garbage values for fundamental types.

### ➤ Example:
```cpp
int a{}; // a == 0

struct S {
    int x;
};

S s{}; // s.x == 0, even though S has no constructor
```

<br><br>

##  3. Direct Initialization
### ➤ Syntax:
```cpp
int x(42);
MyClass obj(5);
```
### ➤ What Happens:
- For **trivial** types, it's just assigning a value.
- For **user-defined** types, it calls the constructor that matches the argument type.

### ➤ Why Use It:
You get explicit control over which constructor is called.

### ➤ Example:
```cpp
class MyClass {
public:
    MyClass(int n) { std::cout << "Constructor with int: " << n << "\n"; }
};

MyClass obj(7); // prints "Constructor with int: 7"
```

### ➤ Note:
When you write something like:
```cpp
int x();  // looks like you're declaring a variable, but it's NOT. This is called vexing parse
```
This declares a function named `x` that takes no parameters and returns an `int`. It does not create a variable. This confusion only happens with trivial types or types without parentheses constructors.

<br><br>

## 4. Copy Initialization
### ➤ Syntax:
```cpp
int x = 42;
MyClass obj = 7;
```
### ➤ What Happens:
Behaves like **direct initialization**, but:
- Allows **implicit conversions**.
- Can call **copy constructor** or **conversion constructor**.

### ➤ Watch Out:
If your class has a constructor marked `explicit`, it won't work with copy initialization.As **Copy initialization** can invoke implicit conversions, and `explicit` blocks that.

### ➤ Example:
```cpp
class MyClass {
public:
    MyClass(int n) { std::cout << "Constructor with int: " << n << "\n"; }
};

MyClass obj = 10; // OK, int → MyClass (conversion constructor called)

class MyClass2 {
public:
    explicit MyClass2(int n) { std::cout << "Explicit constructor\n"; }
};

MyClass2 obj2 = 5; // ❌ ERROR: cannot use explicit constructor in copy init
```
where the `explicit` keyword prevents **automatic/implicit conversions** or **copy-like initialization** from happening.

## 5. List Initialization (Uniform Initialization)
### ➤ Syntax:
```cpp
int x{5};
MyClass obj{10};
```
### ➤ What Happens:
- Introduced in **C++11** to unify initialization syntax.
- Prevents narrowing conversions (like from `double` to `int`).
- Calls a constructor if the type is user-defined.
- For aggregates (like plain structs), it initializes members in order.

### ➤ Example:
```cpp
int x{3.14}; // ❌ Error: narrowing conversion

struct Point {
    int x, y;
};

Point p{1, 2}; // OK: aggregate initialization

class MyClass {
public:
    MyClass(int n) { std::cout << "Constructor with int\n"; }
};

MyClass obj{5}; // constructor with int is called
```

<br><br>

## 6. Aggregate Initialization
### ➤ Syntax:
```cpp
struct Point { int x, y; };
Point p1 = {1, 2};
```
### ➤ What Happens:
- Used for types with:
    - No constructors
    - No private or protected members
    - No base classes or virtual functions
- Initializes members in declaration order.

### ➤ Difference:
As soon as you define a constructor, the type is no longer aggregate.

### ➤ Example:
```cpp
struct A {
    int x, y;
};

A a = {1, 2}; // OK

struct B {
    int x;
    B(int val) {} // constructor present
};

// B b = {1}; // ❌ Error: no aggregate initialization, must use constructor
```

<br><br>

# ⚖️ Summary Table
| Initialization Type | Trivial Types (`int`, `double`)             | User-Defined Types (`class`, `struct`)             |
|----------------------|----------------------------------------------|-----------------------------------------------------|
| Default              | Uninitialized (local), Zero (global)         | Calls default constructor (if exists)              |
| Value `{}`           | Zero-initialized                             | Calls default constructor                          |
| Direct `()`          | Sets value directly                          | Calls matching constructor                         |
| Copy `=`             | Sets value                                   | Implicit conversion / copy constructor             |
| List `{}`            | Safer, no narrowing                          | Constructor or member-wise init                   |
| Aggregate `{}`       | Member-wise init (only aggregates)           | Member-wise init (no constructor required)         |
