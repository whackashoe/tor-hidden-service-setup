#!/bin/sh
#MAC ADDRESS RANDOMIZER
#http://www.commandlinefu.com/commands/view/8471/generat-a-random-mac-address

(date; cat /proc/interrupts) | md5sum | sed -r 's/^(.{12}).*$/\1/; s/([0-9a-f]{2})/\1:/g; s/:$//;'
