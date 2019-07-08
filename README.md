# Gpi2 scripts

Install Xboxdvr from the driver packages in RetroPie-Setup

Enable it and disable it.

Place the commands in your runcommand-onstart.sh and runcommand-onend.sh, look at the ones in this repository to see the commands that are needed in those scripts.



# Install the controls_updater_menu

```shell
cd && cd RetroPie/retropiemenu && sudo mkdir Controllertools && wget -O control_updater_menu.sh https://raw.githubusercontent.com/SinisterSpatula/Gpi2/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

