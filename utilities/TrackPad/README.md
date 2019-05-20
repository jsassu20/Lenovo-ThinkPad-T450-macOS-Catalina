# Lenovo ThinkPad T450 TrackPad Configurations 

ApplePS2SmartTouchPad

- Contains the corresponding kext file which can be used in place of ReHabMan's VoodooPS2Controller.kext for the trackpad functionality. I don't reccomend using it unless you've installed the Lenovo T440 One Button ClickPad in place of the stock 3 button TrackPad that comes in the T450 stock. It can provide you with a solid configuration which contains a bunch of customization options. It can be used with the stock TrackPad but the physical buttons won't work.

#

Preference Pane

- Provides a system PrefPane which gives you extra control over the TrackPad and mouse functionality...

#

T440_One_Button_ClickPad

For people who choose to install the T440 trackpad after they've setup their laptop with my configuration. Run the .command file inside this folder and all the proper changes will be made automatically. This script requires elevated access so you'll need the Administrators password for you acount. It also contains the instructions for manual install as well.

*** The .command file requires that the EFI partition where CLOVER folder resides to be mounted ***

# 

VoodooPS2Controller

- Contains RehabMan's VoodooPs2Controller kernel extension and the .aml file which should be used with it in order to correct the FN buttons configuration in hackintosh builds. This kext is the reccomended kext to use with the stock 3 button touchpad thats present in the T450 from the factory.

