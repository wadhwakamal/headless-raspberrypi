# Setting up a headless Raspberry Pi

![headless Raspberry Pi](https://github.com/wadhwakamal/headless-raspberrypi/raw/main/assets/repo-img.png?raw=true)

## Table of Contents  
* [Initial Setup](#setting-up-a-headless-raspberry-pi)  
* [Remove Bloatware on the Raspberry Pi](#remove-bloatware-on-the-raspberry-pi)  
* [Update packages to the latest version](https://github.com/wadhwakamal/headless-raspberrypi#update-packages-to-the-latest-version)  
* [Install git](https://github.com/wadhwakamal/headless-raspberrypi#install-git)  
* [Install Python 3](https://github.com/wadhwakamal/headless-raspberrypi#install-python-3)  
* [Install Node.js and NPM using NVM](https://github.com/wadhwakamal/headless-raspberrypi#install-nodejs-and-npm-using-nvm)  
* [Install Scripts](https://github.com/wadhwakamal/headless-raspberrypi/tree/main/scripts#scripts)  
	* [YouTube Downloader](https://github.com/wadhwakamal/headless-raspberrypi/blob/main/scripts#install-youtube-downloader)
	* [Install RClone](https://github.com/wadhwakamal/headless-raspberrypi/blob/main/scripts#install-rclone)
	* [RClone Backup & Purge Google Drive to Local](https://github.com/wadhwakamal/headless-raspberrypi/blob/main/scripts#rclone-backup--purge-google-drive-to-local)
	* [Install Open Media Vault](https://github.com/wadhwakamal/headless-raspberrypi/blob/main/scripts#install-open-media-vault)
	* [Backup Pi to Google Drive](https://github.com/wadhwakamal/headless-raspberrypi/tree/main/scripts/backup#automatic-backup-of-raspberry-pi-to-any-cloud)

### Initial Setup

1. Use Raspberry Pi Imager to burn the image to an SD card. You probably want the “Raspberry Pi OS Lite” image.
2. On the image (which will be in /Volumes/boot on macOS):
	1. touch ssh to allow SSH access.
	2. create wpa_supplicant.conf:


```
country=IN
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="Wifi-SSID"
    psk="Password"
}
```

3. Boot the thing.
4. ssh pi@raspberrypi.local; the default password is raspberry
5. sudo raspi-config, change the hostname and pi user password,  in system settings and then,
	1. Select “Localisation Options”
	2. Change Locale as appropriate
	3. Select “Change Timezone” and set your timezone
	4. Advanced options
	5. Select first option - A1 Expand File System
	6. then reboot.

<br/>

## Remove Bloatware on the Raspberry Pi
```
# https://github.com/JoaquimLey/raspberrypi-headless-setup
sudo curl -fsSL https://raw.githubusercontent.com/JoaquimLey/raspberrypi-headless-setup/master/pi_bloat_remove.sh | sudo bash
```

<br/>

## Update packages to the latest version
`sudo apt-get update && sudo apt full-upgrade`

<br/>

## Install git
`sudo apt-get install git`

<br/>

## Install Python 3
```
sudo apt update
sudo apt install python3 idle3
```
<br/>

## Install Node.js and NPM using NVM

NVM (Node Version Manager) is a bash script that allows you to install and manage multiple Node.js versions. Use this method if you need to install a specific Node.js version or if you need to have more than one Node.js versions installed on your Raspberry Pi.

```
# Use the latest from here --> https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38/install.sh | bash
```

The installation script will clone the nvm repository from Github to the ~/.nvm directory and also attempts to add the nvm path to your Bash profile.

```
# No need to add this just verify if it was already added to your bash or not, otherwise add it
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

Terminate your shell for bash to refresh

```
nvm --version
nvm install node
node --version
```


Install node development tools 

```
sudo apt install build-essential
```

<br/>

##### Attribution
<a href='https://www.freepik.com/vectors/abstract'>Abstract vector created by macrovector - www.freepik.com</a>
