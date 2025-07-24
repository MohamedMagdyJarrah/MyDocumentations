#!/bin/bash

# ────────────────────────────────────────────────────────────────
# 1. Working with Arrays in Bash
# ────────────────────────────────────────────────────────────────

# # Declare arrays
# arr1=("Mohamed" "Magdy" "Ismail" "Garrah")
# declare -a arr2=(1 2 3 4 5)

# # Access individual elements
# echo "${arr1[0]}"  # Output: Mohamed
# echo "${arr1[1]}"  # Output: Magdy
# echo "${arr1[2]}"  # Output: Ismail

# # Print all elements of an array
# echo "${arr2[@]}"

# # Modify an element
# arr1[0]="Mohammed"  # Update first element

# # Append a new element
# arr1+=("AnotherName")

# # Print all elements after modifications
# echo "${arr1[@]}"

# # Get the length of an array
# echo "Length of arr2: ${#arr2[@]}"

# # Remove an element
# unset "arr1[0]"  # Removes the first element

# # Print all elements after removal
# echo "${arr1[@]}"

# # Access a removed element
# # Note: The index still exists but holds no value
# echo "Element at index 0: '${arr1[0]}'"

# # Slice the array
# # Syntax: ${array[@]:start_index:length}
# echo "Slice of arr1:" "${arr1[@]:1:2}"  # From index 1, print 2 elements

# # Loop through an array
# for element in "${arr1[@]}"; do
#     echo "Element: $element"
# done

# ────────────────────────────────────────────────────────────────
# 2. Working with Associative Arrays (Maps) in Bash
# ────────────────────────────────────────────────────────────────

# # Declare an associative array (map)
# declare -A database=(
#     ["name"]="Garrah"
#     ["ID"]="1515"
# )

# # Access and print a value by key
# echo "Name: ${database["name"]}"  # Output: Garrah

# # Add a new key-value pair to the map
# database+=(["City"]="Alexandria")

# # Access and print the newly added value
# echo "City: ${database["City"]}"  # Output: Alexandria

# # Print all keys and values
# echo "All values:" "${database[@]}"      # Values only
# echo "All keys:" "${!database[@]}"       # Keys only

# # Get the number of key-value pairs in the map
# echo "Total entries: ${#database[@]}"  # Output: 3


# ────────────────────────────────────────────────────────────────
# 3. Using `getopts` to Handle Script Options in Bash
# ────────────────────────────────────────────────────────────────

# # `getopts` is used to parse command-line options and arguments in a Bash script.
# # Options that require arguments are followed by a colon `:`.
# while getopts "a:bc:" option; do
#     case $option in
#         a)
#             echo "Option -a was provided with argument: $OPTARG"
#             ;;
#         b)
#             echo "Option -b was triggered (no argument)"
#             ;;
#         c)
#             echo "Option -c was provided with argument: $OPTARG"
#             ;;
#         *)
#             echo "Invalid usage! Please use one or more of the following options: -a, -b, -c"
#             ;;
#     esac
# done

# if [[ $OPTIND -eq 1 ]]; then
#     echo "Usage: $0 -a <arg> -b -c <arg> [non-option args]"
#     exit 1
# fi

# # `$OPTIND` is the index of the next argument to be processed.
# echo "Number of parsed options: $((OPTIND - 1))"

# # Shift positional parameters so that `$1` now refers to the first non-option argument.
# shift $((OPTIND - 1))

# # Print the first argument after all options
# echo "First non-option argument: $1"

# ────────────────────────────────────────────────────────────────
# 4. Working with Files in Bash
# ────────────────────────────────────────────────────────────────

# # ── Method 1: Read entire file content into a variable ──
# value=$(cat test.txt)
# echo "File content using cat:"
# echo "$value"

# # Alternative (more efficient) method to read entire file content
# value=$(<test.txt)
# echo "File content using input redirection:"
# echo "$value"

# # ── Method 2: Read file line by line ──
# echo "Reading file line by line:"
# while read -r line; do
#     echo "$line"
# done < test.txt

# # `line` variable is only valid inside the loop in most modern shells,
# # but you can echo it here if your shell preserves it
# # echo "$line"

# # ── Method 3: Read file word by word into an array ──
# file=$(cat test.txt)
# declare -a arr_name=()
# index=0
# for word in $file; do
#     arr_name[index]=$word
#     ((index++))
# done
# echo "File content split into words and stored in array:"
# echo "${arr_name[@]}"

# # ── File Condition Checks ──
# # -e : file exists
# # -r : file is readable
# # -h : file is a symbolic link
# # -d : file is a directory
# # -w : file is writable
# # -s : file is not empty (size > 0)
# # -f : file is a regular file
# # -x : file is executable

# if [[ -e "test.txt" ]]; then
#     echo "✅ File exists"
# fi

# if [[ -r "test.txt" ]]; then
#     echo "✅ File is readable"
# fi

# # ── Writing to a file ──

# # Overwrite file (truncates existing content)
# echo "Hello from script" > test.txt

# # Append to file (preserves existing content)
# echo "Hello from script again" >> test.txt
