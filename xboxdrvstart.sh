#!/bin/sh
## Uncomment one or all of the following if you need to find some information about the emulator or roms
## Name of the emulator
#echo $1 >> /dev/shm/runcommand.log

## Name of the software used for running the emulation
#echo $2 >> /dev/shm/runcommand.log

## Name of the rom
#echo $3 >> /dev/shm/runcommand.log

##Executed command line
#echo $4 >> /dev/shm/runcommand.log


### The FUN begins
#Get ROM name striping full path
rom="${3##*/}"


### Set variables for your joypad and emulator
### Basic Configuraions - Standard controller mappings 
basicGPI="sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
    --evdev /dev/input/by-id/usb-RetroFlag_GPi_Case_RetroFlag_01-event-joystick \
    --detach-kernel-driver \
    --silent \
    --force-feedback \
    --deadzone-trigger 15% \
    --deadzone 4000 \
    --mimic-xpad \
    --dpad-as-button \
    --no-extra-events \
    --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_X=dpad_x,ABS_Y=dpad_y \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y"


### Extended Configurations
### Specific emulator configuration or any other parameters you will need only for some emulators

eduke32="--ui-buttonmap x=KEY_RIGHTCTRL,a=KEY_E,b=KEY_SPACE,y=KEY_LEFTSHIFT,lb=KEY_A,rb=KEY_D,a+lb=KEY_SEMICOLON,a+rb=KEY_APOSTROPHE,lb+rb=KEY_LEFTCTRL,rb+lb=KEY_LEFTCTRL \
    --ui-buttonmap start=KEY_ENTER+KEY_M,back=KEY_ESC,back+start=KEY_F10 \
    --ui-buttonmap du=KEY_UP+KEY_W,du+a=rel:REL_Y:-5:5,a+du=rel:REL_Y:-5:5,dd=KEY_DOWN+KEY_S,dd+a=rel:REL_Y:5:5,a+dd=rel:REL_Y:5:5,dl=KEY_LEFT,dr=KEY_RIGHT \
    --ui-buttonmap start+y=KEY_J,start+b=KEY_N,start+x=KEY_H,start+a=KEY_TAB"

openbor="--ui-buttonmap x=KEY_F,a=KEY_S,b=KEY_D,Y=KEY_A,lb=KEY_L,rb=KEY_R \
    --ui-buttonmap start=KEY_ENTER,back=KEY_BACKSPACE,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

mame4all="--ui-buttonmap start=KEY_1,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap a=KEY_LEFTCTRL,b=KEY_LEFTALT,x=KEY_SPACE,y=KEY_LEFTSHIFT,lb=KEY_Z,rb=KEY_X \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT,y+lb=KEY_TAB,y+rb=KEY_ENTER"
	
pifba="--ui-buttonmap b=KEY_LEFTCTRL,y=KEY_SPACE,a=KEY_LEFTALT,x=KEY_LEFTSHIFT,lb=KEY_Z,rb=KEY_X \
    --ui-buttonmap start=KEY_ENTER,back=KEY_TAB,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"
	
dosbox="--ui-buttonmap x=KEY_LEFTALT,a=KEY_SPACE,b=KEY_LEFTCTRL,lb=BTN_LEFT,y+lb=BTN_LEFT,rb=BTN_RIGHT,y+rb=BTN_RIGHT \
    --ui-buttonmap back=KEY_ESC,back+start=KEY_LEFTCTRL+KEY_F9 \
    --ui-buttonmap du=KEY_UP,y+du=REL_Y:1:20,dd=KEY_DOWN,y+du=REL_Y:-1:20,dl=KEY_LEFT,y+dl=REL_X:-1:20,dr=KEY_RIGHT,y+dr=REL_X:1:20"

minecraft="--ui-buttonmap x=KEY_X:KEY_E:1000,a=KEY_LEFTSHIFT,b=KEY_SPACE,lb=BTN_LEFT,y+lb=rel:REL_WHEEL:1:250,rb=BTN_RIGHT,y+rb=rel:REL_WHEEL:-1:250 \
    --ui-buttonmap back=KEY_ESC,start=KEY_ENTER,back+start=exec:/opt/retropie/supplementary/xboxdrv/bin/quit.sh \
    --ui-buttonmap du=KEY_W,y+du=rel:REL_Y:-2:5,dd=KEY_S,y+dd=rel:REL_Y:2:5,dl=KEY_A,y+dl=rel:REL_X:-2:5,dr=KEY_D,y+dr=rel:REL_X:2:5"
	
daphne="--ui-buttonmap x=KEY_LEFTSHIFT,a=KEY_LEFTCTRL,b=KEY_LEFTALT \
    --ui-buttonmap start=KEY_1,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

gpsp="--ui-buttonmap x=KEY_S,a=KEY_Z,b=KEY_X,lb=KEY_A,Y=KEY_A,rb=KEY_S \
    --ui-buttonmap start=KEY_ENTER,back=KEY_BACKSPACE,back+x=KEY_F10,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"
	
pcsx="--ui-buttonmap x=KEY_D,a=KEY_X,b=KEY_Z+KEY_ENTER,Y=KEY_S,lb=KEY_W,y+lb=KEY_E,rb=KEY_R,y+rb=KEY_T \
    --ui-buttonmap start=KEY_V,back=KEY_C,back+x=KEY_ESC,back+start=exec:/opt/retropie/supplementary/xboxdrv/bin/quit.sh,back+lb=KEY_F2,back+rb=KEY_F1 \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

fourway="--four-way-restrictor"

invert="--ui-buttonmap du=KEY_DOWN,dd=KEY_UP"

autofire="--autofire A=250,B=250"

### Stop Music
stopmusic="sudo pkill -STOP mpg123 > /dev/null 2>&1"

### Kill Command
xboxkill="sudo killall xboxdrv > /dev/null 2>&1"

### Execute the driver with the configuration you need
# $2 is the name of the core
case $2 in
	
	mame4all)
		case $rom in
			"1942.zip"|"1943.zip"|"1944.zip"|"19XX.zip") # Configuration used only for these ROMs
				$xboxkill && $stopmusic
				joycommand="$basicGPI $mame4all $autofire &"
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill && $stopmusic
				joycommand="$basicGPI $mame4all &"
				eval $joycommand
			;;
		esac
	;;
	
	pifba)
		case $rom in
			"1942.zip"|"1943.zip"|"1944.zip"|"19XX.zip") # Configuration used only for these ROMs
				$xboxkill && $stopmusic
				joycommand="$basicGPI $pifba $autofire &"
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill && $stopmusic
				joycommand="$basicGPI $pifba &"
				eval $joycommand
			;;
		esac
	;;
	
	dosbox)
	case $rom in
		"amidar.zip"|"atetris.zip"|"puckman.zip") # Configuration used only for these ROMs
			$xboxkill && $stopmusic
			joycommand="$basicGPI $dosbox &"
			eval $joycommand
		;;
		*) # Configuration for every other ROMs on this emulator
			$xboxkill && $stopmusic
			joycommand="$basicGPI $dosbox &"
			eval $joycommand
		;;
		esac
	;;

	eduke32)
		$xboxkill && $stopmusic
		joycommand="$basicGPI $eduke32 &"
		eval $joycommand
	;;
	
	openbor)
		$xboxkill && $stopmusic
		joycommand="$basicGPI $openbor &"
		eval $joycommand
	;;

	minecraft)
		$xboxkill && $stopmusic
		joycommand="basicGPI $minecraft &"
		eval $joycommand
	;;
	
	daphne)
		$xboxkill && $stopmusic
		joycommand="basicGPI $daphne &"
		eval $joycommand
	;;
	
	gpsp)
		$xboxkill && $stopmusic
		joycommand="basicGPI $gpsp &"
		eval $joycommand
	;;
	
	pcsx-rearmed)
		$xboxkill && $stopmusic
		joycommand="basicGPI $pcsx &"
		eval $joycommand
	;;

esac
