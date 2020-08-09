#!/bin/sh

# Enable and disable HDMI output on the Raspberry Pi
# Use: sudo ./rpi-hdmi.sh on
#  - original from https://gist.github.com/AGWA/9874925
#  - updated as per https://gist.github.com/SirCrocker/937d06f8f2c1227a83802b9b77f60ba0 to use vcgencmd instead of tvservice

is_off ()
{
	#tvservice -s | grep "TV is off" >/dev/null
	vcgencmd display_power | grep "display_power=0" >/dev/null
}

case $1 in
	off)
		#tvservice -o
                vcgencmd display_power 0
	;;
	on)
		if is_off
		then
			#tvservice -p
                        vcgencmd display_power 1
			#curr_vt=`fgconsole`
			#if [ "$curr_vt" = "1" ]
			#then
			#	chvt 2
			#	chvt 1
			#else
			#	chvt 1
			#	chvt "$curr_vt"
			#fi
		fi
	;;
	status)
		if is_off
		then
			echo off
		else
			echo on
		fi
	;;
	*)
		echo "Usage: $0 on|off|status" >&2
		exit 2
	;;
esac

exit 0
