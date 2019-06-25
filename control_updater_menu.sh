#!/bin/bash
#=============================================================================
#title:         menu.sh
#description:   Menu which allows multiple items to be selected, for the Controls for the GPi
#author:        Crash
#created:       June 24 2019
#updated:       N/A
#version:       1.0
#usage:         ./menu.sh
#==============================================================================
export NCURSES_NO_UTF8_ACS=1
#IFS=';'

# Welcome
 #dialog --backtitle "GPi Controls MENU" --title "The Gpi Controls Menu Utility" \
 #   --yesno "\nDo you want to proceed?" \
 #   28 110 2>&1 > /dev/tty \
 #   || exit

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Update Controls" \
            2 "Update Controls Beta" \
            3 "System Reboot" \
            4 "System Shutdown" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) update_controls  ;;
            2) controls_beta  ;;
            3) system_reboot  ;;
            4) system_shutdown  ;;
            *)  break ;;
        esac
    done
}

######################
# Functions for menu #
######################

function update_controls() {
cd
cd /opt/retropie/configs/all
sudo rm runcommand-onend.sh
sudo rm runcommand-onstart.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/runcommand-onend.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/runcommand-onstart.sh
sudo chmod a+x *.sh
cd
cd /opt/retropie/supplementary/xboxdvr/bin
sudo rm quit.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/quit.sh
sudo chmod a+x quit.sh
}

function launch_commandline() {
break
}

function controls_beta() {
cd
cd /opt/retropie/configs/all
sudo rm runcommand-onend.sh
sudo rm runcommand-onstart.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/test/runcommand-onend.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/test/runcommand-onstart.sh
sudo chmod a+x *.sh
cd
cd /opt/retropie/supplementary/xboxdrv/bin
sudo rm quit.sh
wget https://raw.githubusercontent.com/SinisterSpatula/Gpi/test/quit.sh
sudo chmod a+x quit.sh
}

function system_shutdown() {
sudo shutdown now
}

function system_reboot() {
sudo reboot
}
# Main

main_menu
