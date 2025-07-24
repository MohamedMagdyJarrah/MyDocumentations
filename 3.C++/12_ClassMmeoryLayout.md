# Basic Idea
In C++, structs and classes have identical memory layout rules (the only difference is the default access modifier: `public` for `struct`, `private` for `class`).<br>
- Now, when you create a **struct** or **class**, only data members (fields) are actually stored inside the object's memory.<br>
- **Member functions** live elsewhere and are shared across all instances!

<br><br>

# Where Are Things Stored?
| Item | Memory Section | Notes |
|:-----|:---------------|:------|
| Object's data members | Stack or Heap (depending on allocation) | Inside the object memory itself. |
| Member functions (code) | Text/code segment | Only one copy shared for all objects. |
| Virtual function tables (vtable, if polymorphism exists) | Data segment / read-only segment | Pointer to a vtable inside object. |
| Static data members | Data segment (or BSS if uninitialized) | Shared between all instances. |
| Non-static data members | Inside each object | Unique per object. |

<br><br>

# Example:
```cpp
class X{
    int x;
    float xx;
public:
    X() {}
    ~X() {}
    void printInt();
    void printFloat();
};
```
Will be converted to:
```
    |                       |
    |-----------------------| <---- X class object memory layout
    |       int X::x;       |   
    |-----------------------|   Stack Segment
    |      float X::xx;     |        |
    |-----------------------|       \|/
    |                       |        
    |                       |
    |                       |
----|-----------------------|----------      
    |         X::X()        |
    |-----------------------|       
    |        X::~X()        |       |
    |-----------------------|       |
    |     X::printInt()     |      \|/
    |-----------------------|   Text Segment
    |     X::printFloat()   |
    |-----------------------|
    |                       |        
```
Function exists **once** in **code segment**, not copied per instance.

<br><br>

# Note:
If we create a class and create inside it an inline function, The function will not be added in code segment (.text) until we create an instance from it.
```cpp
class X{
    int x;
public:
    void printInt(){
        std::cout << "The value of int:" << x << std::endl;
    }
};

int main(void){
    return 0;
}
```
while if we only delared the protoype of the function inside the class and created the function outside it like this:
```cpp
class X{
    int x;
public:
    void printInt();
};

void X::printInt(){
        std::cout << "The value of int:" << x << std::endl;
}

int main(void){
    return 0;
}
```
The function will be added in the code segment (.text) even if we didn't create any instance from the class.

