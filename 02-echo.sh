#!/bin/bash

echo line1
echo line2
echo line3

# how print mulitple lines using a single echo command ?
    # To do so we need to use escape sequence characters
#   /n : It tells the system to move the cursor to the next line
#   /t : It moves the cursor to the tab space and prints the next line
#
echo lineX\nlineY

# To use escape sequence characters, enable the escape sequence using an option called "-e"

echo -e "LineX\nlineY"

# "" : double quotes
# '' : single quotes

echo -e "LineA\n\tLineB"