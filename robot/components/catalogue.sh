#!/bin/bash


# set -e

COMPONENT=catalogue
LOGFILE=/tmp/$COMPONENT.log
APPUSER=roboshop

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



echo -n "configuring the nodejs repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
stat $?

echo -n "installing nodejs :"
yum install nodejs -y  &>> $LOGFILE
stat $?

echo -n "creating the application user account :"
useradd $APPUSER    &>> $LOGFILE
stat $?

echo -n "Downloading the $COMPONENT schema :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Extracting the $COMPONENT in the $APPUSER directory :"
cd /tmp/$APPUSER
unzip -o /tmp/$COMPONENT.zip   &>> $LOGFILE

# # yum install nodejs -y

# ```

# 1. Let's now set up the catalogue application.

# As part of operating system standards, we run all the applications and databases as a normal user but not with root user.

# So to run the catalogue service we choose to run as a normal user and that user name should be more relevant to the project. Hence we will use `roboshop` as the username to run the service.

# ```bash
# # useradd roboshop

# ```

# 1. So let's switch to the `roboshop` user and run the following commands.

# ```bash
# $ curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
# $ cd /home/roboshop
# $ unzip /tmp/catalogue.zip
# $ mv catalogue-main catalogue
# $ cd /home/roboshop/catalogue
# $ npm install

# ```

# 1. Update SystemD file with correct IP addresses
    
#     Update `MONGO_DNSNAME` with MongoDB Server IP
    
#     ```sql
#     $ vim systemd.servce
#     ```
    
# 2. Now, lets set up the service with systemctl.

# ```bash
# # mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# # systemctl daemon-reload
# # systemctl start catalogue
# # systemctl enable catalogue
# # systemctl status catalogue -l

# **NOTE:** You should see the log saying `connected to MongoDB`, then only your catalogue
# will work and can fetch the items from MongoDB

# **Ref Log:**
# {"level":"info","time":1656660782066,"pid":12217,"hostname":"ip-172-31-13-123.ec2.internal","msg":**"MongoDB connected",**"v":1}
# ```

# 1. Now, you would still see **`CATEGORIES`** on the frontend page as empty. 
# 2. That’s because your `frontend` doesn't know who the `CATALOGUE` is when someone clicks the `CATEGORIES` option. So, we need to update the Nginx Reverse Proxy on the frontend. If not, you’d still see the frontend without categories.

# ![empty-catalogue.JPG](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/af5a2425-8a4a-4001-8404-8f05c5f79f90/empty-catalogue.jpg)

# 1. In order to make it work, update the proxy file in Nginx with the `CATALOGUE` server IP Address in the **`FRONTEND`** Server  

# **`Note:`** Do not do a copy and paster of IP in the proxy file, there are high chances to enter the empty space characters, which are not visible on the vim editor. Manual Typing of IP Address/ DNS Name is preferred. 

# > # vim /etc/nginx/default.d/roboshop.conf
# > 

# 1. Reload and restart the Nginx service.

# > # systemctl restart nginx
# >