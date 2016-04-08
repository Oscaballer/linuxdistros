#!/bin/bash
echo "===================================================="
echo "===================================================="
echo "LINUXDISTROS SCRIPT"
echo "===================================================="
echo "===================================================="
echo "ElementaryOS Freya - Escritorio Básico Español v0.1"
echo "===================================================="
echo "Ejecutando Configuración de fuentes de Software, pulsa sobre la pestaña Otro Software y activa todas las casillas llamadas Canonical Parterns (o Socios de Canonical) e Independiente."
echo "===================================================="
sudo software-properties-gtk
sudo fuser -vki /var/cache/apt/archives/lock
sudo dpkg --configure -a
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-cache policy inkscape
sudo apt-get install -y vokoscreen system-config-samba synaptic gdebi firefox firefox-locale-es chromium-browser adobe-flashplugin geany p7zip-full xscreensaver xscreensaver-data-extra typecatcher gparted filezilla audacious inkscape gimp myspell-es usb-creator-gtk lxtask mencoder transmission elementary-tweaks winff aspell-es vlc git
sudo cd /tmp
sudo wget http://wps-community.org/download/dicts/es_ES.zip
sudo unzip es_ES.zip
sudo mkdir -p /opt/kingsoft/wp-office/office6/dicts
sudo mv ./es_ES /opt/kingsoft/wp-office/office6/dicts/
sudo rm ./es_ES.zip
firefox http://download.teamviewer.com/download/teamviewer_i386.deb
firefox http://wps-community.org/downloads
firefox http://download.ebz.epson.net/dsc/search/01/search/searchChangeLanguage?languageEnglishName=ES
echo "===================================================="
echo "Finalizado..."
echo "===================================================="
