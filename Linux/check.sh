#!/bin/bash

mkdir /opt/security
cd /opt/security/
mkdir check_log
curl -L -O https://github.com/xiaoyunjie/Shell_Script/archive/refs/tags/v0.1.zip
unzip v0.1.zip 
rm -rf v0.1.zip
cd Shell_Script-0.1/Check_script/bash/
chmod +x CentOS_Check_Script.sh
log_file="/opt/security/check_log/check_$(date '+%Y%m%d_%H%M%S').txt"
./CentOS_Check_Script.sh | tee "$log_file"
sshpass '313233' scp -P 10000 "$log_file" xhy@free.idcfengye.com:'/cygdrive/e/Tools/Documents/jiujiang/Logs/'
