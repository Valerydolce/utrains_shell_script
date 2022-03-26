#!/bin/bash

#check users

echo -n "Please enter the username: "
read U

id  ${U}

if
    [ $? -eq 0 ]
then
echo "Username $U exists on this system."
else
echo -n "Username $U doesn't exist. Please enter a username that you would like to create:"        
read new_user
adduser $new_user 
grep $new_user /etc/passwd
    if
       [  $? -eq 0  ]

       then
       echo "$new_user has been created successfully"
    fi
fi
