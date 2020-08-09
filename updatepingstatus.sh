#!/bin/bash

INFO=`/usr/bin/tail -n 1 /home/pi/pingtester/pinglogs/wlan0modem.log`
SENT=`echo "$INFO" | /usr/bin/cut -d "," -f 2`
RECEIVED=`echo "$INFO" | /usr/bin/cut -d "," -f 3`
WIFICOUNT=""
if [ $RECEIVED -eq 0 ]
then 
  WIFICOL=red
  WIFICOUNT=`/usr/bin/tail /home/pi/pingtester/pinglogs/wlan0modem.log | /bin/grep -n -m 1 -v ",.,0" | /usr/bin/cut -d : -f 1`" mins"
elif [ $RECEIVED -lt $SENT ]
then WIFICOL=orange
else WIFICOL=green
fi

INFO=`/usr/bin/tail -n 1 /home/pi/pingtester/pinglogs/eth0modem.log`
SENT=`echo "$INFO" | /usr/bin/cut -d "," -f 2`
RECEIVED=`echo "$INFO" | /usr/bin/cut -d "," -f 3`
MODEMCOUNT=""
if [ $RECEIVED -eq 0 ]
then 
  MODEMCOL=red
  MODEMCOUNT=`/usr/bin/tail /home/pi/pingtester/pinglogs/eth0modem.log | /bin/grep -n -m 1 -v ",.,0" | /usr/bin/cut -d : -f 1`" mins"
elif [ $RECEIVED -lt $SENT ]
then MODEMCOL=orange
else MODEMCOL=green
fi

INFO=`/usr/bin/tail -n 1 /home/pi/pingtester/pinglogs/eth0asp.log`
SENT=`echo "$INFO" | /usr/bin/cut -d "," -f 2`
RECEIVED=`echo "$INFO" | /usr/bin/cut -d "," -f 3`
NBNCOUNT=""
if [ $RECEIVED -eq 0 ]
then 
  NBNCOL=red
  NBNCOUNT=`/usr/bin/tail /home/pi/pingtester/pinglogs/eth0asp.log | /bin/grep -n -m 1 -v ",.,0" | /usr/bin/cut -d : -f 1`" mins"
elif [ $RECEIVED -lt $SENT ]
then NBNCOL=orange
else NBNCOL=green
fi

/bin/cat << EOF > /home/pi/pingtester/pingstatus/css/colours.css
#wifistatus {
  background: $WIFICOL;
}
#wifistatus p::after {
  content: "$WIFICOUNT";
}
#modemstatus {
  background: $MODEMCOL;
}
#modemsuatus p::after {
 "content: "$MODEMCOUNT";
}
#nbnstatus {
  background: $NBNCOL;
}
#nbnstatus p::after {
 $content: "$NBNCOUNT";
}
EOF

