
## Install YouTube Downloader
`wget -O - https://github.com/wadhwakamal/headless-raspberrypi/raw/main/scripts/youtubedl.sh | sudo bash`

<br />

## Install Rclone
`wget -O - https://github.com/wadhwakamal/headless-raspberrypi/raw/main/scripts/install-rclone.sh | sudo bash`

<br />

## RClone Backup & Purge Google Drive to Local 
`wget https://github.com/wadhwakamal/headless-raspberrypi/raw/main/scripts/rclone-nightly-backup.sh`

## Install Open Media Vault
```
sudo apt-get update && sudo apt full-upgrade

# https://github.com/openmediavault-plugin-developers/installscript
wget -O - https://github.com/openmediavault-plugin-developers/installscript/raw/master/install | sudo bash
```

Once the installation is complete the reboot raspberry-pi
`sudo reboot`

Open raspberry-pi `http://hostname.local` (default is `raspberrypi.local` if you haven't changed) in a browser
- Login with `admin` and password `openmediavault`
- Change the password and timezone after login

In Storage
- Go to Disk to wipe your drive
- Go to Filesystem to format it to ext4 and assign a name to it

Users
- Go to Users
- Create a separate User with username and password

SMB
- Go to SMB/CIFS
- In the Shares Tab
  - Add a share
  - Tap the + button on shared folder
  - Give a share name, device name that was mounted in filesystem and path name
  - It will create a path with sharename assigned to it
  - Save changes
- In the Settings tab enable SMB, save changes
- Open finder and connect to the smb://raspberrypi.local/ with username and password created in the Users

