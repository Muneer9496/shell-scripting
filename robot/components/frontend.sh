#!/bin/bash


set -e

yum install nginx -y

curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf


systemctl enable nginx
systemctl start nginx





1) few of steps are failed, but still my sccript is executed irrespective of failure
2) installation failed, why? i have not validated that i have root privileges
3) the info that id like to provide is success or failure




