#!/bin/bash

# each and every action will have an EXIT codes in linux, ehich helps us in determining the status of task
# Exit code is from 0 to 255

# 0       : successfull
# 1 - 255 : partial failure or complete failure or partial success



# while 0 is success; rest of them maybe 1) partial failure 2) complete failure 2) partial success

# how to fetch the exit status of previous executed command
# --> $? : this is going to print the exit code of the previous executed command only.
# exit code plays an important role in debugging some scripts which are lengthy. follow the 12th example for better insights