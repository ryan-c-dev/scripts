#!/bin/bash

#can be used with a crontab for timed disk usage updates via email

#make sure to install cronie package with appropriate init system\
#for example on Artix running OpenRC: cronie-openrc vs systemd

#Can also be added to /etc/profile.d/ so script runs on login/startup.

#on line 9, switch mail to proper command depending on msmtp system

filesystems=("/" "/dev/sda2" "/root")

for i in ${filesystems[@]}; do
	usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)
if [ $usage -ge 9 ]; then
	alert="Running out of space on $i, Usage is: $usage%"
	echo "Sending out an alert email about disk space! Greater than or equal to 20% of disk space on / /dev/sda or /home/root"
	echo $alert | mail -s "$i is $usage% full" emailaccount@example.com
fi
done
