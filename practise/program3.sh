#!/bin/bash


    #Author : Utrains
    #Date : 16-Feb-2022
    
## ---------- Example of the solution Practice/Program 3   -----------------

# -----  Write a script that executes the command "cat /etc/shadow". 
#        If the command returns a 0 exit status report "Command Executed!" and exit with a 0 exit status. If the command returns a non­zero exit status report "Command Not Executed!" and exit with a 1 exit status.    ------------

cat /etc/shadow

STATUS=$? #Variable that contain the status code for preview command

if [ STATUS == 0 ]
then
    echo "Command Executed!"
else
 echo "Command Not Executed!"
fi