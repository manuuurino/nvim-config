#!/usr/bin/env bash

hyperfine \
	--warmup 10 \
	--prepare 'nvim --headless -c "quit!"' \
	-n "home dashboard" \
	"nvim --headless -c 'quit!'" \
	-n "opening init file from the config folder" \
	"nvim --headless -c 'quit!' ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua" \
	"$@"
