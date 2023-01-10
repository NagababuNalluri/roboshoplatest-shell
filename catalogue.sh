source common.sh

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
status_check

yum install nodejs -y
status_check

id roboshop
if [ $? -ne 0 ]
then
  useradd roboshop
  fi

mkdir -p /app
status_check

curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
status_check
rm -rf /app/*

cd /app

unzip /tmp/catalogue.zip

cd /app
status_check
npm install
status_check
cp ${script_location}/files/catalogue.service /etc/systemd/system/catalogue.service
status_check
systemctl daemon-reload
status_check
systemctl enable catalogue
status_check
systemctl start catalogue
status_check
cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongodb.repo
status_check
yum install mongodb-org-shell -y
status_check
mongo --host mongodb-dev.devopshemasri.online </app/schema/catalogue.js
status_check