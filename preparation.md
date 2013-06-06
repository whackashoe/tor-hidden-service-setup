host machine : linux

* `TOR` is what we will use to route traffic

* `KVM` is virtual machine software

* `virt-manager` is a nice gui for kvm

* `bridge-utils` will allow us to create a network bridge

* `dnsmasq` allows us to "mask" our dns


Type this to install these utilities

	sudo apt-get install tor kvm virt-manager bridge-utils dnsmasq

And also download the Ubuntu 12.04 Server ISO from here:

	http://www.ubuntu.com/start-download?distro=server&bits=64&release=lts

And the TOR Browser Bundle from here:

	https://www.torproject.org/projects/torbrowser.html.en


Add the following to `/etc/network/interfaces`:

	# NAT bridge
	auto vnet0
	iface vnet0 inet static
		address 172.16.0.1
		netmask 255.255.255.0
		bridge_ports none
		bridge_maxwait 0
		bridge_fd 1
		       
		up iptables -t nat -I POSTROUTING -s 172.16.0.0/24 -j MASQUERADE
		down iptables -t nat -D POSTROUTING -s 172.16.0.0/24 -j MASQUERADE


Start the bridge interface:

	sudo ifup vnet0

To Setup DHCP and DNS for clients edit `/etc/dnsmasq.conf` to include:

	interface=vnet0
	dhcp-range=172.16.0.2,172.16.0.254,1h

Now, start dnsmasq:

	sudo /etc/init.d/dnsmasq restart

We will now setup TOR, edit `/etc/tor/torrc` and add to the bottom:

	VirtualAddrNetwork 10.192.0.0/10
	AutomapHostsOnResolve 1
	TransPort 9040
	TransListenAddress 172.16.0.1
	DNSPort 53
	DNSListenAddress 172.16.0.1

Now, run `middlebox.sh` to setup IPTABLES rules

And finally, start TOR

	sudo tor