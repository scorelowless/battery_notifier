#!/bin/bash
#
#You may have to install acpi!
#Run 'chmod a+x /path/to/this/script' to make it executable
#Run 'crontab -e' and write '*/10 * * * * /path/to/this/script' to make it run every 10 minutes
#Of course you can change the number if you want

#How low/high does the battery level have to be to send the notification
#change it if you need
battery_level_notification_lower_treshold=15
battery_level_notification_upper_treshold=85

#Calculate the average battery level
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)' | awk '{ SUM += $1} END {print SUM}'`
number_of_batteries=`acpi -b | grep -P -o '[0-9]+(?=%)' | wc -l`
#TODO: make it so it doesn't have to run acpi two times
average_battery_level=$((battery_level / number_of_batteries))

#Send notification if battery level is below the set treshold
if [ $average_battery_level -le $battery_level_notification_lower_treshold ]
then
    notify-send "Low battery level!" "${average_battery_level}%"
fi

#Send notification if battery level is above the set treshold
if [ $average_battery_level -ge $battery_level_notification_upper_treshold ]
then
    notify-send "High battery level: ${average_battery_level}%" "Remove the charger!"
fi