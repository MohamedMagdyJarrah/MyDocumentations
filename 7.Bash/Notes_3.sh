#!/usr/bin/env bash

###############################################################################
# Bash Scripting Reference - Common Constructs and String Operations
###############################################################################

# ─────────────────────────────────────────────────────────────────────────────
# 1. Case Statement in Bash
# ─────────────────────────────────────────────────────────────────────────────
# Prompt user input and perform actions based on value
# read -p "Enter a value: " value
# case $value in
#     1)
#         echo "The value is 1"
#         ;;
#     2)
#         echo "The value is 2"
#         ;;
#     *)
#         echo "The value is not 1 or 2"
#         ;;
# esac

# ─────────────────────────────────────────────────────────────────────────────
# 2. Select Statement in Bash
# ─────────────────────────────────────────────────────────────────────────────
# Present a menu selection to the user
# select word in write read close; do
#     echo "$word"
# done
# Note: The select loop runs until explicitly broken with `break`.

# ─────────────────────────────────────────────────────────────────────────────
# 3. String Operations in Bash
# ─────────────────────────────────────────────────────────────────────────────

# ASCII comparison between strings
# x="A"
# y="a"
# if [ "$x" \> "$y" ]; then
#     echo "$x is greater than $y"
# else
#     echo "$y is greater than $x"
# fi

# Alternative (not recommended):
# if [[ $x > $y ]]; then
#     echo "$x is greater than $y"
# else
#     echo "$y is greater than $x"
# fi

# String length
# name="Garrah"
# echo "Length of '$name' is ${#name}"
# echo "$name" | wc -c  # Includes newline

# Substring extraction
# name="Mohamed Garrah"
# echo "${name:0:7}"  # Outputs "Mohamed"

# Splitting a string with a delimiter
# echo "Mohamed,Magdy,Garrah" | cut -d "," -f 2  # Outputs "Magdy"

# String filtering and manipulation
# path="/path/to/foo.cpp"
# echo "${path%.cpp}"      # Removes suffix (.cpp): /path/to/foo
# echo "${path%.cpp}.o"    # Replaces suffix: /path/to/foo.o
# echo "${path%/*}"        # Removes last path component: /path/to

# Remove prefix from string
# echo "${path#/path*}"    # Removes longest match from beginning: /to/foo.cpp
# echo "${path#*/}"        # Removes shortest match: path/to/foo.cpp
# echo "${path##*/}"       # Removes all before last slash: foo.cpp

# Substring replacement
# echo "${path/foo/test}"   # Replaces first 'foo' with 'test'
# echo "${path/to*/test}"   # Replaces from 'to' onward: /path/test

# Case conversion
# str="MohaMed"
# echo "${str,}"   # Lowercase first character: mohaMed
# echo "${str,,}"  # Lowercase all: mohamed

# str="mohaMed"
# echo "${str^}"   # Uppercase first character: MohaMed
# echo "${str^^}"  # Uppercase all: MOHAMED

# ─────────────────────────────────────────────────────────────────────────────
# 4. Functions in Bash
# ─────────────────────────────────────────────────────────────────────────────
# # Defining a function using the `function` keyword
# # Arguments are accessed as $1, $2, etc. (just like in scripts)
# function sayHello() {
#     echo "Hello, $1"
# }
# sayHello "Garrah"

# # Defining a function without the `function` keyword (recommended style)
# sayBye() {
#     echo "Bye, $1"
# }
# sayBye "Garrah"

# # Returning an integer from a function using `return`
# # Note: `return` can only be used to return integers (0–255)
# funRet100() {
#     return 100
# }
# funRet100
# echo "Return code: $?"  # Captures return value with $?

# # Returning a string from a function using `echo` and command substitution
# funRetStr() {
#     echo "You returned your name, which is $1"
# }
# str=$(funRetStr "Garrah")
# echo "$str"

# # Note: You can override built-in commands by defining a function with the same name
# # This is technically possible but NOT recommended
# date() {
#     echo "This overrides the original 'date' command"
# }
# date  # Calls the overridden function instead of the actual `date` command


# ─────────────────────────────────────────────────────────────────────────────
# 5. Local and Global Variables in Bash
# ─────────────────────────────────────────────────────────────────────────────

# # By default, all variables in Bash are global.
# # Reassigning a global variable inside a function affects the global value.
# var="Global Variable"
# fun() {
#     var="Modified Inside Function"
#     echo "Inside function: $var"
# }
# echo "Before function: $var"
# fun
# echo "After function: $var"

# # To avoid modifying global variables, use the `local` keyword
# var2="Global Variable"
# funLocal() {
#     local var2="Local Variable"
#     echo "Inside function (local): $var2"
# }
# echo "Before function: $var2"
# funLocal
# echo "After function: $var2"

# # Declare constants using `readonly`
# readonly x=12
# echo "Readonly x: $x"
# # x=5  # Error: Cannot assign to readonly variable

# y=10
# echo "Initial y: $y"
# readonly y
# # y=12  # Error: Cannot modify readonly variable
# echo "Readonly y: $y"

# # Make a function readonly (cannot be redefined)
# hi() {
#     echo "Hi"
# }
# hi
# readonly -f hi
# # The following redefinition would raise an error:
# # hi() {
# #     echo "Hi again"
# # }

# ─────────────────────────────────────────────────────────────────────────────
# 6. Exporting Variables in Bash
# ─────────────────────────────────────────────────────────────────────────────

# # Use `export` to make variables available to child processes (subshells)
# export hello="Hello Garrah"
# # The variable `hello` is now accessible in scripts or commands executed by this shell

# # Note: When you run a Bash script, it executes in a *subshell* (a child Bash process)
# # and any exported variable will not affect the parent shell environment.
# # To run a script in the current shell (and preserve/export variables), use:
# #   source ./myscript.sh
# #   OR
# #   . ./myscript.sh

# # Unsetting a variable
# var="Temporary Variable"
# echo "Before unset: $var"
# unset var
# echo "After unset: $var"  # Will print nothing


# ─────────────────────────────────────────────────────────────────────────────
# 7. trap command in Bash
# ─────────────────────────────────────────────────────────────────────────────
# # This command use to assign a callback function when a specific event or signal happen
# closeScript() {
#     echo -e "\nThank you for using my script"
#     exit 1
# }
# trap closeScript SIGINT    # This will call the function closeScript when I press CTRL+C or send SIGINT to the process id of the script
# while true ; do
#     echo "Script is running..."
#     sleep 1
# done

# ─────────────────────────────────────────────────────────────────────────────
# 8. Modularity in Bash
# ─────────────────────────────────────────────────────────────────────────────
# We can include another script in our script using source command
# source Notes_1.sh   # we can use anything or function implemented in this script
