yay -Sy helix \
		zellij

rm -rf ~/.config/helix 2>&1 /dev/null
ln -s ${PWD}/helix ~/.config/helix
