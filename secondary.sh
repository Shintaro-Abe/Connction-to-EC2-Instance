#!bin/bash/expect

SECONDARY_IP=$1

/opt/homebrew/bin/gsed -i -e "8i Hostname\ ${SECONDARY_IP}" ~/.ssh/config 
/opt/homebrew/bin/gsed -i -e "9d" ~/.ssh/config 

expect -c "
spawn ssh secondary
expect \"Are you sure you want to continue connecting (yes/no/)? : \"
send \"yes\n\"
expect \"$\"
exit 0
"
exit

