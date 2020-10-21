#!/bin/bash
######## Read in CurrentCount ########
CurrentCount=`cat /home/$USER/'Pushup Notifier'/CurrentCount.txt`

######## Count Updater ########
UpdatedCount=$(($CurrentCount+10))
echo $UpdatedCount > /home/$USER/'Pushup Notifier'/CurrentCount.txt

######## Notification Push ########
XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -t 3000 -a "Push Up Notifier" "Todays Count: $UpdatedCount"
