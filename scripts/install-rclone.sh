#!/bin/bash

sudo apt update
sudo apt full-upgrade
sudo apt install unzip
wget https://downloads.rclone.org/rclone-current-linux-arm.zip
unzip -j -d rclone-temp rclone-current-linux-arm.zip
sudo mv ~/rclone-temp/rclone /usr/bin/rclone
sudo mv ~/rclone-temp/rclone.1 /usr/share/man/man1/rclone.1
sudo chown root: /usr/bin/rclone
rm ~/rclone-current-linux-arm.zip
rm -r -f ~/rclone-temp
