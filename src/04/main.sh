#!/bin/bash
. set_color.conf
. ./color.sh
. ./check.sh

if [[ -z $column1_background ]]; then column1_background=1
fi
if [[ -z $column1_font_color ]]; then column1_font_color=2
fi
if [[ -z $column2_background ]]; then column2_background=6
fi
if [[ -z $column2_font_color ]]; then column2_font_color=4
fi

BACK1=${BG[$column1_background]};
TEXT1=${TX[$column1_font_color]};
BACK2=${BG[$column2_background]};
TEXT2=${TX[$column2_font_color]};


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

set_color () {
  local color='';
  if   [[ $1 == 1 ]]; then color='white';
  elif [[ $1 == 2 ]]; then color='red';
  elif [[ $1 == 3 ]]; then color='green';
  elif [[ $1 == 4 ]]; then color='blue';
  elif [[ $1 == 5 ]]; then color='purple';
  elif [[ $1 == 6 ]]; then color='black';
  fi
  echo $color;
}

color_1=$(set_color $column1_background);
color_2=$(set_color $column1_font_color);
color_3=$(set_color $column2_background);
color_4=$(set_color $column2_font_color);

echo -en "\n"

if [[  $column1_background == 1 ]]; then
  echo "Column 1 background = default ($color_1)"
  else
  echo "Column 1 background = $column1_background ($color_1)"
fi
if [[ $column1_font_color = 2 ]]; then
  echo "Column 1 font color = default ($color_2)"
  else
  echo "Column 1 font color = $column1_font_color ($color_2)"
fi
if [[ $column2_background = 6 ]]; then
  echo "Column 2 background = default ($color_3)"
  else
  echo "Column 2 background = $column2_background ($color_3)"
fi
if [[ $column2_font_color = 4 ]]; then
  echo "Column 2 font color = default ($color_4)"
  else
  echo "Column 2 font color = $column2_font_color ($color_4)"
fi


