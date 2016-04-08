#!/bin/bash
echo "=========="
echo "Ejecutando Configuración de fuentes de Software, pulsa sobre la pestaña Otro Software y activa todas las casillas llamadas Canonical Parterns (o Socios de Canonical) e Independiente."
echo "=========="
sudo software-properties-gtk
sudo fuser -vki /var/cache/apt/archives/lock
sudo dpkg --configure -a
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-cache policy inkscape
sudo apt-get install -y system-config-samba synaptic gdebi firefox firefox-locale-es chromium-browser adobe-flashplugin geany p7zip-full xscreensaver xscreensaver-data-extra typecatcher gparted filezilla audacious inkscape gimp myspell-es usb-creator-gtk lxtask mencoder transmission elementary-tweaks winff aspell-es vlc git
sudo cd /tmp
sudo wget http://wps-community.org/download/dicts/es_ES.zip
sudo unzip es_ES.zip
sudo mkdir /opt/kingsoft/wp-office/office6/dicts
sudo mv ./es_ES /opt/kingsoft/wp-office/office6/dicts/
sudo rm ./es_ES.zip
firefox http://download.teamviewer.com/download/teamviewer_i386.deb
firefox http://wps-community.org/downloads
sudo apt-add-repository ppa:maarten-fonville/android-studio
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get install oracle-jdk7-installer
sudo apt-get install android-studio
echo \ "export IBUS_ENABLE_SYNC_MODE=1" >> ~/.profile
firefox https://code.visualstudio.com/Docs/?dv=linux64
sudo mv ./VSCode-linux-x64 /opt/
sudo ln -s /opt/VSCode-linux-x64/code /usr/bin/X11/code
echo "=========="
echo "Finalizado..."
echo "=========="
