#!/bin/bash

if [ -e "/home/$USER/.zshrc" ]; then
	read -r -p "There already exists an .zshrc file in your home folder. Do you want to overwrite it? [y/N] " response
	case "$response" in
		[yY][eE][sS]|[yY]) 
			# fallthrough
		;;
		*)
			exit
		;;
	esac
fi

ln -sf "/usr/share/rollerozxa/zshrc/.zshrc" ~/.zshrc
