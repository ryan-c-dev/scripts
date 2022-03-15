#!/bin/bash

#commented out below for safety, does full system backup so use carefully and make sure proper device is chosen from lsblk command.


echo 'Currently commented out for safety, please check file for directions';
notify-send 'Currently commented out for safety, please check file for directions';

#sudo rsync --update --ignore-existing -aAXv --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found", "/dev/sda3"} / /mnt/rymac-backup;
