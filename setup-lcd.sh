#!/bin/bash
# Sets up the LCD touch screen. Note that X should be installed before hand,
# and that the Raspberry Pi will reboot afterwards.
cd /home/pi/
git clone https://github.com/goodtft/LCD-show.git
cdmod -R 755 LCD-show
cd LCD-show/
sudo ./LCD5-show
