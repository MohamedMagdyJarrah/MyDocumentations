# 🔸 Static Variables in a Class
Static member will be shared across all instances (only one copy exist) and it is indepenedet of class instances.
Must be defined outside the class.
```cpp
#include <iostream>
class Data 
{
public:
    Data()
    {
        stValue++;
    }

    static int stValue2;     // Must be defined outside the class
private:
    static int stValue;      // Must be defined outside the class
    static const int stConstValue = 5;  // Can be defined here if it const
    static const int stConstValue2;     // You will get an Error if you tried to initalize it in initializer list [Data(int x):stConstValue2(x)]
                                        // Because the construtor will be in runtime while the constant will be in .rodata which can't be changed
    static const float floatValue;      // Should be intialized outside the class if its datatype not int 
                                        // This will be error [static const float floatValue2 = 10;]

};
int Data::stValue = 0;      // Will be stored in the bss section also if I defined it like this (int Data::stValue;)
int Data::stValue2 = 10;    // Will be stored in .data segment as it is initialized wth value not 0
const int stConstValue2 = 1;    // Will be stored in .rodata
const float Data::floatValue = 10;    // Will be stored in .data segment as it is initialized wth value not 0

int main(){
    Data d;
    std::cout << d.stValue2 << std::endl;   // Can be accessed from an instance
    std::cout << Data::stValue2 << std::endl;   // Can be accessed with class name
    return 0;
}
```

### **Note**:
When you define a **static const** variable inside the class it will used for compile-time value substitution (**no storage allocated**).<br>
Where the following example will give an error:
```cpp
class Data 
{
public:
    Data() = default;
    static const int stConstValue = 5;  // Can be defined here if it const int

};

void test(const int& ref){}

int main() {
    test(Data::stConstValue);
    return 0;
}
```
It will give an error because the function needs a reference to a variable while the `stConstValue` is substituted with 5 in compile time.<br><br>

**To fix this issue:**
```cpp
class Data 
{
public:
    Data() = default;
    static const int stConstValue = 5;  // Can be defined here if it const int
};
const int Data::stConstValue;       // Definition for the static variable

void test(const int& ref){}

int main() {
    test(Data::stConstValue);
    return 0;
}
```
You need to provide a definition (**storage**) for the static member outside the class to get a storage in memory


# 🔸 Static Methods in a Class
It is also will be shared across all instances (only one copy exist) and it is indepenedet of class instances.
```cpp 
class Data 
{
private:
    int prv_member;
    static int static_member;
public:
    static void staticFun(){
        // prv_member = 10;     // Cannot access this as the static method not related to a specific instance
        static_member = 10;     // Accessable as we can access static members in the static methods
    }

    static void statstaticFun2();
};
int Data::static_member = 5;
void Data::staticFun2(){    // Take care don't type static again
    std::cout << "static fun" << std::endl;
}

int main() {
    Data d;
    d.staticFun();          // Can be called from an instance
    Data::staticFun();      // Can be called with class name
    return 0;
}
```
