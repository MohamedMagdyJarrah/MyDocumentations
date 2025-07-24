# What is `std::flush`?
`std::flush` is an output stream manipulator that forces the output buffer to be written immediately to the output device (like your terminal or file).

# Why do we need it?
By default, C++ output streams like `std::cout` are buffered — they collect characters in memory and only actually write them to the screen:
- when the buffer is full,
- when a newline `(\n)` is inserted,
- or when `std::flush` is explicitly used.
Using `std::flush` gives you manual control over when that buffer is written

# Example:
```cpp
#include <iostream>
#include <chrono>
#include <thread>

int main() {
    std::cout << "Processing..." << std::flush;
    std::this_thread::sleep_for(std::chrono::seconds(2));
    std::cout << "Done!" << std::endl;
    return 0;
}
```
📝 Without `std::flush`, "Processing..." might not show up until after the sleep is over with Done! message.<br>
Writing `std::flush` will display what in the buffer immediately even if the program is still working or sleeping after that.

# When to Use `std::flush`
- Showing progress updates in a loop or animation.
- When writing to a log file and want the message saved instantly.
- In interactive programs where the user should see a prompt immediately:
```cpp
    std::cout << "Enter your name: " << std::flush;
```

# ⚠️ Difference Between `std::endl` and `std::flush`
| Feature         | `std::endl`                          | `std::flush`                     |
|-----------------|---------------------------------------|----------------------------------|
| Flushes buffer  | ✅ Yes                                | ✅ Yes                           |
| Adds newline    | ✅ Yes (`\n`)                         | ❌ No                            |
| Performance     | Slightly slower (newline + flush)    | Faster (just flush)             |

