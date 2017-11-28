#!/usr/bin/env bash

echo "Provision VM START"
echo "=========================================="

sudo yum install -y git fontconfig bzip2 libpng-devel ruby ruby-devel

# Setting Firewall Ports 3000, 4200, 5000, 1337, 27017 for Development and Reload Firewall
echo "Setting Firewall - Opening Ports"
echo "3000, 4200, 5000, 1337, 27017 for Development"
echo "============================================="
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

# Some of the Node.js modules that we'll be installing will require Sass, a CSS extension language. # Install it using gem, Ruby's package manager.
echo "Install Sass"
echo "=========================================="
sudo gem install sass

# Install MongoDB 3.4
echo "Install MongoDB 3.4"
echo "=========================================="
sudo touch /etc/yum.repos.d/mongodb-org-3.4.repo
sudo chmod 766 /etc/yum.repos.d/mongodb-org-3.4.repo

cat > /etc/yum.repos.d/mongodb-org-3.4.repo <<EOF

[mongodb-org-3.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/3.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
EOF

sudo yum install -y mongodb-org
sudo service mongod start
sudo chkconfig mongod on
sudo systemctl status mongod

# Install Node.js 8.x
echo "Install Node.js 8.x"
echo "=========================================="
curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
sudo yum install -y nodejs
npm version

# Install Bower, Gulp, Grunt, Express, Nodemon
echo "Install Bower, Gulp, Grunt, Express, Nodemon"
echo "=========================================="
sudo npm install -g bower
sudo npm install -g gulp
sudo npm install -g grunt-cli
sudo npm install -g express
sudo npm install -g nodemon

# Installing the MEAN Boilerplate
# git clone https://github.com/meanjs/mean.git meanjs
# cd ~/meanjs
# npm install
# npm start

nodemon /vagrant/node/app.js

echo ""
echo "=========================================="
echo "Node setup:"
node -v
echo "Provision VM finished"
echo "=========================================="
echo ""



