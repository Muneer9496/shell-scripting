#!/bin/bash


# set -e

COMPONENT=mongodb
source components/common.sh  

echo -n "configuring the $COMPONENT repo :"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "installing the $COMPONENT :"
yum install -y mongodb-org   &>> $LOGFILE
stat $?


echo -n "starting the $COMPONENT :"
systemctl enable mongod   &>> $LOGFILE
systemctl start mongod    &>> $LOGFILE
stat $?

echo -n "updating the $COMPONENT visibility :"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "performing daemon-reload :"
systemctl daemon-reload   &>> $LOGFILE
systemctl restart mongod 
stat $?

echo -n "downloading the $COMPONENT schema :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "extracting the $COMPONENT schema :"
cd /tmp
unzip -o $COMPONENT.zip    &>> $LOGFILE
stat $?

echo -n "injecting the schema :"
cd /tmp/$COMPONENT-main
mongo < catalogue.js    &>> $LOGFILE
mongo < users.js        &>> $LOGFILE
stat $?