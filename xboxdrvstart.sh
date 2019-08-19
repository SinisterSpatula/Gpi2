#!/bin/sh
## Uncomment one or all of the following if you need to find some information about the emulator or roms
## Name of the emulator
echo "1 is "$1 >> /dev/shm/runcommand.log

## Name of the software used for running the emulation
echo "2 is "$2 >> /dev/shm/runcommand.log

## Name of the rom
echo "3 is "$3 >> /dev/shm/runcommand.log

##Executed command line
#echo $4 >> /dev/shm/runcommand.log

## Find the Retroflag Joystick name
joystick=`find /dev/input/by-id/ -name "*event-joystick*"`
echo "Detected joystick as: "$joystick >> /dev/shm/runcommand.log



### The FUN begins
#Get ROM name striping full path
rom="${3##*/}"

echo "rom is "$rom >> /dev/shm/runcommand.log


### Set variables for your joypad and emulator
### Basic Configuraions - Standard controller mappings 
basicGPI="sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
    --evdev $joystick \
    --detach-kernel-driver \
    --silent \
    --force-feedback \
    --deadzone-trigger 15% \
    --deadzone 4000 \
    --mimic-xpad \
    --dpad-as-button \
    --trigger-as-button \
    --no-extra-events \
    --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_X=dpad_x,ABS_Y=dpad_y \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y"


### Extended Configurations
### Specific emulator configuration or any other parameters you will need only for some emulators

#scummvm standalone
scummvm="--ui-buttonmap a=a,b=b,x=x,Y=y,lb=lb,rb=rb \
    --ui-buttonmap start=KEY_Y,back=KEY_N \
    --ui-axismap dpad_x=dpad_x,dpad_y=dpad_y"

#Outrun Engine
cannonball="--ui-buttonmap x=KEY_V,a=KEY_B,b=KEY_A,Y=KEY_G \
    --ui-buttonmap start=KEY_ENTER,back=KEY_1,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"
    
#Streets of Rage remix
sorr="--ui-buttonmap x=KEY_V,a=KEY_S,b=KEY_C,Y=KEY_X,lb=KEY_D,rb=KEY_B,lb+rb=KEY_A,rb+lb=KEY_A \
    --ui-buttonmap start=KEY_ENTER,back=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

eduke32="--ui-buttonmap x=KEY_RIGHTCTRL,a=KEY_E,b=KEY_SPACE,y=KEY_LEFTSHIFT,lb=KEY_A,rb=KEY_D,a+lb=KEY_SEMICOLON,a+rb=KEY_APOSTROPHE,lb+rb=KEY_LEFTCTRL,rb+lb=KEY_LEFTCTRL \
    --ui-buttonmap start=KEY_ENTER+KEY_M,back=KEY_ESC,back+start=KEY_F10 \
    --ui-buttonmap du=KEY_UP+KEY_W,du+a=rel:REL_Y:-5:5,a+du=rel:REL_Y:-5:5,dd=KEY_DOWN+KEY_S,dd+a=rel:REL_Y:5:5,a+dd=rel:REL_Y:5:5,dl=KEY_LEFT,dr=KEY_RIGHT \
    --ui-buttonmap start+y=KEY_J,start+b=KEY_N,start+x=KEY_H,start+a=KEY_TAB"

openbor="--ui-buttonmap x=void,a=KEY_D,b=KEY_A,Y=KEY_S,lb=KEY_L,rb=KEY_R \
    --ui-buttonmap start=KEY_ENTER,back=KEY_BACKSPACE,back+start=KEY_F10 \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

mame4all="--ui-buttonmap start=KEY_1,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap b=KEY_LEFTCTRL,a=KEY_LEFTALT,x=KEY_SPACE,y=KEY_LEFTSHIFT,lb=KEY_Z,rb=KEY_X \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT,y+lb=KEY_TAB,y+rb=KEY_ENTER"
    
advmame94="--ui-buttonmap start=KEY_1+KEY_ENTER,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap b=KEY_LEFTCTRL,a=KEY_LEFTALT,x=KEY_SPACE,y=KEY_LEFTSHIFT,lb=KEY_Z,rb=KEY_X \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT,y+lb=KEY_TAB,y+rb=KEY_ENTER"
	
pifba="--ui-buttonmap b=KEY_LEFTCTRL,y=KEY_SPACE,a=KEY_LEFTALT,x=KEY_LEFTSHIFT,lb=KEY_Z,rb=KEY_X \
    --ui-buttonmap start=KEY_ENTER,back=KEY_TAB,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

fbacapcom="--ui-buttonmap b=KEY_LEFTSHIFT,y=KEY_LEFTCTRL,a=KEY_Z,x=KEY_LEFTALT,lb=KEY_SPACE,rb=KEY_X \
    --ui-buttonmap start=KEY_ENTER,back=KEY_TAB,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"
	
dosbox="--ui-buttonmap x=KEY_LEFTALT,a=KEY_SPACE,b=KEY_LEFTCTRL,lb=BTN_LEFT,y+lb=BTN_LEFT,rb=BTN_RIGHT,y+rb=BTN_RIGHT \
    --ui-buttonmap back=KEY_ESC,back+start=KEY_LEFTCTRL+KEY_F9 \
    --ui-buttonmap du=KEY_UP,y+du=REL_Y:1:20,dd=KEY_DOWN,y+dd=REL_Y:-1:20,dl=KEY_LEFT,y+dl=REL_X:-1:20,dr=KEY_RIGHT,y+dr=REL_X:1:20 \
    --ui-buttonmap y+x=KEY_1,y+a=KEY_ENTER,y+b=KEY_Y"

minecraft="--ui-buttonmap x=KEY_X:KEY_E:1000,a=KEY_LEFTSHIFT,b=KEY_SPACE,lb=BTN_LEFT,y+lb=rel:REL_WHEEL:1:250,rb=BTN_RIGHT,y+rb=rel:REL_WHEEL:-1:250 \
    --ui-buttonmap back=KEY_ESC,start=KEY_ENTER,back+start=exec:/opt/retropie/supplementary/xboxdrv/bin/quit.sh \
    --ui-buttonmap du=KEY_W,y+du=rel:REL_Y:-2:5,dd=KEY_S,y+dd=rel:REL_Y:2:5,dl=KEY_A,y+dl=rel:REL_X:-2:5,dr=KEY_D,y+dr=rel:REL_X:2:5"
	
daphne="--ui-buttonmap x=KEY_LEFTSHIFT,a=KEY_LEFTCTRL,b=KEY_LEFTALT \
    --ui-buttonmap start=KEY_1,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

mpv="--ui-buttonmap x=KEY_PAGEDOWN,a=KEY_P,b=KEY_M,y=KEY_PAGEUP,lb=KEY_J,rb=KEY_V \
    --ui-buttonmap start=KEY_0,back=KEY_9,back+start=KEY_Q \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

gpsp="--ui-buttonmap x=KEY_S,a=KEY_Z,b=KEY_X,lb=KEY_A,Y=KEY_A,rb=KEY_S \
    --ui-buttonmap start=KEY_ENTER,back=KEY_BACKSPACE,back+x=KEY_F10,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"
	
pcsx="--ui-buttonmap x=KEY_D,a=KEY_X,b=KEY_Z+KEY_ENTER,Y=KEY_S,lb=KEY_W,y+lb=KEY_E,rb=KEY_R,y+rb=KEY_T \
    --ui-buttonmap start=KEY_V,back=KEY_C,back+x=KEY_ESC,back+start=exec:/opt/retropie/supplementary/xboxdrv/bin/quit.sh,back+lb=KEY_F2,back+rb=KEY_F1 \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT"

fourway="--four-way-restrictor"

invert="--ui-buttonmap du=KEY_DOWN,dd=KEY_UP"


### Kill Command
xboxkill="sudo killall xboxdrv > /dev/null 2>&1"

### Execute the driver with the configuration you need
# $2 is the name of the core
case $2 in

	mame4all)
		case $rom in
			"btimem.zip"|"pacmanm.zip"|"mspacman.zip") # Configuration used only for these ROMs
				$xboxkill
				joycommand="$basicGPI $fourway $mame4all &"
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicGPI $mame4all &"
				eval $joycommand
			;;
		esac
	;;
	
	pifba)
		case $rom in
			"cybots.zip"|"dstlk.zip"|"hsf2.zip"|"msh.zip"|"mshvsf.zip"|"mvsc.zip"|"nwarr.zip"|"sfa2.zip"|"sfa3.zip"|"sfa.zip"|"sf2ce.zip"|"sf2hf.zip"|"sf2.zip"|"sgemf.zip"|"ssf2t.zip"|"ssf2.zip"|"vhunt2.zip"|"vsav2.zip"|"vsav.zip"|"xmvsf.zip"|"xmcota.zip") # Configuration used only for these ROMs
				$xboxkill
				joycommand="$basicGPI $fbacapcom &"
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicGPI $pifba &"
				eval $joycommand
			;;
		esac
	;;
	
	advmame-0.94)
		case $rom in
			"test1.zip"|"test2.zip"|"test3.zip") # Configuration used only for these ROMs
				$xboxkill
				joycommand="$basicGPI $advmame94 &"
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicGPI $advmame94 &"
				eval $joycommand
			;;
		esac
	;;
	
	dosbox)
	case $rom in
		"test1.zip"|"test2.zip"|"test3.zip") # Configuration used only for these ROMs
			$xboxkill
			joycommand="$basicGPI $dosbox &"
			eval $joycommand
		;;
		*) # Configuration for every other ROMs on this emulator
			$xboxkill
			joycommand="$basicGPI $dosbox &"
			eval $joycommand
		;;
		esac
	;;

	eduke32)
		$xboxkill
		joycommand="$basicGPI $eduke32 &"
		eval $joycommand
	;;
	
	openbor)
		$xboxkill
		joycommand="$basicGPI $openbor &"
		eval $joycommand
	;;
	
	openbor-6xxx)
		$xboxkill
		joycommand="$basicGPI $openbor &"
		eval $joycommand
	;;
	
	sorr)
		$xboxkill
		joycommand="$basicGPI $sorr &"
		eval $joycommand
	;;

	cannonball)
		$xboxkill
		joycommand="$basicGPI $cannonball &"
		eval $joycommand
	;;

	minecraft)
		$xboxkill
		joycommand="$basicGPI $minecraft &"
		eval $joycommand
	;;
	
	daphne)
		$xboxkill
		joycommand="$basicGPI $daphne &"
		eval $joycommand
	;;
	
	mpv)
		$xboxkill
		joycommand="$basicGPI $mpv &"
		eval $joycommand
	;;
	
	gpsp)
		$xboxkill
		joycommand="$basicGPI $gpsp &"
		eval $joycommand
	;;
	
	pcsx-rearmed)
		$xboxkill
		joycommand="$basicGPI $pcsx &"
		eval $joycommand
	;;
	
		scummvm)
		$xboxkill
		joycommand="$basicGPI $scummvm &"
		eval $joycommand
	;;

esac
