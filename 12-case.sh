#!/bin/bash

# syntax for CASE

# case
#     opt 1) command1 ;;
#     opt 2) command2 ;;

# esac

ACTION=$1

case $ACTION in
   
      start)
           echo "starting payment service"
           ;;
      stop)
           echo "stopping payment service"
           ;;
      restart)
           echo "restart payment service"
           ;;
esac
