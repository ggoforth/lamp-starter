#!/bin/bash

# simple vagrant provisioning script
# installs : apache2, php 5.5 and mysql-server and client, node js, and gulp

# some coloring in outputs.
COLOR="\033[;35m"
COLOR_RST="\033[0m"

echo -e "${COLOR}---updating system---${COLOR_RST}"
apt-get update

echo -e "${COLOR}---installing some tools: zip,unzip,curl, python-software-properties---${COLOR_RST}"

apt-get install -y software-properties-common
apt-get install -y python-software-properties
apt-get install -y zip unzip curl build-essential vim git tmux python g++ make

# node js
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v1.29.0/install.sh | bash
source ~/.bashrc
echo "5.0.0" >> ~/.nvmrc
nvm install
npm install -g gulp

# installing mysql
# pre-loading a default password --> yourpassword
echo -e "${COLOR}---installing MySql---${COLOR_RST}"
apt-get install -y mysql-server mysql-client

# installing apache2
echo -e "${COLOR}---installing Apache---${COLOR_RST}"
apt-get install -y apache2

# installing php 5.3
echo -e "${COLOR}---installing php 5.3---${COLOR_RST}"
apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-curl php5-mysql php5-xdebug

#enable mod rewrite for apache2
echo -e "${COLOR}---enabling rewrite module---${COLOR_RST}"
a2enmod rewrite

# restart apache2
echo -e "${COLOR}---restarting apache2---${COLOR_RST}"
service apache2 restart