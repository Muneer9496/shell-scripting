#!/bin/bash

# special characters : $0 to $9, $*, $#, #@, $& 
a=10

echo "value of a is $a"

echo "Name of the script is : $0"   # gives the names of the script you are running

echo first value is $1
echo second value is $20
echo third value is $566

# bash scriptname.sh 100 200 300

echo "supplied variables are : $*"