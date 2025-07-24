# Type of References:
- [Lvalue Reference](#lvalue-reference-t)
- [Rvalue Reference](#rvalue-references-t)
- [Const Reference](#const-references-const-t)
- [Ref Qualifiers on Member Functions](#ref-qualifiers-on-member-functions)

# - Lvalue Reference (`T&`)
- Binds to named objects (variables with an address).
- Used to modify the original object.
```cpp
int x = 10;
int& ref = x;  // OK
```

# - Rvalue References (`T&&`)
## ✅ What is it?
An rvalue reference allows you to bind to rvalues (temporary objects) and modify or move them.
```cpp
void process(std::string&& str) {
    std::string local = std::move(str);  // transfer ownership
}
```
## 🔍 Key points:
- Introduced in C++11.
- Enables **move semantics** and **perfect forwarding**.
- Can only bind to **rvalues** (temporaries or `std::move()`d objects).
### Example:
```cpp
void take(std::string&& s) {
    std::cout << s << '\n';
}

take("Hello");          // OK: "Hello" is a temporary (rvalue)
std::string name = "Ali";
// take(name);          // ❌ Error: name is an lvalue
take(std::move(name));  // ✅ OK: we cast it to an rvalue
```
## 🧠 Why use rvalue references?
- (`Move Semantics`) Allows resources to be moved instead of copied, improving performance.
```cpp
class MyVector {
    int* data;
    size_t size;
public:
    MyVector(size_t n) : size(n), data(new int[n]) {}
    
    // Move constructor
    MyVector(MyVector&& other)
        : size(other.size), data(other.data) {
        other.data = nullptr;
        other.size = 0;
    }
};
```
- (`Perfect Forwarding`) Used in template code to forward arguments preserving lvalue/rvalue nature.
```cpp
template <typename T>
void forwarder(T&& arg) {
    func(std::forward<T>(arg));  // preserves original value category
}
```

# - `const` References (`const T&`)
## ✅ What is it?
A const reference means you’re referring to a value without modifying it.
## 🔍 Why use it?
- Avoid copying large objects.
- Ensure the function won’t modify the input.
- Can bind to literals and temporaries (unlike non-const refs).
### Example:
```cpp
void show(const int& x) {
    // x cannot be modified
    std::cout << x << "\n";
}

show(5);        // OK: binds to rvalue
int a = 10;
show(a);        // OK: binds to lvalue
```
## ✅ Use cases:
- Function arguments for read-only access.
- Pass large structs or classes efficiently without copy.
- Bind to **temporaries** or **rvalues**, which normal references can’t.

# - Ref Qualifiers on Member Functions
You can make a member function callable only on lvalues or rvalues:
```cpp
class A {
public:
    void print() & { std::cout << "Lvalue\n"; }
    void print() && { std::cout << "Rvalue\n"; }
};

A a;
a.print();         // Lvalue version
A().print();       // Rvalue version
```