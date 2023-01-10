script_location=$(pwd)
log=/tmp/roboshop.log

status_check() {
  if [ $? -eq 0 ]
then
  echo 'success'
  else
    echo 'fail'
    fi
    }