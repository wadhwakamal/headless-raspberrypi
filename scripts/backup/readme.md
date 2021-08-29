# Automatic backup of Raspberry PI to any cloud

### What should a Raspberry PI backup consist of?
It all depends on the circumstances, but as a rule, the backup file should contain the following data:

- /etc
- /home
- List of packages
- Databases


### How to transfer the backup to cloud storage
You can copy any file to the cloud using the rclone utility. Installation instructions can be found [here](https://github.com/wadhwakamal/headless-raspberrypi/tree/main/scripts#install-rclone).

The first step is to add a cloud storage connection. After installation, enter:
`sudo rclone config`
and follow the steps of the wizard. We will be using sudo since some of the root privilages will be required to run the script, so, might as well have a separate config for root

Then you can transfer any file to cloud storage using the rclone copyto command.
`rclone copyto /backup/backup.tar.gz gdrive-handle:/backup/backup.tar.gz`

This command will upload the backup.gz file to Google Drive, which has been configured with the name “gdrive-handle”.

### A simple script to backup Raspberry Pi on Google Drive

`sudo bash backup-pi.sh`

#### You can schedule this script to run regularly using cron
`sudo crontab -e`

and add the command to run the script.

`0 0 * * * bash /home/user/scripts/backup-pi.sh`

Now every midnight, your Raspberry Pi will be automatically be backed-up and uploaded to Google Drive.

