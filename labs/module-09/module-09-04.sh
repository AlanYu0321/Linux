#!/bin/bash


# Add user "nsa"
sudo useradd nsa

# Display the content of /etc/passwd
cat /etc/passwd | grep -w nsa

# Delete user "nsa"
sudo userdel -r nsa

# Display the content of /etc/passwd
cat /etc/passwd | grep -w nsa

