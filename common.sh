script_location=$(pwd)
log=/tmp/roboshop.log

print_head() {
  echo -e '\e[1m; $1 \e[0m'
}


status_check() {
  if [ $? -eq 0 ]
then
  echo -e '\e[31m success \e[0m'
  else
    echo -e '\e[33m fail \e[0m'
    fi
    }
