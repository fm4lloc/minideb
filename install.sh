#!/bin/bash

# Automate a minimalist configuration for Debian 9.5
#
# Written by: Fernando Magalhães (fm4lloc) <fm4lloc@gmail.com>
#
# This program is free software; you can REDistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#

declare -r red=$(tput setaf 1)
declare -r blue=$(tput setaf 3)
declare -r normal=$(tput sgr0)

declare -r prog_name="MiniDeb"
declare -r prog_vesion="0.23.7" #AAAA/MM/DD

declare -r debian_version="9.5"

# Base package
declare -a pkg_base=(xorg slim openbox obconf thunar 
thunar-archive-plugin obmenu openbox-menu tint2
trayer wicd-gtk nitrogen lxappearance gtk2-engines
obsession conky sakura mirage gmrun scrot brasero
galculator transmission-gtk audacious inkscape gimp
chromium chromium-l10n mpv evince engrampa menu lxappearance
gtk2-engines geany volumeicon-alsa alsa-utils
gtk2-engines-murrine gnome-themes-standard hardinfo
ntfs-config)

# Extra Packpage
#declare -a pkg_libreoffice=(libreoffice libreoffice-l10n-pt-br libreoffice-gtk3)
#declare -a pkg_thunderbird=(thunderbird thunderbird-l10n-pt-br)
#declare -a pkg_firefox=(firefox-esr firefox-esr-l10n-pt-br)
#declare -a pkg_build_nvidia=(build-essential linux-headers-$(uname -r) module-assistant)

function help()
{
    version
	printf "\n%s\n" \
	"-i | --install - install packpages e copy config files."	   \
	"-d | --description - show description of installed packages." \
	"Example for install:"										   \
	"Try $0 -i or $0 --install"
}

function show_description()
{
	printf "${red}%s\n${normal}" "You can press Ctrl+C at any time to end."
	for pkg_name in ${pkg_base[*]}
	do
		apt-cache search "^$pkg_name$" | egrep "^$pkg_name -"
	done
}

function install_packpages()
{
	printf "${red}%s\n${normal}" "Installing packages..."
	sudo apt-get -y install ${PKG_BASE[*]}
	setup_system
	exit
	
}

function setup_system()
{
	printf "\n${red}\n%s\n${normal}" "Downloading Halo icons:"
	git clone https://github.com/Ampiflow/Halo
	cp -avr ./tint2 ~/.icons
	
	printf "${red}\n%s\n${normal}" "Copying configuration files:"
	cp -avr ./tint2 ~/.config
	cp -avr ./openbox ~/.config
	cp -avr ./geany ~/.config/
	cp -avr ./Wallpapers ~/
	
	sed -i s/_YOURUSER_/$(whoami)/g ./nitrogen/bg-saved.cfg
	sed -i s/_YOURUSER_/$(whoami)/g ./nitrogen/nitrogen.cfg
	cp -avr ./nitrogen ~/.config
	
	cp -avr ./.conkyrc ~/
	cp -avr ./.gtkrc-2.0 ~/
	cp -avr ./.fonts.conf ~/
	cp -avrb ./.bashrc ~/
	
	printf "${red}\n%s\n${normal}" "Applying resolution improvement on LED / LCD screens:"
	cp -avr ./.fonts.conf ~/
	
	chmod +x ~/.config/openbox/autostart.sh -v
	
	printf "${blue}\n%s\n${normal}" "Finished! Now you reboot the system."
}

function check_install()
{
	if [[ !$DEBIAN_VERSION =~ ^`cat /etc/debian_version`$ ]]; then
		printf "${red}\n%s\n${normal}" "[WARNING] This script was only tested on version $DEBIAN_VERSION of debian."
	fi
		printf "${red}\n%s\n${normal}" "Proceed with the installation? [N/y]"
        read -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            install_packpages
        else
			printf "\nBye!"
            exit -1
        fi
}

function version()
{
    printf "${red}${prog_name} ${prog_vesion}${normal}"
}


# Main
case $1 in
	-i | --install)
		check_install
		exit 0
		;;
	-r | --remove)
		exit 0
		;;
	-d | --description)
		show_description
		exit 0
		;;
	*)
		help
		exit 0
esac
