#!/bin/bash

# Check users

echo "Please enter the username"
read U

id ${U} > /dev/null 2>&1  #/dev/null 2>&1 is called the black holle

if
    [ $? -eq 0 ]

    then
    echo "User $U exists on this system"
    else
    echo "User $U does not exist"
    
    
    fi