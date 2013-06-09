#!/bin/sh
# run this on your host to setup your network for your services vm's
# consider adding this to startup on host machine, you will have to manually enter 
# the encryption password for the VM's though

sudo service bind9 stop
sudo ifdown vnet0
sudo ifup vnet0
sudo /etc/init.d/dnsmasq restart
sudo tor &
sudo ./middlebox.sh
virt-manager
