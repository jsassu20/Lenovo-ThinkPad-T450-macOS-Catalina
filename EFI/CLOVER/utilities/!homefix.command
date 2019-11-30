#!/bin/bash
if [ ! -d "$HOME/Library/KeyBindings/" ];
then
	mkdir "$HOME/Library/KeyBindings/"
fi
cp -Rvf "./HomeEndFix/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/"
