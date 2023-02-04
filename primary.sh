#!bin/bash/expect

PRIMARY_IP=$1

/opt/homebrew/bin/gsed -i -e "2i Hostname\ ${PRIMARY_IP}" ~/.ssh/config 
/opt/homebrew/bin/gsed -i -e "3d" ~/.ssh/config 

expect -c "
spawn ssh primary
expect \"Are you sure you want to continue connecting (yes/no/)? : \"
send \"yes\n\"
expect \"$\"
exit 0
"
exit