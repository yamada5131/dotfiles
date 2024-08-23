#!/bin/bash

## Set GTK Themes, Icons, Cursor and Fonts

THEME='Catppuccin-Mocha'
ICONS='Tela-circle-dracula'
FONT='Cantarell 11'
CURSOR='McMojave-cursors'

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
  ${SCHEMA} gtk-theme "$THEME"
  ${SCHEMA} icon-theme "$ICONS"
  ${SCHEMA} cursor-theme "$CURSOR"
  ${SCHEMA} font-name "$FONT"
}

apply_themes
