source common.sh
print_head "Install Nginx"
yum install nginx -y &>>${log}
status_check
print_head "Removed default content"
rm -rf /usr/share/nginx/html/* &>>${log}
status_check
print_head "Download frontend app content"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log}
status_check
print_head "Change directory to html"
cd /usr/share/nginx/html &>>${log}
status_check

unzip /tmp/frontend.zip &>>${log}

print_head "Coping Reverse proxy file"
cp ${script_location}/files/reverse_proxy.conf /etc/nginx/default.d/roboshop.conf &>>${log}
status_check
print_head "Enable Nginx"
systemctl enable nginx &>>${log}
status_check
print_head "Restart Nginx"
systemctl restart nginx &>>${log}
status_check

