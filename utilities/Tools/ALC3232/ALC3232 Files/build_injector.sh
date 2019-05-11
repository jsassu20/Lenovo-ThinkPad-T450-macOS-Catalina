# Create Audio Injector for Realtek ALC3232 Codec "Sniki"
HDA=ALC3232
$SUDO rm -Rf $KEXTDEST/AppleHDA_$HDA.kext
$SUDO rm -f $SLE/AppleHDA.kext/Contents/Resources/*.zml*
./patch_hda.sh "$HDA"
