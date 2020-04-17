#!/bin/sh
thunar --daemon &
tint2 &&
trayer --expand true --transparent true --alpha 255 --edge bottom --align right --expand true --SetDockType true --widthtype request &
nitrogen --restore &
volumeicon &
conky &
