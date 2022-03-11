#!/bin/bash


sudo rsync --update --ignore-existing -aAXv --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found", "/dev/sda3"} / /mnt/rymac-backup;
