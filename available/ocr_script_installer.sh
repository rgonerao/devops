#!/bin/bash

# created by Cans, 20181218
# ocr script installer

if [ -d "/root/Cans/log" ]; then
	echo "ocr scripts have been deployed"
	exit 1
fi

mkdir -p /root/Cans/log
sed -i '$ a export oops_home=/root/Cans' /etc/profile

source /etc/profile
cd ${oops_home}
wget -q http://9.**.***.2:12580/fileserver/scripts_20181218.tgz
tar -zxf scripts_20181218.tgz

( crontab -l; echo "############################ created by Cans ############################") | crontab
( crontab -l; "* * * * * source /etc/profile; cd ${oops_home}; ./sec_job_schedualer.sh 1>>log/sched.log 2>&1") | crontab
