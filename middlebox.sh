#!/bin/sh
#middlebox.sh for tor proxying of VM's

# Tor's TransPort
TRANS_PORT="9040"

# your internal interface
INT_IF="vnet0"

iptables -F
iptables -t nat -F

iptables -t nat -A PREROUTING -i $INT_IF -p udp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -i $INT_IF -p tcp --syn -j REDIRECT --to-ports $TRANS_PORT