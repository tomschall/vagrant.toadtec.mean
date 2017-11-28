MEAN Stack Vagrant File
=========

**[CentOS-7-x86_64-v20171127.box](https://www.dropbox.com/s/4yk8dhopfk6cwoe/CentOS-7-x86_64-v20171127.box):** 
Sets up a CentOS-7-x86_64-v20171127 box with the latest node.js, MongoDB, grunt, gulp and bower

Follow installation guide on http://docs.vagrantup.com/v2/installation/index.html to install Vagrant and VirtualBox

Installation
===================

###### Download box and add to your boxes
```Shell
vagrant box add CentOS-7-x86_64-v20171127 /path/to/box/CentOS-7-x86_64-v20171127.box
```

###### Start box 
```Shell
vagrant up
```

Control Vagrant
===================

###### Start box
```Shell
vagrant up
```

###### Suspend box
```Shell
vagrant suspend
```

###### Halt box
```Shell
vagrant halt
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