#!/bin/bash

echo $0   # prints script name
echo $1   # takes the first value from the command line
echo $2   # takes the second value from the command line

echo $*   # $* is going to print the used variables
echo $@   # $@ is going to print the used variables
echo $$   # $$ is going to print the PID of the current process
echo $#   # $# is going to print the number of arguments

# $* or $@ both of them prints used variables in the script
