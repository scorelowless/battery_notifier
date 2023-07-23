#!/bin/bash
#
#You may have to install acpi!

#how low does the battery level have to be to turn the notification
battery_level_notification_treshold=15

#calculate the average battery level
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)' | awk '{ SUM += $1} END {print SUM}'`
number_of_batteries=`acpi -b | grep -P -o '[0-9]+(?=%)' | wc -l`
average_battery_level=$((battery_level / number_of_batteries))

#send notification if battery level is below the set treshold
if [ $average_battery_level -le $battery_level_notification_treshold] then
    notify-send "Battery low" "Battery level is ${average_battery_level}%!"
fi