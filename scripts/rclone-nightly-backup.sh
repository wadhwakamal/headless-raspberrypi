#!/bin/bash
# RCLONE Backup & Purge Google Drive to Local 
# chmod a+x /home/user/scripts/rclone-nightly-backup.sh
# Type crontab -e and add line below (without #) and with correct path to the script will run a cron job at 3am everyday 
# 0 3 * * * /home/user/scripts/rclone-nightly-backup.sh >/dev/null 2>&1
# if you use custom config path add line bellow in line 20 after --log-file=$LOGFILE 
# --config=/path/rclone.conf (config file location)

if pidof -o %PPID -x "$0"; then
   exit 1
fi

LOGFILE="/home/user/logs/rclone/rclone-upload.log"
FROM="gdrive:/"
TO="/local/path/"

# CHECK FOR FILES IN FROM FOLDER THAT ARE OLDER THAN 2 hours
if find $FROM* -type f -mmin +120 | read
  then
  start=$(date +'%s')
  echo "$(date "+%d.%m.%Y %T") RCLONE BACKUP STARTED" | tee -a $LOGFILE
  # MOVE FILES OLDER THAN 2 hours
  rclone move "$FROM" "$TO" --transfers=20 --checkers=20 --delete-after --min-age 2h --log-file=$LOGFILE
  echo "$(date "+%d.%m.%Y %T") RCLONE BACKUP FINISHED IN $(($(date +'%s') - $start)) SECONDS" | tee -a $LOGFILE
fi
exit
