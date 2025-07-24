# `const` Data Members in C++
When you declare a `const` data member in a class, it must be initialized. You have two options to initialize it:
1. **Use the member initializer list in the constructor.**
2. **Provide a default initializer inside the class.**
You **cannot** leave a `const` member uninitialized, as this will cause a compilation error.
```cpp
class Data
{
    const int mValue1;        // Must be initialized in the constructor
    const int mValue2 = 5;    // Initialized directly in the class (C++11 and later)

public:
    // Constructor initializes mValue1 using the initializer list.
    Data(int value1) : mValue1(value1)
    {
        // mValue2 is already initialized to 5, no need to do anything here.
    }

    // Uncommenting the default constructor below will result in a compilation error
    // because mValue1 would remain uninitialized.
    //
    // Data() {}  // ❌ Error: mValue1 must be initialized
};
```
#### Note:
If you provide an in-class initializer (like `mValue2 = 5`), it will be used unless the constructor explicitly initializes that member.
**In the previous code:**
```cpp
Data(int value1) : mValue1(value1)
{
    // mValue2 is already initialized to 5, no need to do anything here.
}
```
```cpp
Data(int value1) : mValue1(value1), mValue2(6)
{
    // mValue2 will be 6, as it explicitly initialized and will ignore the value initialized in the class (5)
}
```

# `const` methods in Class
A member function marked as `const` **promises not to modify the object’s state** (i.e., it won't change any non-mutable member variables).
```cpp
class MyClass {
    int mValue;

public:
    int getValue() const;  // const member function
};
```
### What it means:
- The function **cannot modify** any member variables.
- The function **cannot call non-const** member functions.

#### Example:
1. You cannot modify any members
2. You can create local variables and modify them.
3. You can modify parameters passed to the function.
4. You can modify static members
5. You can use mutable if you want to modify member variable inside `const` (**not recommended**)
6. `const` instance can only call `const` member functions.
7. Non `const` instances can call both const and non const member functions.
8. Normal instance will call normal function even if it is overloaded with `const` one.
9. `const` member functions shall not return non constant referance to class members. 
10. You can modify reference members but we can't do that with pointers.
```cpp
class MyClass {
    int mValue;
    mutable int mValue1;    // (5)
    int *ptr;
    int &num;
    static int static_var;

public:
    MyClass(int val, int val1) : mValue(val), mValue1(val1), ptr(&this->a), num(this->a) {}

    int getValue(int parm) const {
        // mValue = 10;  // ❌ Error: can't modify member variable in const function (1)
        int local_var = 0;
        local_var++;    // ✅ OK (2)
        parm++;         // ✅ OK (3)
        static_var = 5; // ✅ OK (4)
        num = 5;        // ✅ OK (10)
        ptr = &a;       // ❌ Error (10)
        return mValue;
    }

    int getValue(int parm) {
        return mValue;
    }

    void setValue(int val) {
        mValue = val;  // ✅ OK in non-const function
    }

    int* getPtr() const { return ptr; } // ❌ Issue (9)
    int& getNum() const { return num; } // ❌ Issue (9)
};
int MyClass::static_var = 0;

int main(void)
{
    const MyClass var1(5,6);
    var1.getValue(5);   // ✅ OK (6)
    var1.setValue(5);   // ❌ Compiler Error (6)

    MyClass var2(5,5);
    var2.getValue(5);   // ✅ OK (7) (8)
    var2.setValue(5);   // ✅ OK (7)

    return 0;
}
```