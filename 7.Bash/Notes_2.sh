#!/bin/bash

# ─────────────────────────────────────────────────────────────────────────────
# 1. Arguments in Bash
# ─────────────────────────────────────────────────────────────────────────────

# $0  → The name of the script
# $1, $2, ...  → Positional arguments passed to the script
# $$ → Process ID of the current script
# $? → Exit status of the last executed command
# $# → Number of arguments passed
# $* → All arguments as a single string
# "$@" → All arguments as an array (quoted individually)

# echo "Script name       = $0"
# echo "First Argument    = $1"
# echo "Process ID        = $$"
# echo "Number of Args    = $#"
# echo "All Arguments     = $*"
# echo "Arguments as list = " "$@"
# echo "Last Command Exit = $?"

# ─────────────────────────────────────────────────────────────────────────────
# 2. The `shift` Command (Used with Positional Parameters)
# ─────────────────────────────────────────────────────────────────────────────

# Used to process command-line arguments one by one

# Example:
# ./myscript.sh arg1 arg2 arg3

# echo "Original arguments: " "$@"

# while [ $# -gt 0 ]; do
#     echo "Processing: $1"
#     shift  # Discard the first argument and move to the next
# done

# Output:
# Original arguments: arg1 arg2 arg3
# Processing: arg1
# Processing: arg2
# Processing: arg3

# Notes:
# - `$#` is the number of remaining arguments
# - `$1` is always the current argument being processed
# - `shift` discards the first argument and shifts others left
# - Keep shifting until all arguments are processed

# ─────────────────────────────────────────────────────────────────────────────
# 3. The `rofi` Command
# ─────────────────────────────────────────────────────────────────────────────

# `rofi` is a lightweight GUI tool for creating menus and dialogs
# Can be used to take user input via GUI

# Example: Select a color from a list
# selected_color=$(echo -e "Red\nGreen\nBlue" | rofi -dmenu -normal-window -p "Select a color")
# echo "$selected_color is the selected color from the user"

# ─────────────────────────────────────────────────────────────────────────────
# 4. File Explorer Commands (`explorer.exe` and `nautilus`)
# ─────────────────────────────────────────────────────────────────────────────

# To open directories in a GUI file explorer:

# For Linux:
# nautilus "$HOME/MyDocumentations"

# For Windows (under WSL):
# - Use `wslpath` to convert WSL paths to Windows paths
# explorer.exe "$(wslpath -w "$HOME/MyDocumentations")"
# explorer.exe "$(wslpath -w "/mnt/c/Users/mohamed.algarrah/Downloads")"

# ─────────────────────────────────────────────────────────────────────────────
# 5. Notifications in WSL using `wsl-notify-send`
# ─────────────────────────────────────────────────────────────────────────────

# Since `notify-send` doesn’t work natively in WSL, use `wsl-notify-send`

# Install steps:
# sudo apt install golang-go
# git clone https://github.com/stuartleeks/wsl-notify-send.git
# cd wsl-notify-send
# GOOS=windows GOARCH=amd64 go build -o wsl-notify-send.exe
# mv wsl-notify-send.exe /mnt/c/Users/mohamed.algarrah/Downloads/

# Example usage:
# /mnt/c/Users/mohamed.algarrah/Downloads/wsl-notify-send.exe \
#     --appId "Garrah Test" "Helloooooooooo"

# Tip: Create a Bash function to simplify calling this executable

# ─────────────────────────────────────────────────────────────────────────────
# 6. The `yt-dlp` Command
# ─────────────────────────────────────────────────────────────────────────────

# `yt-dlp` is a command-line video downloader (a fork of youtube-dl)
# Useful for downloading individual videos or entire playlists

# Basic usage examples:
# yt-dlp <video_url>
# yt-dlp -o "%(title)s.%(ext)s" <video_url>  # Customize filename
# yt-dlp --extract-audio --audio-format mp3 <video_url>  # Download audio only

# More help:
# yt-dlp --help
# tldr yt-dlp