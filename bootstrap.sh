#!/usr/bin/env bash

echo "Provision VM START"
echo "=========================================="

sudo yum install git fontconfig bzip2 libpng-devel ruby ruby-devel
# Some of the Node.js modules that we'll be installing will require Sass, a CSS extension language. # Install it using gem, Ruby's package manager.
sudo gem install sass
# Install MongoDB 3.4
touch /etc/yum.repos.d/mongodb-org-3.4.repo
cat > /etc/yum.repos.d/mongodb-org-3.4.repo <<EOF
[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
EOF
sudo yum install -y mongodb-org
sudo service mongod start
sudo chkconfig mongod on
sudo systemctl status mongod
# Install Node.js
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
sudo yum install nodejs
npm version
# Install Bower and Gulp
sudo npm install -g bower
sudo npm install -g gulp
# Install Grunt
sudo npm install -g grunt-cli
sudo npm install -g express
# Installing the MEAN Boilerplate
git clone https://github.com/meanjs/mean.git meanjs
cd ~/meanjs
npm install
npm start
echo ""
echo "=========================================="
echo "Node setup:"
node -v
echo "Access your MEAN Application under http://179.16.0.60:3000"
echo "Provision VM finished"




