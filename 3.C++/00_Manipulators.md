# What is C++ Manipulators?
They are special functions defined in the `<iomanip>` and `<ios>` headers that are used to modify the input/output (I/O) format.

# Usage of C++ Manipulators
They're most commonly used with `std::cout` and `std::cin` to change how data is displayed or read and control the formating in easier way without needing to use flags or complex code.

## Common Output Manipulators
### (from `<iomanip>`)

| Manipulator               | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| `std::setw(n)`            | Sets the width of the next input/output field to `n`        |
| `std::setfill(c)`         | Sets the fill character to `c` (used with `setw`)           |
| `std::setprecision(n)`    | Sets number of digits displayed for floating-point numbers  |
| `std::fixed`              | Uses fixed-point notation for floating-point numbers        |
| `std::scientific`         | Uses scientific notation for floating-point numbers         |
| `std::hex`, `std::dec`, `std::oct` | Sets number base for integers (hexadecimal, decimal, octal) |
| `std::showbase`           | Shows base prefix (`0x` for hex, `0` for oct)               |
| `std::showpoint`          | Always shows decimal point for floats                       |
| `std::boolalpha` / `std::noboolalpha` | Shows `true`/`false` instead of `1`/`0`           |
| `std::left`, `std::right`, `std::internal` | Aligns output within the field              |

### (from `<ios>`)

| Manipulator      | Description                                             |
|------------------|---------------------------------------------------------|
| `std::endl`      | Inserts a newline and flushes the output buffer         |
| `std::flush`     | Flushes the output buffer without newline               |
| `std::ws`        | Skips leading whitespace in input                       |
| `std::ends`      | Inserts a null character (`'\0'`) at end of stream      |

# Example Code:
```cpp
#include <iostream>
#include <iomanip>

int main() {
    double pi = 3.1415926535;

    std::cout << "Default: " << pi << std::endl;
    std::cout << "Fixed: " << std::fixed << std::setprecision(4) << pi << std::endl;
    std::cout << "Scientific: " << std::scientific << std::setprecision(4) << pi << std::endl;

    int num = 255;
    std::cout << "Decimal: " << std::dec << num << std::endl;
    std::cout << "Hex: " << std::hex << std::showbase << num << std::endl;
    std::cout << "Octal: " << std::oct << std::showbase << num << std::endl;

    std::cout << std::setw(10) << std::setfill('*') << std::right << 42 << std::endl;

    return 0;
}
```
### Output will be:
```yaml
Default: 3.14159
Fixed: 3.1416
Scientific: 3.1416e+00
Decimal: 255
Hex: 0xff
Octal: 0377
********42
```

# Best Practice:
### Avoid Global State Side Effects
Manipulators like std::fixed, std::scientific, std::hex, and std::boolalpha modify the internal state of the stream, and that change persists until reset.<br>
✔️ `Best Practice`: Reset the state after you're done, or localize it to avoid confusion.
```cpp
    std::cout << std::hex << 255 << std::dec << std::endl; 
```
### Use `std::setw` with `std::setfill` Carefully
std::setw only affects the next output item, while std::setfill stays active.<br>
✔️ Best Practice: Combine them intentionally:
```cpp
    std::cout << std::setw(6) << std::setfill('0') << 42; // 000042 
```
