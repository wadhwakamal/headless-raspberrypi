# Passwordless login to Raspberry pi from Mac

### Generate Public / Private ssh key pair on mac
`ssh-keygen`

Hit enter and leave the options as blank

### Copy the public key to raspberry pi

`ssh-copy-id pi@raspberrypi`

### Verify ssh works with key

`ssh pi@raspberrypi`
