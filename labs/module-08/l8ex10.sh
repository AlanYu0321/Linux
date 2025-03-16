#!/bin/bash

# Define potential configuration file paths for Fedora and Ubuntu
UBUNTU_CONF=/etc/mysql/mariadb.conf.d/50-server.cnf

# Use sed to find, comment out, and replace bind-address with 0.0.0.0
sed -i -E 's/^(bind-address\s*=.*)/#\1\nbind-address = 0.0.0.0/' "$UBUNTU_CONF"

# Print success message
echo "Updated bind-address in $CONFIG_FILE to bind to 0.0.0.0"

