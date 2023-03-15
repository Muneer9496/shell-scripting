#!/bin/bash


COMPONENT=redis
source components/common.sh  


echo -n "configuring $COMPONENT repo :"
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
stat $?

echo -n "installing $COMPONENT server :"
yum install redis-6.2.11 -y    &>> $LOGFILE
stat $?

echo -n "updating the $COMPONENT visibility :"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
stat $?

echo -n "performing daemon-reload :"
systemctl daemon-reload   &>> $LOGFILE
systemctl enable $COMPONENT   &>> $LOGFILE
systemctl restart $COMPONENT   &>> $LOGFILE
stat $?