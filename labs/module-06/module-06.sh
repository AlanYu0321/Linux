#!/usr/bin/env bash

# question 1
cd ~/Documents && git clone https://github.com/jhajek/Linux-text-book-part-1.git
# question 2 need some update
cd Linux-text-book-part-1 && ls *.sh
# question 3
ls -l | grep 'Chapter-0[2468]'
# question 4
cp Chapter-02/chapter-02.md ~/ && ls ~
# question 5
touch ~/homework{10..15}.txt ~/account{10..15}.txt
# question 6
ls -l | grep 'homework-0[10..15].txt'
# question 7
mkdir ~/debian{10..12}
# question 8
rm -r ~/debian{10..12}
# question 9
date > ~/today.txt
# question 10
date +%m%d%Y >> ~/today.txt && cat ~/today.txt
# question 11
(date +%m%d%Y && tail -n 10 ./files/Chapter-06/error.log) | tee -a ~/today.txt
# question 12
UT=$(uptime) && echo "The system has been up for: " $UT
# question 13
sudo apt-get update 1>/tmp/01.out 2>/tmp/01.err
sudo apt-get -y install nginx 1>/tmp/02.out 2>/tmp/02.err
sudo systemctl start nginx 1>/tmp/03.out 2>/tmp/03.err
ls /tmp
# question 14
sudo apt-get update &>/tmp/01.log
sudo apt-get -y install nginx &>/tmp/02.log
sudo systemctl start nginx &>/tmp/03.log
# question 15
sudo apt install nginx123 &>/tmp/nginx123.log
# question 16
ls -l /topsecret &>/tmp/out-and-error.txt
# question 17
wc -l files/Chapter-06/hosts.deny
# question 18
sort files/Chapter-06/error.log | uniq -c | awk '$1 > 1'
# question 19
cut -d ' ' -f 2 files/Chapter-06/hosts.deny | sort -n
# question 20
grep 'robots.txt' files/Chapter-06/error.log
# question 21
grep -c 'robots.txt' files/Chapter-06/error.log
# question 22
tail -n 10 files/Chapter-06/hosts.deny | cut -d ' ' -f 1 | sort -n -r
# question 23
grep 'Invalid method in request' files/Chapter-06/error.log
# question 24
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' files/Chapter-06/error.log | sort | uniq | wc -l
# question 25
awk '{print $NF}' files/Chapter-06/error.log | sort | uniq
awk -F'] ' '/\[error\]/ {print $4}' files/Chapter-06/error.log | sort | uniq
# question 27
find ~ -name "*.md"
find ~ -type f -mmin -60
