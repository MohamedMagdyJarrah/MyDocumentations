#!/bin/bash
# The above line called Shebang

# ─────────────────────────────────────────────────────────────────────────────
# Bash Learning Script
# ─────────────────────────────────────────────────────────────────────────────

# ─────────────────────────────────────────────────────────────────────────────
# 1. Printing Logs
# ─────────────────────────────────────────────────────────────────────────────
# echo "Hello Garrah"
# echo        # Prints a blank line (new line)

# ─────────────────────────────────────────────────────────────────────────────
# 2. Declaring and Printing Variables
# ─────────────────────────────────────────────────────────────────────────────
# name="Garrah"                # No spaces allowed around '='
# name1='$name Garrah'         # Single quotes prevent variable expansion
# name2=Garrah                 # No spaces or quotes needed if no spaces in value
# name22="$name Garrah"        # Double quotes allow variable expansion

# echo $name
# echo $name1                  # Outputs: $name Garrah
# echo $name2
# echo $name22                 # Outputs: Garrah Garrah

# echo "Hello again $name"
# echo "Hello again ${name} again"

# ─────────────────────────────────────────────────────────────────────────────
# 3. Saving Output of a Command
# ─────────────────────────────────────────────────────────────────────────────
# cmd=$(date)
# echo $cmd

# ─────────────────────────────────────────────────────────────────────────────
# 4. Conditional Statements (Tests and Logic)
# ─────────────────────────────────────────────────────────────────────────────
# Using test command with && and ||
# test 1 -eq 1 && echo "1 == 1" || echo "1 != 1"
# test 1 -eq 2 && echo "1 == 2" || echo "1 != 2"

# Using square brackets (same as test)
# [ 1 -eq 1 ] && echo "1 == 1" || echo "1 != 1"
# [ 1 -eq 2 ] && echo "1 == 2" || echo "1 != 2"

# String tests
# [ -z "" ] && echo "The string is empty" || echo "The string isn't empty"
# [ -z "Garrah" ] && echo "The string is empty" || echo "The string isn't empty"

# Using if-else statements
# if [ 1 -eq 1 ]; then
#     echo "True Condition"
# else
#     echo "False Condition"
# fi

# Compact if-else
# if [ -z "Garrah" ]; then
#     echo "True Condition"
# else
#     echo "False Condition"
# fi

# Using if-elif-else
# name="Mohamed Garrah"
# if [ "$name" = "Garrah only" ]; then
#     echo "The name is Garrah only"
# elif [ "$name" = "Mohamed Garrah" ]; then
#     echo "The name is Mohamed Garrah"
# else
#     echo "Nothing in name"
# fi

# ─────────────────────────────────────────────────────────────────────────────
# 5. Debugging Bash Scripts
# ─────────────────────────────────────────────────────────────────────────────
# Enable debug mode at the top of the script:
# set -x

# Or run the script with debugging enabled:
# bash -x script.sh

# ─────────────────────────────────────────────────────────────────────────────
# 6. Taking User Input
# ─────────────────────────────────────────────────────────────────────────────

# Normal input
# read -p "Please enter your name: " username

# Silent input (e.g., password)
# read -sp "Please enter your password: " pass; echo  # Add echo for new line after input

# echo "Your username is {$username} and your password is {$pass}"

# Reading an array from user
# read -p "Please enter an array: " -a array
# echo "${array[0]}, ${array[1]}, ${array[2]}"

# ─────────────────────────────────────────────────────────────────────────────
# 7. Multiple Condition Checks
# ─────────────────────────────────────────────────────────────────────────────

# AND conditions
# [ 1 -eq 1 -a 2 -eq 2 ] && echo "Rule#1" || echo "Rule#1 not work"
# [ 1 -eq 1 ] && [ 2 -eq 2 ] && echo "Rule#2" || echo "Rule#2 not work"
# [[ 1 -eq 1 && 2 -eq 2 ]] && echo "Rule#3" || echo "Rule#3 not work"

# OR conditions
# Replace && with || for OR logic
# Example: [ 1 -eq 2 ] || [ 2 -eq 2 ] && echo "One is true"

# ─────────────────────────────────────────────────────────────────────────────
# 8. Loops
# ─────────────────────────────────────────────────────────────────────────────

# ----------------------
# For Loop Examples
# ----------------------

# Iterate over a fixed numeric range
# for i in {1..10}; do
#     echo "$i"
# done

# Equivalent to above using a list
# for i in 1 2 3 4 5 6 7 8 9 10; do
#     echo "$i"
# done

# Using seq to generate the sequence dynamically
# for i in $(seq 1 10); do
#     echo "$i"
# done

# Iterating over output of a command
# lst=$(ls ..)       # List parent directory contents
# for i in $lst; do
#     echo "$i"
# done

# Iterating over words in a string
# string="My name is Mohamed"
# for i in $string; do
#     echo "$i"
# done


# ----------------------
# While Loop Example
# ----------------------
# count=0
# count2=5
# while [ $count -lt 5 ]; do
#     echo "count = $count"
#     echo "count2 = $count2"
#     ((++count))     # Increment count
#     ((--count2))     # Decrement count2
# done


# ----------------------
# Until Loop Example
# ----------------------
# i=0
# until [ $i -gt 10 ]; do
#     echo "$i"
#     ((++i))
# done

# ─────────────────────────────────────────────────────────────────────────────
# 9. Number Expressions (Arithmetic in Bash)
# ─────────────────────────────────────────────────────────────────────────────

num=10
num2=20

# Method 1: Using bc (Basic Calculator) – useful for floating point operations
sum=$(echo "$num + $num2" | bc)
echo "Sum using bc: $sum"

# Method 2: Using expr – older and external command, only for integers
sum=$(expr $num + $num2)
echo "Sum using expr: $sum"

# Method 3: Using Bash arithmetic expansion – preferred for integers
echo "Sum using Bash arithmetic: $((num + num2))"

# Assign result using arithmetic expansion
sum=$((num + num2))
echo "Sum stored in variable: $sum"

# ─────────────────────────────────────────────────────────────────────────────
# Notes:
# - $(...) is a command substitution (runs in a subshell)
# - $((...)) is arithmetic expansion, evaluated directly by Bash
# - Wrapping arithmetic in $((...)) is preferred over expr or bc for integers
# - ((...)) (without $) can also be used for arithmetic in-place (especially in loops)
# - For floating point math (e.g., 3.14 + 2.71), only bc can handle it