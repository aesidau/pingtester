#!/bin/bash
# Use: pingtestbyto.sh by_interface to_ip_address
# example: pingtestbyto.sh eth0 192.168.0.1
DATE=`/bin/date '+%s'`
TMPFILE="/home/pi/pinglogs/$1$2.tmp"
/bin/ping -I "$1" "$2" -c 4 -w 7 > "$TMPFILE"
PACKETS=`/bin/grep transmitted "$TMPFILE" | /bin/sed -e 's/^\([0-9]*\)[^0-9]*\([0-9]*\).*/\1,\2/'`
LATENCY=`/bin/grep ^rtt "$TMPFILE" | /bin/sed -e 's/[^=]*= //' -e 's/ ms//' -e 's/\//,/g'`
if [ -z "$LATENCY" ]
then LATENCY="0,0,0,0"
fi
echo "$DATE","$PACKETS","$LATENCY"
