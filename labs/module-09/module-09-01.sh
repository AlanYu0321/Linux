#!/bin/bash


# Add user "controller"
sudo useradd controller

# Display the content of /etc/passwd
cat /etc/passwd | grep -w controller

