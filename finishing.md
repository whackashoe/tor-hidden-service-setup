Shutdown your guest virtual machine

	sudo shutdown -P now

Go into virt-manager and select "Details"

Select Network on Left Bar which lists hardware 

Source Device -> Host Device VNET0 (Empty Bridge)
Device Model  -> Hypervisor Default

Restart your VM and login

Start tor:
	
	tor

Try grabbing from local web server:
	
	wget 127.0.0.1:4986
	less index.html

Try grabbing website:
	
	wget whatsmyip.net
	less index.html.1
	(type "/Your" without quotes to find the listed IP address)

Compare that listed IP address with the result on the host machine using a NON TOR browser

If they are the same... no good. You need to fix the networking bridge. If they are different, congratulations.



Go to your host machine, and open the tor browser bundle and navigate to the address listed in /home/{username}/hidden-service/hostname

If tor is working correctly, you will have your hidden service webpage come up.