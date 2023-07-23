# Script to notify user about their nearly dying/overloading battery
-> Written for Linux

-> Supports devices with multiple batteries

Well that's basically all of its features, it only has 13 lines of actual code, what do you expect

# Installing script
To use the script:

1. Make sure acpi is installed:

        sudo apt install acpi
   or any other command, depending on distro

2. Make script executable:

        chmod a+x /path/to/the/script

3. Use cron to make it run every n minutes (10 in the example):

        crontab -e

    then write a line to it:

        */10 * * * * /path/to/the/script


4. That's it!
---

If you notice any bugs/problems or have an idea to upgrade it, please let me know

I wrote this script mainly because I have two batteries in my laptop and BAMS (applet on Linux Mint used to notify about low battery level) couldn't properly handle this
