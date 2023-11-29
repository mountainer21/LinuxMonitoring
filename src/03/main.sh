#!/bin/bash


. ./color.sh
. ./check.sh


BACK1=${BG[$1]};
TEXT1=${TX[$2]};
BACK2=${BG[$3]};
TEXT2=${TX[$4]};


HOSTNAME=$TEXT1$BACK1"HOSTNAME$NC = $TEXT2$BACK2$(cat /etc/hostname)"$NC;
TIMEZONE=$TEXT1$BACK1"TIMEZONE$NC = $TEXT2$BACK2$(cat /etc/timezone) UTC $(date +" %:::z")"$NC;
USER=$TEXT1$BACK1"USER$NC = $TEXT2$BACK2$(whoami)"$NC;
OS=$TEXT1$BACK1"OS$NC = $TEXT2$BACK2$(cat /etc/issue | awk '{print $1 $2}')"$NC;
DATE=$TEXT1$BACK1"DATE$NC = $TEXT2$BACK2$(date +"%d %b %Y %T")"$NC;
UPTIME=$TEXT1$BACK1"UPTIME$NC = $TEXT2$BACK2$(uptime | awk '{print $3}')"$NC;
UPTIME_SEC=$TEXT1$BACK1"UPTIME_SEC$NC = $TEXT2$BACK2$(awk '{print $1}' /proc/uptime)"$NC;
IP=$TEXT1$BACK1"IP$NC = $TEXT2$BACK2$(hostname -I)"$NC;
MASK=$TEXT1$BACK1"MASK$NC = $TEXT2$BACK2$( ifconfig | awk '{ if (NR==2) print $4}')"$NC;
GATEWAY=$TEXT1$BACK1"GATEWAY$NC = $TEXT2$BACK2$( ip n | awk '{if (NR==1) print $1 }' )"$NC;
RAM_TOTAL=$TEXT1$BACK1"RAM_TOTAL$NC = $TEXT2$BACK2"$(free --mebi | awk '{if (NR==2) printf "%.3f GB", $2 / 1024}')""$NC;
RAM_USED=$TEXT1$BACK1"RAM_USED$NC = $TEXT2$BACK2"$(free --mebi | awk '{if (NR==2) printf "%.3f GB", $3 / 1024}')""$NC;
RAM_FREE=$TEXT1$BACK1"RAM_FREE$NC = $TEXT2$BACK2"$(free -k | awk '{if (NR==2) printf "%.2f GB", $4 / 1024 }')""$NC;
SPACE_ROOT=$TEXT1$BACK1"SPACE_ROOT$NC = $TEXT2$BACK2"$(df /root/ | awk '{if (NR == 2) printf "%.2f MB", $2/1024}')""$NC;
SPACE_ROOT_USED=$TEXT1$BACK1"SPACE_ROOT_USED$NC = $TEXT2$BACK2"$(df /root/ | awk '{if (NR == 2) printf "%.2f MB", $3/1024}')""$NC;
SPACE_ROOT_FREE=$TEXT1$BACK1"SPACE_ROOT_FREE$NC = $TEXT2$BACK2"$(df /root/ | awk '{if (NR == 2) printf "%.2f MB", $4/1024}')""$NC;


echo -e $HOSTNAME;
echo -e $TIMEZONE;
echo -e $USER;
echo -e $OS;
echo -e $DATE;
echo -e $UPTIME;
echo -e $UPTIME_SEC;
echo -e $IP;
echo -e $MASK;
echo -e $GATEWAY;
echo -e $RAM_TOTAL;
echo -e $RAM_USED;
echo -e $RAM_FREE;
echo -e $SPACE_ROOT;
echo -e $SPACE_ROOT_USED;
echo -e $SPACE_ROOT_FREE;