#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

echo #### Setting Hostname ####
echo "Enter New Host Name [dropbox name OR company name]"
read -p 'Hostname: ' newhostname
sudo hostnamectl set-hostname $hostname
echo "Hostname set to $hostname"

## OLD WAY
#echo $newhostname > /etc/hostname
#hostname -b $newhostname
#sed -I "s/127.0.1.1.*/127.0.1.1\t$newhostname/g" /etc/hosts


### Reboot Prompt
read -p "Do you want to reboot? y/n: " prompt
if [[ "$prompt" =~ ^([yY][eE][sS]|[yY])$  ]]
  then
    sudo reboot
  else
    echo "Reboot Skipped. It is recommended to reboot!"
fi