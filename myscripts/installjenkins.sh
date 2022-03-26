#!/bin/bash

# Author: Paul Valery Simo
# Date: 3/5/2022
# ----------- Installing Jenkins on CentOS 7 Server ------------

# Step 1 - Installing Prerequisite - Java

echo -e "\nWe're about to install Java, a prerequisite for Jenkins...\n"
sleep 3
sudo yum install java-1.8.0-openjdk-devel -y
if [ $? -ne 0 ]
 then 
 echo -e "\nJava Installation has failed, please troubleshoot...\n"
 exit 1
 else 
 echo -e "\nJava Installation has been completed, proceeding to the next step...\n"
fi

# Step 2 - Enable Jenkins Repository.
PACKAGE=wget
rpm -F $PACKAGE > /dev/null 2>&1 ## /dev/null 2>&1 will prevent the command to print on output
if [ "$?" = "1" ]
 then
 yum install wget -y
 else
 echo -e "\n$PACKAGE is installed.\n"
fi

echo -e "\nEnabling Jenkins reposirory..."
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 
sleep 5
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
echo -e "\nJenkins reposirory has been enabled...\n"

#Step 3 - Installing the lastest stable Jenkins' version
echo -e "\nPlease wait while JENKINS is being installed...\n"
sudo yum install jenkins -y
sudo systemctl start jenkins
echo -e "\nJENKINS HAS BEEN INSTALLED SUCCESSFULLY...\n"
sleep 5

# Step 4 - Enable and Check jenkins'status
echo -e "\nLet's start and enable Jenkins ...\n"
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
sleep 3
echo -e "\nJenkins has been enabled...\n"
sleep 3

# Step 5 - Adjust Firewall - Open port 8080
echo -e "\nOpening Port 8080\n"
systemctl start firewalld
systemctl enable firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
sudo firewall-cmd --reload
sleep 3

# Step 5 - Generating URL for end user
echo -e "Please use the link below to connect to Jenkins' landing page...."
echo -e "\n http://`hostname -I`:8080\n"


