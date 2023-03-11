#!/bin/bash

#Color	Foreground Code	Background Code
# Black	      30	              40
# Red	      31	              41
# Green	      32	              42
# Yellow	  33	              43
# Blue	      34	              44
# Magenta	  35	              45
# Cyan	      36	              46
# White	      37	              47

 # the syntax to print color is
 # Ex:
 #      echo -e "\e[COL-CODE  Your mesage to be printed \e[0m"
 #      echo -e "\e[32m i am printing green color \e[0m"

 echo -e "\e[32m i am printing green color \e[0m"
 echo -e "\e[31m i am printing red color \e[0m"
 echo -e "\e[33m i am printing yellow color \e[0m"
 echo -e "\e[34m i am printing blue color \e[0m"
 echo -e "\e[35m i am printing magenta color \e[0m"
 echo -e "\e[36m i am printing cyan color \e[0m"


# How to print the background color

#      echo -e "\e[BackgroundCOL-CODE;ForegroundColorm  Your mesage to be printed \e[0m"
 echo -e "\e[43;32m i am printing green color with YELLOW as background \e[0m"
 echo -e "\e[44;31m i am printing red color with BLUE as background \e[0m"
 echo -e "\e[45;33m i am printing yellow color with MAGENTA as background \e[0m"
 echo -e "\e[46;34m i am printing blue color with CYAN as background \e[0m"
 echo -e "\e[47;35m i am printing magenta color with WHITE as background \e[0m"
 echo -e "\e[42;36m i am printing cyan color with GREEN as background \e[0m"