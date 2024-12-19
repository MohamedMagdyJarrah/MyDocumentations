## Difference Between `qInfo()`, `qFatal()`, `qWarning()`, `qDebug()`

In Qt, the logging system provides different levels of message handling to help developers track, debug, and diagnose their applications. The various macros such as `qInfo()`, `qFatal()`, `qWarning()`, `qDebug()`, and `qCritical()` (and others) are used to output messages of different severity. Below is an explanation of each of them:

### 1. `qInfo()`
- **Purpose**: Used to log general information messages.
- **Severity Level**: Informational (non-critical).
- **Use Case**: Typically used for logging regular status updates or general information that is not error-related.
- **Behavior**: It outputs messages that are useful for understanding the application flow but do not represent errors or warnings. These messages can be controlled with the application's logging configuration (e.g., filtered out in production).

**Example**:
```cpp
qInfo() << "Application started successfully.";
```

### 2. `qFatal()`
- **Purpose**: Used to log fatal errors that will cause the application to terminate immediately.
- **Severity Level**: Fatal (extremely severe).
- **Use Case**: Used for critical errors that should stop the program immediately, usually when the program cannot continue due to a fatal issue.
- **Behavior**: It logs the message and immediately calls `abort()` to terminate the application. It should be used when the error is so critical that there is no point in continuing execution.

**Example**:
```cpp
qFatal("Fatal error: Could not open the required file.");
```

### 3. `qWarning()`
- **Purpose**: Used to log warning messages that indicate potential issues but do not stop the application.
- **Severity Level**: Warning (medium-severity).
- **Use Case**: Used for non-fatal issues that might affect the program's behavior but allow it to continue running. This could include deprecated features or unexpected but manageable situations.
- **Behavior**: Logs a message to indicate that something potentially bad has happened, but the program is still running.

**Example**:
```cpp
qWarning() << "The configuration file is missing, using defaults.";
```

### 5. `qCritical()`
- **Purpose**: Used to log critical error messages that indicate serious problems but do not immediately terminate the application.
- **Severity Level**: Critical (high-severity).
- **Use Case**: Used when there is an issue that could affect the application's functionality but is not critical enough to immediately abort the process.
- **Behavior**: Logs a message indicating that something has gone wrong in a way that could impact the program's behavior significantly.

**Example**:
```cpp
qCritical() << "Network connection lost!";
```

### Summary of Differences:

| **Macro**    | **Severity Level** | **Purpose**                                               | **Use Case**                                               |
|--------------|--------------------|-----------------------------------------------------------|------------------------------------------------------------|
| `qDebug()`   | Debug              | Logs detailed information for debugging.                  | Developer diagnostics and trace of execution.              |
| `qInfo()`    | Informational      | Logs general information about the application.           | Useful information for understanding the application flow. |
| `qWarning()` | Warning            | Logs warnings that are not critical, but may indicate issues. | Potentially problematic situations, but the program continues running. |
| `qCritical()`| Critical           | Logs serious issues that might affect program functionality. | Severe issues, but the program continues running.           |
| `qFatal()`   | Fatal              | Logs critical errors and terminates the program.          | Unrecoverable errors requiring the immediate termination of the application. |

