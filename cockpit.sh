#!/bin/bash

#Install Cokpit
sudo apt update && sudo apt install cockpit -y && sudo systemctl start cockpit

#Make Firewall in Network plugin work
sudo apt-get remove ufw -y 
sudo apt-get update && sudo apt-get install firewalld -y
sudo firewall-cmd --add-service=ssh --permanent && sudo firewall-cmd --add-service=cockpit --permanent && sudo systemctl enable firewalld && sudo systemctl start firewalld

#Fix Interfaces https://gist.github.com/Xantios/cb26cfd4f1cd3c8f5bb720ec0e553728
sudo systemctl enable network-manager.service
sudo systemctl start network-manager.service

sudo sed -i '3 i \ \ renderer: NetworkManager' /etc/netplan/00-installer-config.yaml


#Fix LVM not being displayed
sudo apt-get update && sudo apt-get install udisks2-lvm2 -y

