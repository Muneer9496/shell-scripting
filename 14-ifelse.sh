#!/bin/bash

<<COMMENT
If command is usuallly used in 3 forms :
    1) Simple If
    2) If-else
    3) Ese-If


1) Simple If :
 
    If [ expression ] ; then 

            commands
    fi

    Command is going to be executed only if the expression is true.

* what will happen if the expression fails? simple, commands won't be executed


2) If-else
     
    If [ expression ] ; then

             command 1
        
        else
        
             command 2

    Fi

* what will happen if the expression fails? simple, commands mentioned in Else will be executed


3) Else-If

    If [ expression1 ] ; then

             command 1
        
    elif [ expression2 ] ; then

             command 2

    elif [ expression3 ] ; then

             command 3

    else
             command 4

    Fi

* what will happen if the expression fails? simple, commands mentioned in Else will be executed

COMMENT

echo "demonstrate simple if conditions"

ACTION=$1

if [ "$ACTION" == "start" ] ; then
     echo -e "\e[32m service payment is starting \e[0m"
     exit 0

elif [ "$ACTION" == "stop" ] ; then
     echo -e "\e[35m service payment is stopping \e[0m"
     exit 1

else 
    echo -e "\e[31m service payment status is unknown \e[0m"
    exit 2
fi