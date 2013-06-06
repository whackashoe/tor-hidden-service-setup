# Setting up the Webserver
 
Select first grub option

Enter your LVM passphrase

Login: 		{username}
Password: 	{password}

Ok we're in, time to install needed software for a server

	sudo apt-get install tor lighttpd

Lets create a directory for our hidden service

	mkdir /home/{username}/hidden-service

And we have to add these things to `/etc/tor/torrc`:
	
	SocksPort 9050
	SocksListenAddress 127.0.0.1
	HiddenServiceDir /home/{username}/hidden-service/
	HiddenServicePort 80 127.0.0.1:4986

Run tor, then look in /home/{username}/hidden-service
Two files should be listed

* hostname 		: the onion address you can give out
* private_key 	: the key you need to keep secret

Copy `lighttpd.conf` to /etc/lighttpd/lighttpd.conf

Create a directory for error pages:

	sudo mkdir /var/www/status-pages/

Create an index page:

	sudo vim /var/www/index.html
		> HELLO HIDDEN SERVICE

Start lighttpd:

	sudo service lighttpd start

Start tor

	tor


Ensure neither have any errors in configuration.

###### [Next :: Finishing](https://github.com/whackashoe/tor-hidden-service-setup/blob/master/finishing.md)