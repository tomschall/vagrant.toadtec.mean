MEAN Stack Vagrant File
=========

**[CentOS-7-x86_64-v20171127.box](https://www.dropbox.com/s/4yk8dhopfk6cwoe/CentOS-7-x86_64-v20171127.box):** 
Sets up a CentOS-7-x86_64-v20171127 box with the latest node.js, MongoDB, grunt, gulp and bower

Follow installation guide on http://docs.vagrantup.com/v2/installation/index.html to install Vagrant and VirtualBox

Control Vagrant
===================

###### Start box
```Shell
vagrant up
```

###### SSH into box
```Shell
vagrant ssh
```

###### Tear down box
```Shell
vagrant destroy
```

More documentation on http://www.vagrantup.com/


Control Mongo
===================

###### Start MongoDB
```Shell
sudo service mongod start
```

###### Stop MongoDB
```Shell
sudo service mongod stop
```

###### Restart MongoDB
```Shell
sudo service mongod restart
```