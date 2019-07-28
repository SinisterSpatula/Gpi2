# Gpi2 scripts

These xboxdrv controller scripts greatly enhance the capabilities of your Gpi Case.  They can provide many virtual buttons using a button as a modifier.  (In effect, it can turn the six button control scheme into a 12 button one!)  It also helps by mapping controls to keyboard keys for emulators that lack the ability to interface with the Gpi case controls (some of the standalone non-libretro cores).

# To migrate to or to install the new framework:

## Update the menu

```shell
cd && cd RetroPie/retropiemenu && wget -O control_updater_menu.sh  https://raw.githubusercontent.com/SinisterSpatula/Gpi/master/control_updater_menu.sh && sudo chmod 775 control_updater_menu.sh
```

## Then run this command

```shell
 sudo /home/pi/RetroPie/retropiemenu/control_updater_menu.sh
```
## choose Update Controls Framework, then exit.

## Retart Emulationstation

### Done.

You also need to have xboxdrv installed (if it isn't already).  [See the Guide here](https://sinisterspatula.github.io/SuperRetropieGuides/Controls_Updater_Menu)


## See also

* [Our guide located here](https://sinisterspatula.github.io/SuperRetropieGuides/Controls_Updater_Menu)

* If you have suggestions for improving these control maps, please [add your comments or questions here.](https://github.com/SinisterSpatula/Gpi2/issues/2)
