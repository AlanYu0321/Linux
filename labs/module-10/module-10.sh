#!/bin/bash

# Open the GRUB configuration file Uncomment GRUB_DISABLE_RECOVERY="true"
sudo vim /etc/default/grub

# Update the GRUB configuration
sudo update-grub

# Display your default target environment
systemctl get-default

# Install the openssh-server
sudo apt update
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh

# Install the Nginx web server
sudo apt install nginx
# What is the location on the filesystem of the .service file?
# /lib/systemd/system/nginx.service

# Breifly explain the recommended purpose of /etc/systemd/system and /lib/systemd/system
# /etc/systemd/system: For user-customized service configurations.
# /lib/systemd/system: For distribution-provided service configurations.

# Type the systemctl command to stop the Nginx service
sudo systemctl stop nginx

# Type the systemctl command needed to process changes to configuration files before restarting a service
sudo systemctl daemon-reload

# Type the systemctl command that will retrieve and display the ExecStart property from the Nginx.service file (not grep)
systemctl show nginx.service --property=ExecStart

# Type the systemctl command that will retrieve and display the WantedBy property from the Nginx.service file (not grep)
systemctl show nginx.service --property=WantedBy


# Using the man command explain what timedatectl does?
man timedatectl
# Using the man command explain what journalctl does?
man journalctl
# Using the man command explain what resolvectl does?
man resolvectl
# Using the man command explain what networkctl does?
man networkctl
# Using the man command explain what hostnamectl does?
man hostnamectl

# Install the package for systemd-oomd
sudo apt install systemd-oomd

# Using the man command explain what oomctl does?
man oomctl

# Change timezone
timedatectl status
sudo timedatectl set-timezone UTC
timedatectl status

# hostnamectl
sudo hostnamectl set-hostname itmo-556-xyz
sudo hostnamectl set-location d1r1u22
sudo hostnamectl set-chassis vm
sudo hostnamectl set-deployment development
hostnamectl

# The tool described in the Filesystems /proc section
cat /proc/cpuinfo

#run write-journal.service

# Issue the commands to enable and start this service write-journal.service write-journal.timer
sudo cp ~/Documents/Linux-text-book-part-1/files/Chapter-10/service-files/write-journal.service /etc/systemd/system/
ls /etc/systemd/system/ | grep -w write

sudo systemctl enable write-journal.service
sudo systemctl start write-journal.service


# Ubuntu  22.04 - https://pypi.org/project/cysystemd/
sudo apt-get install build-essential \
    libsystemd-dev \
    python3-pip \
    python3-dev
sudo python3 -m pip install cysystemd

# sudo cp write-journal.py /usr/local/bin/

# View logs for write-journal.service
journalctl -u write-journal.service

# Display active timers
systemctl list-timers

