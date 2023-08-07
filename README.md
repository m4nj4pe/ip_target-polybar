# Índice

**[Descripción](#descripción) | [Dependencias](#dependencias)  | [Código](#código)**

**IP_Target** es un módulo que ayuda a formar parte del éxito en el trabajo, mejorando la productividad.

![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo_notarget.png)
![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo_ip.png) 


### Descripción

Este módulo esta pensado para mejorar la productividad a la hora de hacer máquina HTB, Tryhackme o para apuntar cualquier IP objetivo que tengamos.

Su funcionamiento es simple:
  - Con un click izquierdo, sobre la parte de la Polybar donde tenemos nuestro módulo, se abre una ventana emergente con Rofi donde pondremos una IP, la cuál tenemos como objetivo y pulsamos Enter para incorporarla.
  - Una vez incorporada, con el click derecho sobre la barra donde aparece la IP, tendremos la dirección en nuestra clipboard lista para ponerla en nuestra terminal o donde sea necesario.

![](https://github.com/m4nj4pe/ip_target-polybar/blob/main/media/demo.gif)

### Dependencias 

Para su correcto funcionamiento debemos de tener instalado:
- [Polybar](https://github.com/polybar/polybar) v3.6.7
- [Rofi](https://github.com/davatorium/rofi) v1.7.3
- [Nerd Fonts](https://www.nerdfonts.com/#home) (Opcional)

El módulo ha sido creado en estas versiones, por lo que en versiones anteriores o superiores no puedo asegurar al 100% que funcione.

En caso de que el script no se ejecute, añadirle permisos de ejecución.

### Código

Para añadir una sección a la barra de Polybar debemos de entrar de `$HOME/.config/polybar/launch.sh`
```bash
#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Center bar

polybar ip -c ~/.config/polybar/current.ini &
```
Añadida la sección, en el archivo `$HOME/.config/polybar/current.ini` añadimos las características de nuestra sección a continuación de las que tengamos:
```bash
[bar/nombre_de_tu_barra]
inherit = bar/main
width = 9%
height = 40
offset-x = 65.45%
offset-y = 15
background = ${color.bg}
foreground = ${color.white}
bottom = false
click-right = ~/ruta/de/tu/archivo/copy_ip.sh click-right
padding = 1
;padding-top = 2
module-margin-left = 0
module-margin-right = 0
;modules-left = date sep mpd
modules-center = ip_target
;wm-restack = bspwm
```
Al final de este archivo anterior, añadimos lo siguiente:
```bash
[module/nombre_modulo]
type = custom/script
exec = ~/ruta/de/tu/archivo/copy_ip.sh 
click-left = ~/ruta/de/tu/archivo/copy_ip.sh click-left
hook-0 = echo
hook-1 = ~/ruta/de/tu/archivo/copy_ip.sh
```
Por último, debemos de cambiar las rutas de los códigos anteriores para referenciar el siguiente script.



