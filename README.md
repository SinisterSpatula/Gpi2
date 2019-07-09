# Gpi2 scripts

The goal of Gpi2 is to use the alternate D-pad mode (hold select + left until led flashes).  I'm updating all scripts to use this mode, and also moving away from doing things directly inside of runcommand-onstart.sh

Install Xboxdvr from the driver packages in RetroPie-Setup

Enable it and disable it.

Modify your runcommand-onstart.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onstart.sh`

```
#!/bin/sh

bash ./xboxdrvstart.sh $1 $2 $3 > /dev/null 2>&1
sudo pkill -STOP mpg123 > /dev/null 2>&1
```

Modify your runcommand-onend.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onend.sh`

```
#!/bin/sh

bash ./xboxdrvend.sh > /dev/null 2>&1
sudo pkill -CONT mpg123 > /dev/null 2>&1
```


# Install the controls_updater_menu

```shell
cd && cd RetroPie/retropiemenu && sudo mkdir Controllertools && wget -O control_updater_menu.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

# Switch the D-pad mode of the Gpi case:

The Gpi has a hidden option to change the D-PAD mode. To switch to direct input mode, press SELECT+DPAD LEFT for 5 seconds. You will know it worked when the LED flashes. These controller mappings are configured for d-pad “direct input” mode, so if you find that the d-pad is not working, try switching to this mode as instructed above.  If you need to revert back to facotry D-pad mode: To switch to hat mode (factory) press SELECT+DPAD UP for 5 seconds.
