#!/bin/bash

# Define log files
LOG_DIR=~/Documents/Linux-text-book-part-1/files/Chapter-08/logs
LOG_FILES="$LOG_DIR/u_ex150721.log $LOG_DIR/u_ex151002.log"

# Find the top 5 IPs causing the most 404 errors
awk '{print $9}' $LOG_FILES | sort | uniq -c | sort -nr | head -5

