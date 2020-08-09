Simple home network dashboard
=============================

I created this under Covid-19 lockdown in Melbourne, in part as an 
interesting project, but also because access to the Internet became absolutely
critical for our work, education, socialising and entertainment. Every time
the Internet seemed to go down, people would be banging on my door to fix it,
so at least this dashboard could tell people themselves if it was just their
device or some bigger problem.

Requires:
* Raspberry Pi with both Ethernet and Wi-Fi interfaces, e.g. Raspberry Pi 3 B/B+ or Raspberry Pi 4 models
* External LCD 5" touch display screen, e.g. [this one](https://raspberry.piaustralia.com.au/products/little-bird-5-display)
* Power supply and Ethernet cable
* External keyboard, HDMI cable, and convenient TV (just during the initial setup)

Overview of the steps to install it:
1. Set up the Pi. You can use a [Raspberry Pi OS Lite image](https://www.raspberrypi.org/downloads/raspberry-pi-os/) to make it quicker to download.
1. Run `sudo raspi-config` to ensure password, localisation, timezone, and remote ssh access. 
1. Once you've done this, then do `sudo shutdown now` so you can remove the keyboard, HDMI cable and TV, and do the rest of the steps remotely via ssh. Attach the LCD touch screen at this point also, then start up the Pi again.
1. Get the necessary packages with `sudo apt-get update && sudo apt-get install xinit raspberry-ui-mods chromium-browser git --yes`
1. Pull down this dashboard application with `cd && git clone https://github.com/aesidau/pingtester.git`
1. Run `sudo rapi-config` to set boot option to autologin with desktop.
1. `cd pingtester` and run `./setup-kiosk.sh && crontab -u pi crontab.txt && ./setup-lcd.sh` after which it should reboot and all be running

