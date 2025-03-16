#!/bin/bash


# Add "controller" to the superuser group
sudo usermod -aG sudo controller

# Display groups of user "controller"
groups controller

