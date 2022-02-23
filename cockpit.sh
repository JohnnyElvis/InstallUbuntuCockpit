#!/bin/bash

#Install Cokpit
sudo apt update && sudo apt install cockpit -y

#Make Firewall in Network plugin work
sudo apt-get remove ufw -y 
sudo apt get update && sudo apt-get install firewalld -y
sudo firewall-cmd --add-service=ssh --permanent && sudo systemctl enable firewalld && sudo systemctl start firewalld
