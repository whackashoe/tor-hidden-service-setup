Run `virt-manager`

Click "New"

Enter any name you please

Select "Local Install Media"

FORWARD


Select "Use Iso Image" -> Browse -> Browse Local

Select the Ubuntu Server 12.04 ISO you've downloaded earlier

OS type: "Linux"
Version "Ubuntu 12.04 LTS"

FORWARD

Select at least 512 MB of RAM

Select atleast 1 CPU

FORWARD

Check "Enable storage for this virtual machine"

Check "Create a disk image on the computer's hard drive"

Make sure you select at LEAST 4GB, if you have room consider choosing 15GB

Check "Allocate entire disk now"

FORWARD

Click "Advanced options"

Select the default network device (will be changed later), alternatively "Host device vnet0 (empty bridge)" to use bridge just set up

Select "Set a fixed MAC address"

Run `randommac.sh` and enter its output into the MAC address textbox:

Virt type: kvm

Architecture: Make it match the iso (and hopefully your host computer)

FINISH