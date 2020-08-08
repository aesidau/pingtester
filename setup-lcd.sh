#!/bin/bash
cd /home/pi/
git clone https://github.com/goodtft/LCD-show.git
cdmod -R 755 LCD-show
cd LCD-show/
sudo ./LCD5-show
