#!/bin/bash

# there are 4 types of commands available :

# 1) binary             (/bin,  /sbin)
# 2) aliases            (aliases are shortcuts alias net= "netstat -tulpn")
# 3) shell built-in commands  
# 4) functions           # functions are nothing but a set of command that can be written in a sequenc and called n number of times


# declaring is a function

sample() {
    echo "i am a messaged called from sample function"
}

# this is called a function.
stat() {
    echo "total number of sessions : $(who | wc -l)"
    echo "todays date is $(date +%F)"
    echo "Load average on the system is $(uptime | awk -F : '{print $NF}' | awk -F , '{print $1}')"
    echo "stat function completed"
}

echo "calling stat fucntion"
stat 