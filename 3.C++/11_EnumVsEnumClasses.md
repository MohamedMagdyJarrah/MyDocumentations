# 🔵 C-style enum (Unscoped Enumerations)
## 🔹 Syntax:
```cpp
enum Color {
    RED,
    GREEN,
    BLUE
};
```
## 🔹 Features:
1. **Global Scope**: Enum names are injected into the enclosing scope.
    ```cpp
    Color c = RED;  // Valid
    ```
2. **Implicit Conversion** to `int`:
    - Enum values are basically integers.
    - You can freely assign or compare enum values with integers.
    ```cpp
    int x = RED; // Valid
    ```
3. **No Type Safety**:
    - Different enums can be mixed accidentally.
    ```cpp
    enum Animal { DOG, CAT };
    Color c = DOG; // No error!
    ```
4. **Forward Declaration** is allowed:
    ```cpp
    enum Color; // OK in some compilers
    ```
5. **Custom Underlying Type** (C++11 and later):
    ```cpp
    enum Color : unsigned int { RED, GREEN, BLUE };
    ```
## 🔹 Use Cases:
- When backward compatibility with C is required.
- When performance is critical and minimal type checks are preferred.
- When you don’t mind polluting the global namespace.
- Simple flags or legacy codebases.


<br><br>

# 🔵 `enum class` (Scoped Enumeration) – Introduced in C++11
## 🔹 Syntax:
```cpp
enum class Color {
    RED,
    GREEN,
    BLUE
};
```
## 🔹 Features:
1. **Scoped Names**:
    - Enum values are scoped to the enum.
    ```cpp
    Color c = Color::RED; // Must use scope
    ```
2. **Strong Type Safety**:
    - Enum values can't be implicitly converted to `int`.
    - Different enums can't be mixed accidentally.
    ```cpp
    int x = Color::RED; // ❌ Error
    ```
3. **No Implicit Comparisons or Assignments**:
    ```cpp
    enum class Animal { DOG, CAT };
    Color c = Animal::DOG; // ❌ Error
    ```
4. **Custom Underlying Type**:
    ```cpp
    enum class Color : uint8_t { RED, GREEN, BLUE };
    ```
5. **More Maintainable and Safer Code**.

## 🔹 Use Cases:
- Modern C++ codebases where type safety is important.
- When avoiding name clashes is necessary (e.g., libraries).
- Cleaner, self-documenting enums.
- When you want to control the underlying type.


# ✅ When to Use Which?
| Situation                                         | Prefer This Enum Type      |
|---------------------------------------------------|----------------------------|
| Writing C-compatible code                         | `enum` (C-style)           |
| Writing safe, modern C++ code                     | `enum class`               |
| Needing scoped and unambiguous names              | `enum class`               |
| You need to do a lot of integer operations        | `enum` (less verbose)      |
| Code readability and maintainability is a priority| `enum class`               |