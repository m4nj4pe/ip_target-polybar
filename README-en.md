# Index

**[Description](#description) | [Dependencies](#dependencies) | [Code](#code) | [Spanish](https://github.com/m4nj4pe/ip_target-polybar/blob/main/README-es.md)**  

**IP_Target** is a module that helps to be part of the success at work, improving productivity.

![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo_notarget.png)
![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo_ip.png) 


### Description

This module is designed to improve productivity when making HTB machine, Tryhackme or to target any IP target we have.

Its operation is simple:
  - With a left click, on the part of the Polybar where we have our module, a pop-up window opens with Rofi where we put an IP, which we have as a target and press Enter to incorporate it.
  - Once incorporated, with the right click on the bar where the IP appears, we will have the address in our clipboard ready to put it in our terminal or where it is necessary.

![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo.gif)

### Dependencies 

For its correct functioning we must have installed:
- [Polybar](https://github.com/polybar/polybar) v3.6.7
- [Rofi](https://github.com/davatorium/rofi) v1.7.3
- [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet) (Optional)

The module has been created in these versions, so in previous versions or higher I can't be 100% sure that it will work.

In case the script does not run, add execution permissions to it.

### Code

To add a section to the Polybar we have to enter from `$HOME/.config/polybar/launch.sh`.
```bash
#!/usr/bin/env sh

## Add this to your wm startup file.

## Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Center bar

polybar ip -c ~/.config/polybar/current.ini &
```
Once the section is added, in the `$HOME/.config/polybar/current.ini` file we add the features of our section after the ones we have:
```bash
[bar/your_bar_name]
inherit = bar/main
width = 9%
height = 40
offset-x = 65.45% offset-y = 15
offset-y = 15
background = ${color.bg}
foreground = ${color.white}
bottom = false
click-right = ~/path/from/your/file/copy_ip.sh click-right
padding = 1
padding-top = 2
module-margin-left = 0
module-margin-right = 0
;modules-left = date sep mpd
modules-center = ip_target
;wm-restack = bspwm
```
At the end of the above file, we add the following:
```bash
[module/module_name]
type = custom/script
exec = ~/path/your/file/copy_ip.sh 
click-left = ~/route/of/your/file/copy_ip.sh click-left
hook-0 = echo
hook-1 = ~/route/of/your/file/copy_ip.sh
```
Finally, we must change the paths in the above code to reference the following [script](https://github.com/m4nj4pe/ip_target-polybar/tree/main/script/copy_ip.sh)
```bash
/bin/bash

file_ip="~/path/from/your/file//ip.tmp"

if [ "$1" = "click-left" ]; then
    new_ip=$(rofi -dmenu -p "Enter IP:" <<< "$(cat "$file_ip")")
    if [ "$new_ip" = "No target" ]; then
        echo "No target" > "$file_ip"
    elif [ -n "$new_ip" ]; then
        echo "$new_ip" > "$file_ip"
    fi

    polybar-msg hook module_name 1
fi

ip=$(cat "$file_ip")

if [ "$ip" = "No target" ]; then
    echo -n "%{F#FF0000}󱚡 %{u-} No target" 
else
    echo -n "$ip" | xclip -sel clip
    echo -n "%{F#00FF00}󱚝 %{F#ffffff}$ip" 

fi
```
That's it. In case you want to change the icons, I leave you referenced the NerdFonts section above. 😀

Thanks for having a look! If you have any suggestions you can make them and even if you want improvements you can make a fork! 😁 or give me a star. ✨

Best regards!!! 🧑‍💻

