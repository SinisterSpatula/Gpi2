#!/bin/sh
pkill -STOP mpg123

if [ "$2" = "daphne" ]
then
    sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
    --evdev /dev/input/by-id/usb-RetroFlag_GPi_Case_RetroFlag_01-event-joystick \
    --detach-kernel-driver \
    --silent \
    --force-feedback \
    --deadzone-trigger 15% \
    --deadzone 4000 \
    --mimic-xpad \
    --dpad-as-button \
    --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y \
    --ui-buttonmap x=KEY_LEFTSHIFT,a=KEY_SPACE,b=KEY_LEFTALT \
    --ui-buttonmap start=KEY_1,back=KEY_5,back+start=KEY_ESC \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT \
&
fi


if  [ "$1" = "gba" ]
then
    sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
    --evdev /dev/input/by-id/usb-RetroFlag_GPi_Case_RetroFlag_01-event-joystick \
    --detach-kernel-driver \
    --silent \
    --force-feedback \
    --deadzone-trigger 15% \
    --deadzone 4000 \
    --mimic-xpad \
    --dpad-as-button \
    --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y \
    --ui-buttonmap x=KEY_X,a=KEY_C,b=KEY_V,lb=KEY_S,Y=KEY_S,rb=KEY_X \
    --ui-buttonmap guide=KEY_B,start=KEY_ENTER,back=KEY_DELETE:KEY_ESC:2000 \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT \
&
fi

if [ "$2" = "pcsx-rearmed" ]
then
    sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
    --evdev /dev/input/by-id/usb-RetroFlag_GPi_Case_RetroFlag_01-event-joystick \
    --detach-kernel-driver \
    --silent \
    --force-feedback \
    --deadzone-trigger 15% \
    --deadzone 4000 \
    --mimic-xpad \
    --dpad-as-button \
    --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y \
    --ui-buttonmap x=KEY_X,a=KEY_C,b=KEY_V,lb=KEY_A,Y=KEY_S,rb=KEY_D \
    --ui-buttonmap guide=KEY_B,start=KEY_ENTER,back=KEY_DELETE,back+start=KEY_ESC,back+lb=KEY_L,back+rb=KEY_R \
    --ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT \
&
fi

