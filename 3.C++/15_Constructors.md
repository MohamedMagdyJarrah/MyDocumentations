# What is a Constructor?
A constructor is a special member function with the same name as the class. It **automatically runs when an object is created**, and its job is to initialize the object's internal state.
Constructors do not return any value, not even `void`.

# Types of the Constructors:
## 1. Default Constructor
**A default constructor is either:**
- A constructor that takes **no parameters**.
- Or, a constructor where **all parameters have default values**.
#### Example
```cpp
class A {
public:
    A() {
        std::cout << "Default constructor" << std::endl;
    }

    // or 

    A(int x=0, int y=0) {
        std::cout << "Constructor with default values" << std::endl;
    }
};
```
`Note`: If you instantiate an object like that `A obj;`, you will receive compiler error because the compiler will confuse which constructor should be called.
While instantiating like that `A obj();` will call the first constructor where to call the second we need at least send one parameter `A obj(5);` or `A obj(5,6);`

#### 💡 Important Notes:
- If you don't write any constructor, the compiler **implicitly** generates a default constructor.
- But if you define any other constructor, the compiler won't generate a default constructor unless you **explicitly** do so.

#### ✅ Using `= default`:
```cpp
class A {
public:
    A() = default;  // Tells the compiler: "I want the default constructor"
};
```
This is useful when:
- You define other constructors but still want the default constructor.
- You're working with templates and need the constructor to exist for certain specializations.
##### Another Note:
There is another feature which is `= delete` which let us to delete specific method or Constructor and prevent it from usage.
```cpp
class A {
public:
    A() = default;
    A(int x) = delete;  // Prevent calling this parameterized constructor
};
```

## 2. Parameterized Constructor
A constructor that accepts one or more arguments.
#### Example
```cpp
class A {
    int x;
public:
    A(int value) {
        x = value;
    }
};
```
💡 `Notes`: If you define only parameterized constructors and **don’t define** a default constructor, you **can’t create** the object without arguments.
```cpp
A a(10);   // OK
A b;       // ❌ Error: No default constructor
```

## 3. Delegating Constructor (C++11)
A constructor that calls another constructor in the same class to reuse initialization logic.
#### Example:
```cpp
class A {
    int x;
public:
    A() : A(0) {}          // Delegates to A(int)
    A(int val) : x(val) {}
};
```
💡 `Benefit`: Avoids repeating initialization logic.
#### Notes:
- When delegating, the initializer list must only contain the constructor delegation expression. **You cannot initialize members alongside delegation**.
    ```cpp
    class A {
        int x;
    public:
        A() : A(42), x(5) {}  // ❌ Error: x(5) not allowed with delegation
    };
    ```
- The body of the delegating constructor runs after the constructor it delegates to has finished.
    ```cpp
    class A {
    public:
        A() : A(42) {
            std::cout << "Inside delegating constructor\n";
        }

        A(int x) {
            std::cout << "Inside delegated constructor with x = " << x << "\n";
        }
    };
    ```
    output:
    ```output
    Inside delegated constructor with x = 42
    Inside delegating constructor
    ```
- Delegating constructors **must not form a cycle**, directly or indirectly.
    ```cpp
    class A {
    public:
        A() : A(10) {}         // Delegates to A(int)
        A(int x) : A() {}      // ❌ Infinite recursion → Compile error
    };
    ``` 
    This causes an **infinite loop at compile-time** — the compiler catches it and throws an error.

