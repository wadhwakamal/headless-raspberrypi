#!/bin/bash
# You can schedule this script to run regularly every week at 12am on Sunday using: sudo cron -e and then add below line
# 0 0 * * 0 bash /home/user/scripts/backup-all.sh

#re-create a backup directory
rm -rf /backup
mkdir /backup

#create a database's dump
mysqldump --all-databases > /backup/mysql.sql

#copy a package list
dpkg --get-selections > /backup/Package.list
sudo cp -R /etc/apt/sources.list* /backup/
sudo apt-key exportall > /backup/Repo.keys

#compress directories
tar -czf /backup/backup.tar.gz /home /etc /usr/local/etc /backup

#send to the cloud
now=`date +"%Y-%m-%d"`
rclone copyto /backup/backup.tar.gz gdrive-handle:/backup/backup-${now}.tar.gz

#delete old backups
sudo rclone delete gdrive-handle:/backup/ --min-age 7d

#delete the temporary directory
rm -rf /backup
