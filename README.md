# Gpi2 scripts

The goal of Gpi2 is to move away from doing things directly inside of runcommand-onstart.sh  Also, to support both d-pad modes simultaneously.

Install Xboxdrv from the driver packages in RetroPie-Setup

Enable it and disable it.

Modify your runcommand-onstart.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onstart.sh`

```
#!/bin/sh

source /opt/retropie/configs/all/xboxdrvstart.sh > /dev/null 2>&1
sudo pkill -STOP mpg123 > /dev/null 2>&1
```

And then it's time to modify runcommand-onend.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onend.sh`

```
#!/bin/sh

source /opt/retropie/configs/all/xboxdrvend.sh > /dev/null 2>&1
sudo pkill -CONT mpg123 > /dev/null 2>&1
```


# Install the controls_updater_menu

```shell
sudo mkdir -p ~/RetroPie/retropiemenu/Controllertools && cd && cd ~/RetroPie/retropiemenu/Controllertools && sudo wget -O control_updater_menu.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

# Switch the D-pad mode of the Gpi case:

The Gpi has a hidden option to change the D-PAD mode. To switch to direct input mode, press SELECT+DPAD LEFT for 5 seconds. You will know it worked when the LED flashes. If you need to revert back to facotry D-pad mode: To switch to hat mode (factory) press SELECT+DPAD UP for 5 seconds.  It does not matter which mode your d-pad is in for these mappings, they work with both modes now.

# Finish Up install

Launch the Controls_Updater_menu and pick option 1.  This will install the rest of the files and get the latest controller mappings.
  > If you are having trouble finding the Controls_Updater_Menu in your menu, make sure you press start and go to “Other Settings” and make sure “Parse Gamelists Only” is set to OFF. (and restart emulation station, so it will parse and show it).
