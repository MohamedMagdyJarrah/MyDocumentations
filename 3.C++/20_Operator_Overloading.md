# Operator Overloading
**Operator Overloading** is a feature in C++ that allows you to redefine the meaning of an operator (`+`, `-`, `==`, `[]`, etc.) for **user-defined types** like classes or structs.<br>
This means you can make `MyClass` + `MyClass` behave in a meaningful way (e.g., add two complex numbers, or vectors).

## General Syntax
```cpp
return_type ClassName::operatorOP(const ClassName& rhs) {
    // implementation
}
```
**Example:**
```cpp
Complex Complex::operator+(const Complex& other) {
    return Complex(real + other.real, imag + other.imag);
}
```
or as implement it as a `friend`:
```cpp
friend return_type ClassName::operatorOP(const ClassName& lhs, const ClassName& rhs) {
    // implementation
}
```
it can be also only rhs if it is `unary` operator
```cpp
friend return_type ClassName::operatorOP(const ClassName& rhs) {
    // implementation
}
```


## Behind the Scene
When you write code like:
```cpp
Complex a(1, 2);
Complex b(3, 4);
Complex c = a + b;
```
You might think `a + b` is a normal arithmetic operation. But actually, the compiler transforms this into a **function call**:
```cpp
Complex c = a.operator+(b);
```

## Types of Operators You Can Overload:
### 1. Unary Operators
Work on **one operand**.<br>
**Examples**:
- `+obj`
- `-obj`
- `++obj` (prefix)
- `obj++` (postfix)
- `--obj` (prefix and postfix)
- `!obj`
```cpp
class Number {
    int value;
public:
    Number(int v) : value(v) {}
    Number operator-() const { return Number(-value); } // Unary minus
};
```

### 2. Binary Operators
Work on **two operands**.<br>
**Examples**:
- `+`
- `-`
- `*`
- `/`
- `%`
```cpp
class Complex {
    float real, imag;
public:
    Complex(float r, float i) : real(r), imag(i) {}
    Complex operator+(const Complex& other) {
        return Complex(real + other.real, imag + other.imag);
    }
};
```

### 3. Assignment Operators
You can also overload the assignment `=` and compound assignment (`+=`, `-=`, etc.)
```cpp
class MyClass {
    int x;
public:
    MyClass& operator=(const MyClass& rhs) {
        if (this != &rhs) {
            x = rhs.x;
        }
        return *this;
    }
};
```

### 4. Relational Operators
To compare objects: `==`, `!=`, `<`, `>`, `<=`, `>=`
```cpp
class Box {
    int volume;
public:
    Box(int v) : volume(v) {}
    bool operator==(const Box& b) const {
        return volume == b.volume;
    }
};
```

### 5. Stream Insertion and Extraction
The `<<` and `>>` operators are usually overloaded as friend functions because:
- The left-hand operand (`std::cout` or `std::cin`) is not an object of your class, so the operator can’t be a member function.
- They often need access to private members, which friend functions can access.

The operator function takes both operands as arguments, and returns the left-hand operand by reference to support chaining. This makes the friend function approach the correct and practical solution.
```cpp
#include <iostream>
class Point {
    int x, y;
public:
    Point(int a, int b) : x(a), y(b) {}
    friend std::ostream& operator<<(std::ostream& os, const Point& p) {
        os << "(" << p.x << ", " << p.y << ")";
        return os;
    }
};
```

### 6. Indexing Operator `[]`
Used to access elements in a custom way.
```cpp
class MyArray {
    int arr[10];
public:
    int& operator[](int index) {
        return arr[index];
    }
};
```

### 7. Function Call Operator `()`
Allows objects to behave like functions.
```cpp
class Functor {
public:
    void operator()(int x) {
        std::cout << "Called with " << x << std::endl;
    }
};
```

### 9. Postfix Increment/Decrement
To distinguish prefix from postfix:
```cpp
// Prefix
ClassName& operator++() {
    // do something
    return *this;
}

// Postfix (use int as dummy argument)
ClassName operator++(int) {
    ClassName temp = *this;
    // do something
    return temp;
}
```

### Operators That Cannot Be Overloaded
Some operators cannot be overloaded in C++:
- `::` (Scope resolution)
- `.` (Member access)
- `.*` (Pointer-to-member)
- `sizeof`
- `typeid`
- `alignof`
- `static_cast`, `dynamic_cast`, etc.

