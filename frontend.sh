source common.sh
yum install nginx -y &>>${log}
status_check

rm -rf /usr/share/nginx/html/* &>>${log}
status_check

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log}
status_check

cd /usr/share/nginx/html &>>${log}
status_check

unzip /tmp/frontend.zip &>>${log}

cp ${script_location}/files/reverse_proxy.conf /etc/nginx/default.d/roboshop.conf &>>${log}
status_check

systemctl enable nginx &>>${log}
status_check

systemctl restart nginx &>>${log}
status_check

