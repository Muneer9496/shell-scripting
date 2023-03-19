#!/bin/bash


# set -e

COMPONENT=frontend
LOGFILE=/tmp/$COMPONENT.log

# validating whether the executed user is a root user or not
ID=$(id -u) 

if [ "$ID" -ne 0 ] ; then
    echo -e "\e[31m you should execute this step as root user or with a sudo as prefix \e[0m"
    exit 1
fi

stat () {
    if [ $1 -eq 0 ] ; then
        echo -e "\e[32m Success \e[0m"
    else 
        echo -e "\e[31m Failure \e[0m"
        exit 2
    fi
}

echo -n "installing nginx : "
yum install nginx -y &>> $LOGFILE
stat $?

echo -n "downloading the $COMPONENT components :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "performing a cleanup of old $COMPONENT :"
cd /usr/share/nginx/html
rm -rf * &>> $LOGFILE
stat $?

echo -n "copying the downloaded $COMPONENT content :"
unzip /tmp/$COMPONENT.zip &>> /$LOGFILE
mv $COMPONENT-main/* .
mv static/* .
rm -rf $COMPONENT-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

for component in catalogue user cart shipping payment; downloaded
    echo -n "updating the proxy details in the reverse proxy file :"
    sed -i "/$component/s/localhost/$component.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
done


echo -n "starting the service :"
systemctl enable nginx &>> $LOGFILE
systemctl start nginx &>> $LOGFILE
stat $?