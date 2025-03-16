#!/bin/bash


# Add group "itmo556"
sudo groupadd itmo556

# Append "controller" to group "itmo556"
sudo usermod -aG itmo556 controller

# Display groups of user "controller"
groups controller

