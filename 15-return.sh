#!/bin/bash

### exit vs return
### exit will pull out from the script
### return will just take out of the function


sample() {
    echo "i am a messaged called from sample function"
}

# this is called a function.
stat() {
    echo -e "\t Total number of sessions : $(who | wc -l)"
    echo "todays date is $(date +%F)"
    echo "Load average on the system is $(uptime | awk -F : '{print $NF}' | awk -F , '{print $1}')"
    echo -e "\t stat function completed"

    echo "calling sample function"
    sample
}

stat

echo -e "\t\t stat and sample functions are completed"