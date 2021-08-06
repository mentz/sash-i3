# Screen Area Sharing
This script was created to allow for sharing of a selectable area of the screen on video chat applications like Discord and Google Meet.
I developed this script and right now it is very specific to my installation, so it needs adjustment to run on other systems.

The script is specific to installations running Linux with the i3 window manager on X11 display manager and with an Nvidia graphics card (GTX-10xx or newer).

# How to run
This script needs the following applications installed:
- ffcast (2.5.0)
- ffmpeg (^n4.4)
- ffplay (^n4.4)
- yad (10.1)

Also, add these lines to your i3 config file, customizing what makes sense for your environment:
```text
bindsym --release $mod+Shift+a exec bash "/path/to/sash.sh"
for_window [instance=ffplay] floating enable, sticky enable, move position 1919px 1079px
no_focus [instance=ffplay]
```
