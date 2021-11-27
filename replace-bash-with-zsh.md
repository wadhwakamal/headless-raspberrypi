# Replace bash with zsh

## Prerequisite
Install git


## First install zsh
```
sudo apt-get install zsh
```

### Set zsh as default shell
```
chsh -s /bin/zsh
```

### Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Exit and reconnect to raspberry pi

### Install zsh-autosuggestions plugin for raspberry pi
```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### Install zsh-syntax-highlighting plugin
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install [z script](https://github.com/rupa/z)
```
mkdir ~/Shell
```
```
wget 'https://raw.githubusercontent.com/rupa/z/master/z.sh' -O ~/Shell/z.sh
```

### replace content of ~/.zshrc file with personal config
```
mv ~/.zshrc ~/.zshrc_backup
```
```
wget 'https://raw.githubusercontent.com/wadhwakamal/zshrc/main/.zshrc' -O ~/.zshrc
```
```
nano ~/.zshrc
```
Update the file for raspberry-pi and remove the things which are not required.

Add `zsh-syntax-highlighting` inside plugins in ~/.zshrc if not already present!
