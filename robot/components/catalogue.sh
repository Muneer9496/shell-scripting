#!/bin/bash


# set -e

COMPONENT=catalogue
LOGFILE=/tmp/$COMPONENT.log
APPUSER=roboshop







echo -n "configuring the nodejs repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
stat $?

echo -n "installing nodejs :"
yum install nodejs -y  &>> $LOGFILE
stat $?

id $APPUSER     &>> $LOGFILE
if [ $? -ne 0 ] ; then
    echo -n "creating the application user account :"
    useradd roboshop    &>> $LOGFILE
    stat $?
fi
echo -n "Downloading the $COMPONENT schema :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Extracting the $COMPONENT in the $APPUSER directory :"
cd /home/$APPUSER
rm -rf /home/$APPUSER/$COMPONENT   &>> $LOGFILE
unzip -o /tmp/$COMPONENT.zip   &>> $LOGFILE
stat $?

echo -n "Configuring the permissions :"
mv /home/$APPUSER/$COMPONENT-main /home/$APPUSER/$COMPONENT
chown -R $APPUSER:$APPUSER /home/$APPUSER/$COMPONENT
stat $?

echo -n "installing the $COMPONENT application :"
cd /home/$APPUSER/$COMPONENT/
npm install      &>> $LOGFILE
stat $?

echo -n "updating the systemd file with DB details :"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemd.service
mv /home/$APPUSER/$COMPONENT/systemd.service /etc/systemd/system/$COMPONENT.service
stat $?

echo -n "starting the $COMPONENT service :"
systemctl daemon-reload   &>> $LOGFILE
systemctl enable $COMPONENT &>> $LOGFILE
systemctl start $COMPONENT &>> $LOGFILE
stat $?