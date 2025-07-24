#include <iostream>
#include <ostream>

class MyClass {
    int x;
    public:
    MyClass(int temp) : x(temp) {}
    friend std::ostream& operator<<(std::ostream& os, MyClass& obj);
};

std::ostream& operator<<(std::ostream& os, MyClass& obj)
{
    os << obj.x;
    return os;
}

int main() {
    MyClass obj(5);
    
    std::cout << obj << std::endl;
    return 0;
}