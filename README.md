# Gpi2 scripts

Install Xboxdvr from the driver packages in RetroPie-Setup

Enable it and disable it.

Modify your runcommand-onstart.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onstart.sh`

```
#!/bin/sh

bash ./xboxdrvstart.sh $1 $2 $3
sudo pkill -STOP mpg123 > /dev/null 2>&1
```

Modify your runcommand-onend.sh to include the xboxdrv command:

`sudo nano /opt/retropie/configs/all/runcommand-onend.sh`

```
#!/bin/sh

bash ./xboxdrvend.sh
sudo pkill -CONT mpg123 > /dev/null 2>&1
```


# Install the controls_updater_menu

```shell
cd && cd RetroPie/retropiemenu && sudo mkdir Controllertools && wget -O control_updater_menu.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

