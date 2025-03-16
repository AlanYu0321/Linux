#!/bin/bash

sudo apt update && sudo apt upgrade -y

# install -y db, server  and tools
sudo apt install -y vim unzip php php-mysqli php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-gd php-intl mariadb-server mariadb-client apache2
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
sudo systemctl status mariadb.service

sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
# Mysql inline command
sudo mysql -e "CREATE DATABASE wp;"
sudo mysql -e "CREATE user 'wp-user'@'localhost' IDENTIFIED BY 'wp_password';"
sudo mysql -e "GRANT CREATE, SELECT, DELETE, UPDATE, INSERT on wp.* TO 'wp-user'@'localhost';"
sudo mysql "FLUSH PRIVILEGES;"

# Retrieve the WordPress and unzip
wget https://wordpress.org/latest.zip
unzip latest.zip

# Move wordpress directory
sudo mv wordpress /var/www/html/
# Rename
sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
# Replace the place holders on line 23,26 and 29
sudo sed -i '23s/database_name_here/wp/' /var/www/html/wordpress/wp-config.php
sudo sed -i '26s/username_here/wp-user/' /var/www/html/wordpress/wp-config.php
sudo sed -i '29s/password_here/wp_password/' /var/www/html/wordpress/wp-config.php

# install -y firewalld then enable and start the service
sudo apt update
sudo apt install -y firewalld
sudo systemctl enable firewalld
sudo systemctl start firewalld

# Permanently open port 80/tcp for http traffic
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload

# Change ownership
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

