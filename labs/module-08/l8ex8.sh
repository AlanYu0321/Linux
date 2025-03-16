#!/bin/bash

# Define log files
LOG_DIR=~/Documents/Linux-text-book-part-1/files/Chapter-08/logs
LOG_FILES="$LOG_DIR/u_ex150721.log $LOG_DIR/u_ex151002.log"

# Find the IP causing the most 404 errors
awk '$11 == 404 {print $9}' $LOG_FILES | sort | uniq -c | sort -nr | head -1

