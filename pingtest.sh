#!/bin/bash
/home/pi/pingtestbyto.sh eth0 192.168.0.1 >> /home/pi/pinglogs/eth0modem.log
/home/pi/pingtestbyto.sh wlan0 192.168.0.1 >> /home/pi/pinglogs/wlan0modem.log
/home/pi/pingtestbyto.sh eth0 58.162.26.201 >> /home/pi/pinglogs/eth0asp.log
/home/pi/updatepingstatus.sh
#echo `/bin/date '+%s'`,`/bin/ping -I eth0 192.168.0.1 -c 4 -w 7 | /bin/grep ^rtt | /bin/sed -e 's/[^=]*= //' -e 's/ ms//' -e 's/\//,/g'` >> /home/pi/pinglogs/eth0modem.log
#DATE=`/bin/date '+%s'`
#/bin/ping -I wlan0 192.168.0.1 -c 4 -w 7 > /home/pi/pinglogs/tempwlan0
#echo "$DATE",`cat /home/pi/pinglogs/tempwlan0 | /bin/grep ^rtt | /bin/sed -e 's/[^=]*= //' -e 's/ ms//' -e 's/\//,/g'` >> /home/pi/pinglogs/wlan0modem.log
#echo "=====" >> /home/pi/pinglogs/wlan0modemfull.log
#echo "$DATE" >> /home/pi/pinglogs/wlan0modemfull.log
#cat /home/pi/pinglogs/tempwlan0 >> /home/pi/pinglogs/wlan0modemfull.log
#echo `/bin/date '+%s'`,`/bin/ping -I wlan0 192.168.0.1 -c 4 -w 7 | /bin/grep ^rtt | /bin/sed -e 's/[^=]*= //' -e 's/ ms//' -e 's/\//,/g'` >> /home/pi/pinglogs/wlan0modem.log
#echo `/bin/date '+%s'`,`/bin/ping -I eth0 58.162.26.201 -c 4 -w 7 | /bin/grep ^rtt | /bin/sed -e 's/[^=]*= //' -e 's/ ms//' -e 's/\//,/g'` >> /home/pi/pinglogs/eth0asp.log
