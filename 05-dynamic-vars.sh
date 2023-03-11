#!/bin/bash

TODAYDATE=$(date +%F) # this is way od declaring is called hardway of coding

echo -e "Welcome to bash training, todays date is \e[32m ${TODAYDATE} \e[0m"
echo -e "number of users logged into the system is : \e[32m $(who | wc -l) \e[0m"