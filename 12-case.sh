#!/bin/bash

# syntax for CASE

# case
#     opt 1) command1 ;;
#     opt 2) command2 ;;

# esac

ACTION=$1

case $ACTION in
   
      start)
           echo -e "\e[32m starting payment service \e[0m"
           ;;
      stop)
           echo -e "\e[35m stopping payment service \e[0m"
           ;;
      restart)
           echo -e "\e[38m restart payment service \e[0m"
           ;;
    *)
           echo -e "valid options are \e[32m start or stop or restart \e[0m"
           ;;
esac
