# What is the difference between `NULL` and `nullptr`?
## `NULL`
It is a macro traditionally defined as `#define NULL 0` and since `0` is an integer, using `NULL` can lead to ambiguity when overloaded functions exist for both integers and pointers.
### Example of ambiguity:
```cpp
void func(int);
void func(char*);

func(NULL);  // calls func(int), not func(char*) — maybe not what you meant!
```

## `nullptr`
It is a keyword that represent a pointer literal, with type `std::nullptr_t`.<br>
It is unambiguously a **null pointer**, so it’s always treated as a pointer and never as an integer.
### Example of `nullptr`:
```cpp
void func(int);
void func(char*);

func(nullptr);  // calls func(char*) — no ambiguity
```

# Summary
| Feature       | `NULL`         | `nullptr`               |
|---------------|----------------|--------------------------|
| Type          | Integer (`0`)  | `std::nullptr_t` (pointer) |
| Introduced in | C/C++          | C++11                     |
| Ambiguity     | Can be ambiguous in overloads | No ambiguity |
| Preferred in  | Legacy C/C++   | Modern C++                |
