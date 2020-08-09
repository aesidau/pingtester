#!/bin/bash
# Sets up the LCD touch screen. Note that X should be installed before hand,
# and that the Raspberry Pi will reboot afterwards.
mkdir -p /home/pi/.config/lxsession/LXDE-pi/
/bin/cat << EOF >> /home/pi/.config/lxsession/LXDE-pi/autostart
@xset s off
@xset -dpms
@xset s noblank
@chromium-browser --noerrdialogs --incognito --kiosk file:///home/pi/pingtester/pingstatus/index.html
EOF
