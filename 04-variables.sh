#!/bin/bash

# what is a variable?? A variable is something which holds some value dynamically

a=10
b=20
c=30

# No data types are available in bash by default
# everything is considered as STRING

# How do you print a variable?
# we use special charcter called "$" to print
# echo $a

echo $a
echo ${b}
echo "$c"

echo "iam printing the value of d $d"

# when you try print a variable which is not declared, bash is going to consider as Null or Empty

rm -rf /data/${DATA_DIR}    

# how do you supply the variables form the command line
# export VarName = value