# 🌟 What is OOP?
OOP (**Object-Oriented Programming**) is a way to structure code around objects — which are data + behaviors combined together.<br>
Instead of thinking like:
> "Here’s a list of functions working on data"<br>

You think:
> "Here’s an object — it has its own data and knows how to work on it."<br>

# 🏛️ Core Concepts of OOP in C++
There are **4 pillars** of OOP:
1. Encapsulation
2. Abstraction
3. Inheritance
4. Polymorphism

---

## 1. Encapsulation
Binding data and functions that operate on that data into a single unit.
- Keeps internal details **hidden**.
- Protects data from accidental modification.

In C++, this is mainly about access specifiers:
- `private`: only accessible inside the class.
- `protected`: accessible inside the class and derived classes.
- `public`: accessible from anywhere.

### 🔵 Example:
```cpp
class BankAccount {
private:
    double balance;
public:
    void deposit(double amount) {
        balance += amount;
    }
    double getBalance() const {
        return balance;
    }
};
```
You can't change balance directly, only through methods.

---

## 2. Abstraction
Hiding complex details and showing only essential features.
In C++, **abstract classes** and **interfaces** help with this.

### 🔵 Example:
```cpp
class Shape {
public:
    virtual void draw() = 0; // Pure virtual function → makes this class abstract
};
```
You don't care how `draw()` works inside — you just know shapes can `draw()`.

---

## 3. Inheritance
**Acquiring properties and behaviors from another class.**
Inheritance allows a new class (child) to reuse the code from another class (parent).
In C++, it's like:
```cpp
class Animal {
public:
    void eat() {
        cout << "Eating..." << endl;
    }
};

class Dog : public Animal {
public:
    void bark() {
        cout << "Barking..." << endl;
    }
};
```
`Dog` automatically gets `eat()` from `Animal`.

### Types of inheritance:
- **Single** (one base class)
- **Multiple** (more than one base class)
- **Multilevel** (chain of inheritance)
- **Hierarchical** (one base, many derived)
- **Hybrid** (combination)

---

## 4. Polymorphism
Same interface, different behavior.
There are **two types**:
| Type | Meaning | How |
|:-----|:--------|:----|
| Compile-time (Static) | Decided during compilation | Function overloading, operator overloading |
| Runtime (Dynamic) | Decided during execution | Virtual functions and inheritance |

### 🔵 Example (Runtime Polymorphism):
```cpp
class Animal {
public:
    virtual void speak() {
        cout << "Animal speaks" << endl;
    }
};

class Cat : public Animal {
public:
    void speak() override {
        cout << "Meow" << endl;
    }
};

int main() {
    Animal* a = new Cat();
    a->speak(); // Calls Cat's speak()
}
```
Because `speak()` is **virtual**, the program will correctly call `Cat`'s version at runtime.

---

# 🛠️ Other Important OOP Concepts in C++
## 🔹 Constructors and Destructors
- Special functions to **initialize** and **destroy** objects.
- C++ automatically calls them.
```cpp
class MyClass {
public:
    MyClass() { cout << "Constructor called"; }
    ~MyClass() { cout << "Destructor called"; }
};
```

## 🔹 Operator Overloading
You can redefine operators like `+`, `-`, `==` to work with your classes.
```cpp
Complex operator+(const Complex& c) { /*...*/ }
```

## 🔹 Access Specifiers
Control visibility: `public`, `private`, `protected`.

## 🔹 Friend Functions
Allow **non-member functions** to access private/protected members.
```cpp
friend void someFunction(MyClass&);
```

## 🔹 Abstract Classes
- Classes with **pure virtual** functions.
- Cannot create objects from them.
