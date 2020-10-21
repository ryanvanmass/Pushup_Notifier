#!/bin/bash
######## Install Dependancies ########
sudo apt install -y libnotify-bin

######## Create Folder Structure && Nessasary files ########
mkdir /home/$USER/'Pushup Notifier'/

# Creates Pushup_notifier.sh
echo "#!/bin/bash" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh
echo "######## Read in CurrentCount ########" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh
echo "CurrentCount=\`cat /home/$USER/'Pushup Notifier'/CurrentCount.txt\`" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh

echo " " >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh

echo "######## Count Updater ########" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh
echo 'UpdatedCount=$(($CurrentCount+10))' >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh
echo "echo \$UpdatedCount > /home/$USER/'Pushup Notifier'/CurrentCount.txt" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh

echo " " >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh

echo "######## Notification Push ########" >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh
echo 'XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -t 3000 -a "Push Up Notifier" "Todays Count: $UpdatedCount"' >> /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh

# Creates CurrentCount.txt
touch /home/$USER/'Pushup Notifier'/CurrentCount.txt
echo 0 >> /home/$USER/'Pushup Notifier'/CurrentCount.txt

######## Crontab Entry ########
crontab -l | { cat; echo "# Pushup Notifier"; } | crontab -
crontab -l | { cat; echo "* 14 * * * sh /home/$USER/'Pushup Notifier'/Pushup_Notifier.sh"; } | crontab -
