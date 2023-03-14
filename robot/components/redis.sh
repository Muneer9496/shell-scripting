#!/bin/bash


COMPONENT=redis
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
systemctl restart redis  $COMPONENT   &>> $LOGFILE
stat $?






# 2. Update the BindIP from `127.0.0.1` to `0.0.0.0` in config file `/etc/redis.conf` & `/etc/redis/redis.conf`

# ```sql
# # vim /etc/redis.conf
# # vim /etc/redis/redis.conf
# ```

# ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4591fa90-1013-44a3-92e6-bf851cd2e213/Untitled.png)

    

# 3. Start Redis Database