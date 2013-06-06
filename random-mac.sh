#!/bin/sh
#MAC ADDRESS RANDOMIZER

2>/dev/null dd if=/dev/urandom bs=1 count=6 | od -t x1 | sed '2d;s/^0\+ //;s/ /:/g'