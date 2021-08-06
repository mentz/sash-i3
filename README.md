# SASH - Screen Area Sharing
This script was created to allow for sharing of a selectable area of the screen on video chat applications like Discord and Google Meet.
Right now this script is very specific to my installation, so it may need adjustments to run on other systems.

The script is specific to installations running Linux with the i3 window manager on X11 display manager and with an Nvidia graphics card (GTX-10xx or newer).
I probably will not change much on this script as it is very specific to my environment, but instead might develop an application that does this in a better, less gambiarra, way.

# Installation
This script needs the following applications installed:
- `ffcast` (2.5.0)
- `ffmpeg` (n4.4)
- `ffplay` (n4.4)
- `yad` (10.1)

Also, add these lines to your i3 config file, customizing what makes sense for your environment:
```text
bindsym --release $mod+Shift+a exec bash "/path/to/sash.sh"
for_window [instance=ffplay] floating enable, sticky enable, move position 1919px 1079px
no_focus [instance=ffplay]
```
Be sure that the shortcut assigned does not conflict with existing shortcuts on your i3 config file.

# Running
Use the shortcut you defined on the i3 config file to summon the script.
Your cursor will turn into a plus sign, meaning it's ready to select an area of the screen to share.
Hold down left mouse button at one corner of the area you want to share, move the mouse to the opposing corner and release the left mouse button.

In about 10 seconds a new window will be available for selection inside your video chat application, it will be named "/tmp/sash.fifo".

To exit the script click on the red circle with a black `R` that will appear on the notification area of your status bar. This might make the video chat application restart, so I suggest to first stop sharing before exiting the script.
