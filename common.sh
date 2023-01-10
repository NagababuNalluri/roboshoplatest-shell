script_location=$(pwd)
log=/tmp/roboshop.log

status_check() {
  if [ $? -eq 0 ]
then
  echo '\e[31m success \e[0m'
  else
    echo '\e[33m fail \e[0m'
    fi
    }