#!/bin/bash


# set -e

COMPONENT=mongo
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
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "extracting the $COMPONENT schema :"
cd /tmp
unzip -o $COMPONENT.zip    &>> $LOGFILE
stat $?

echo -n "injecting the schema :"
cd /tmp/$COMPONENT-main
mongo < catalogie.js    &>> $LOGFILE
mongo < users.js        &>> $LOGFILE
stat $?





# ```
# # curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"

# # cd /tmp
# # unzip mongodb.zip
# # cd mongodb-main
# # mongo < catalogue.js
# # mongo < users.js
# ```

# Symbol `<` will take the input from a file and give that input to the command.

# - Now proceed with the next component `CATALOGUE`