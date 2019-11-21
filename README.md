![Screenshot](misc/logo/screenshot.png)

# macOS Catalina (Lenovo ThinkPad T450)

```  
- Intel 5th Generation Architecture (Broadwell)
- Intel HD Graphics 5500
- Intel Series 9 Chipset Family
- macOS Catalina Catalina.x
- Hot Patched Clover Configuration
- AirPort Extreme (Broadcom BCM94360CSAX & NGFF A/E Adapter) * Recommended Upgrade
- All native macOS Catalina features work as long as you upgrade the WiFi card to a supported configuration
```

#

### PayPal

- If you like my work then please feel free to donate. Every little bit helps! jsa55u@icloud.com | Paypal.me/Sass86oh

#

### iMessage (Contact me whenever for help)

- Jsass20@gmail.com (or Jsassu20@me.com)

#

## Credits

RehabMan:

- For a number of different parts of this configuration which have made this build possible including his USBInjectAll.kext configuration, SSDT-DEH01 for disabling the EH01 device and allowing all USB traffic on the XHC device, VoodooPS2Controller.kext which provides a perfect configuration for TouchPad functionality along with SSDT-VPS2 which is based on his SSDT-PS2K Hot Patched file, SSDT-UIAC for providing a template to configure proper USB injection, and a number of other SSDT Hot Patches present in the dsl folder which can be used to configure a number of different situations. RehabMan is an absolute genius when it comes to Hackintosh configurations in the community and I owe the knowledge I've managed to gain over the last year to his tireless efforts and guides in the community.

JcSnider:

- For providing me with an excellent build in the for of his Lenovo ThinkPad X1 Carbon Generation 3 Build which has been the basis of this Hot Patched configuration. A number of the Hot Patched files present in this build come directly from his X1 Carbon configuration and it has been the main reason why I've been able to adapt a build for us T450 users so please thank him for his outstanding work!

AcidAnthera:

- For Lilu.kext and all of the included Lilu Plugins which have made countless configurations possible among a plethora of Hackintosh machines! AcidAnther is a genius coder and developer and without his hard work and effort we would not be able to create the sheer number of hackintosh configurations with universal kexts like we have the ability to do now thanks to his/her development.

Snikii:

- For a number of his Hot Patched files which inspired a lot of the files I've been able to adapt. For his contribution to ThinPad hackintosh configurations which I've used for inspiration. For his install guides on Tonymacx86.com which I've used to learn countless amounts of info from in adapting this configuration. 

The Hackintosh Community:

- Without which I would not have been able to learn everything I have been able to learn. I want to thank you all this community is amazing!

   
## Hardware Configuration:

```  
- Intel Core i7-5600U | Broadwell (5th Generation) 
- Dual Core @ 2.7 GHz (up to 3.7 GHz with Turbo Boost) 
- Crucial 16GB (2x8) | DDR3 @ 1600 MHz | (Model CT102464BF160B.M16) | Pulled from a 2014 MacBook Pro
- Intel HD 5500 Graphics | 1536 MB VRAM | Full QE/CI & Metal Support  | HDMI Out @ 3840x2160 Max Resolution
- LG 1080P Full High Definition IPS Display LP140WF6(SP)(C2) (Replaced stock 1600x900 TN Display)
- 3 Solid State Drives | 500G Samsung 850 Evo SATA | 1TB Samsung 840 Evo M.2 | 500G Samsung 840 Evo M.2
- Realtek SDHC | 3x USB 3.1 | HDMI | Intel Gigabit LAN | SIM card  | AUX In/Out | Microphone | HD Webcam 
- Dual Battery Setup (Hot Patched and fully functioning with accurate percentage reporting)   
- Synaptic One Button Trackpad from T440s (Replaced 3 button Trackpad for better functionality with macOS)
- AirPort Extreme AC (1300 MB/s) & Bluetooth 4.0 PCIe (Broadcom BCM94360CSAX) NGFF A/E Adapter Required  
```
    
## Build Features:

- This is a 100% working macOS Catalina setup! Nothing needs to be changed! Just swap your files with mine and enjoy! (WiFi upgrade needed for complete functionality)

- AppStore Purchases, iMessage, FaceTime, Instant Hotspot, Continuity, Handoff, AirDrop, iTunes Purchases, System Update, Siri, Metal, Sleep, Power Settings, Backlight Control, Touchpad Gestures (3 and 4 Finger Including Swipes) AirPort Extreme Functionality, Bluetooth, Location Services, iCloud Features are Fully supported with the proper AirPort card. Battery functioning properly thanks to hot patched files.  

- Find My Mac only works with real AirPort card! If you lock the device via iCloud with a PC WiFi card (even with a supported chipset) you're gonna find    yourself in a situation you don't want to deal with. 
    

## Recommended Hardware Changes:
  
For full functionality, you will need to swap out the stock Intel WiFi & BT card with a natively supported AirPort Card. The wireless network card is the only hardware change needed for complete functionality (everything else functions in Mac). The original Intel WiFi & Bluetooth 4.1 Card is not supported in macOS (Bluetooth works) so if you want WiFi you have to replace the internal NGFF card with one that's supported in macOS Catalina. The chipsets that Mac actually comes with are almost always Broadcom or Atheros based cards. There are no Intel cards which will function in Mac so don't waste your time trying to get it working. I recommend purchasing the Apple AirPort Extreme Broadcom BCM94360CSAX along with an NGFF A/E adapter, I can confirm this card fits and works perfectly in the T450. Using an actual Apple card also allows for proper Handoff, AirDrop, Instant Hotspot, and other Continuity features to function properly and also solves a number of other issues you'll face with a PC based card even if its supported. The BCM94360CSAX is supported OOB and it even functions during macOS installation and gives you the ability to install macOS from online in recovery mode if you lose the USB install drive that you made and your system runs into an issue that requires the OS to be reinstalled. 

The card is a MIMO 3x3 (use one of the WWAN antennas for the third antenna probe or use the two normal ones and the speed will max out at 866 Mbps) It's 802.11 AC based and can download up to 1.3 Gbps. I got both the AirPort card and the required adapter for $40 dollars off Amazon with same day shipping! This card is also supported in Windows with the proper drivers so you can continue running Windows if need be.
    

## BIOS Configuration Settings:

```  
- UEFI Bios Version: JBET71WW (1.35) | Latest Version Available (as of April 2019)
- Intel Management Engine Firmware Version: JBHT17WW (1.04) 
- ThinkPad Model Number: 20BV0001US
- CPU: Intel Core i7-5600U
- Memory: 16384 MB
- Wake on LAN disabled for all options
- Intel Rapid Start Disabled
- UEFI Only (CSM Enabled)
- Secure Boot disabled
- Display Memory set to 256 MB (512 is fine though)
- Virtualization enabled (VT + disabled)
- All PCIe devices enabled except for finger print sensor (Causes problems when waking from sleep)
- Memory Execution Prevention is enabled
- Hyper threading enabled
- My BIOS is unlocked so I can set DVMT to 64MB. I recommend doing this but it's not required.
```
        
## Support For Similar Hardware:
  
This post contain basically everything necessary to install macOS Catalina on a Lenovo ThinkPad T450 as well as most Broadwell Lenovo Laptops from 2014-2016 with Intel HD5500 Graphics on either the i5 or i7 processors if you opt to use my Static Patched ACPI files. This will almost certainly require that you patch your own DSDT though. You can find information below regarding the actual process but you may also try mine out and see if it works (only if you have a T450 or T450s though). Any other device will require that you patch your own DSDT. Take a look in "utilities/ACPI" for my files and use them as a guide to patch your own DSDT if you choose to go with static patching for whatever reason. I strongly recommend that you choose to stick with the Hot Patched configuration as it provides a number of benefits over the old method of Static Patching. First its already complete in this build which means you can just delete the contents of your "/Volumes/ESP/EFI/CLOVER" folder and then copy and paste the entire setup I've created into that same CLOVER folder. Hot Patching is capable of universal support across a wide range of comparable hardware so even if your laptop in not a T450 or Lenovo for that matter but it contains a Broadwell processor and HD Graphics 5500 then this setup will almost certainly work for you (with minor adjustments possibly needed in the config.plist or with kexts for other hardware not present in my configuration). The most beneficial reason for choosing the Hot Patched method though is that it requires no knowledge of how to patch an DSDT because Clover takes care of everything for you and survives BIOS changes and updates! Anyone who can copy and paste can use this build so long as there base configuration matches mine (refer to the first section of this guide for that information).

  
## Installing Clover Boot-loader & macOS Catalina:

```  
Your computer WILL RESTART at least one time while installing. THIS IS NORMAL.
```
  
Use CLOVER Installer in order to setup the needed EFI partition on your USB macOS Installer as well as the permanent EFI partition that will be on the same Hard Drive where you plan on installing macOS (if there is not already the proper partition present on the device Clover installer will create it for you). When the process finishes all you have to do is mount the EFI partition of both drives and swap out the CLOVER and BOOT folders that exist inside of the EFI folder with the ones from my setup. My configuration is a full Hot Patched instead of Static Patched DSDT patching which is more of a problem in maintaining over time. Hot Patching is much more stable and its also universally supported across the designated hardware it was based on. You won't have to worry about needing to patch your own DSDT because this method doesn't require you to patch your DSDT file. Clover will patch it on the fly with this setup. 
  
## Advanced Configuration and Power Interface (ACPI):

One of the most important aspects of running macOS on PC hardware and getting all of the proper functionality out of the setup is a properly configured DSDT file. For those of you who aren't yet familiar, a DSDT is essentially a configuration file which informs the operating system you are using about the hardware thats present in your system. As far as I'm aware, all computers with Intel processors have a DSDT, its part of whats called an ACPI (Advanced Configuration and Power Interface) which is a method created by Intel for allowing its hardware to be identified in a wide range of devices. Since Apple Computers utilize Intel processors, they too have an ACPI and in turn a DSDT. The only issue is that Apple has different definitions for their hardware than most other PC manufacturers and as such they require the need to patch the DSDT on PC hardware in order to achieve full functionality. There are also SSDT files which can be used to add code into the actual DSDT file without needing to modify the DSDT itself. Think of SSDTs as DSDT extensions. There are two methods for patching the DSDT on PC hardware for use with macOS... 
  
### Hot Patching:

The newest method for patching ACPI code in order to solve issues with functionality is known as Hot Patching. This method is hands down the preferred option to use in all cases because of its versatility and support across different devices, and most importantly its ability to survive BIOS changes, updates, and macOS version upgrades. If a Hot Patched build exists for your hardware or even hardware which is similar then your best bet is to use it and invest your time and effort into making it function with your device. Hot Patching works different than Static patching in that you're not making any changes to the DSDT directly as you would with static patching, instead all changes are done on the fly by Clover itself and this is what allows for a single configuration to be supported across multiple devices. The changes are always initiated during the booting of the OS and aren't permanently made to a physically ACPI table. You need to use Clover Configurator in order to create a Hot Patched build and the process involves two basic methods for creating the proper modifications to the DSDT on the fly.
  
- The first method is searching and replacing. When using this option you are essentially telling clover to find specific code in the DSDT such as the name of a specific piece of hardware. An example is the video controller. In macOS the video card needs to be named IGPU in order for power management to work with it. In order to hot patch this section of the DSDT you would create a patch in Clover Configurator that basically looks for all instances of the video card (if not named IGPU) and then it will replace those pieces of code with the proper needed name. So if your video card is named GFX0 in your systems ACPI then you create a patch using ASCII code that basically says "Find all GFX0 references and Replace them with IGPU". This will solve your graphics power control issue.
   
- The other method utilized in Hot patching is called find and disable. It works on the same principle in that it finds specific code present in the system and instead of replacing it, it will rename the method which voids its function and then a new SSDT will be created which contains the method you voided so that the changes you need to make are introduced in the custom SSDT.

### Static Patching:

The original method involves the process of pulling the physical DSDT and SSDT files that are part of your computers ACPI configuration and then making direct modifications to the code present in those files (patching) and then placing the modified files into a specific folder where they will then be injected at boot by Clover in place of the original untouched files in order to fix any issues you were dealing with prior to patching. This method works well however it has its two major limitations.   
   
- First, any changes made to your BIOS configuration (booting  into the BIOS and changing any of the available options) or updates to newer BIOS versions will require that you re pull the DSDT and SSDT files all over again and patch them because of changes that will occur in the structure of the DSDT following any BIOS modifications or updates. This can be extremely annoying as it may take a good amount of time perfecting a patched configuration (especially in a laptop which because of the need to patch the battery configuration in order to get it working correctly). The use of custom SSDT files for making DSDT changes can be a big benefit in this situation as they can achieve the same goal of changing the code in the DSDT without needing to change the actual DSDT itself however this requires an extensive understanding of the ACPI configuration in order to create an SSDT that fixes an issue you might have if one does not currently exist elsewhere that you can use.  
     	   
- Second, Static Patching has no universal support and thus is required to be done for all configurations individually which utilize this method for patching the ACPI! This means that in almost all cases, if someone has the same computer as you and they post their build on a forum and you come across it, you almost always wont be able to just load their configuration into your's by substituting the CLOVER folder's contents with regards to the ACPI directory even though you have the same device. This means that all users who want to install macOS on their devices will unfortunately need to know how to patch their DSDT if they want a completely functioning setup. This is unfortunately an advanced process and requires extensive knowledge of the inner workings of ASL coding and the macOS ACPI configuration in order to accomplish a complete DSDT patch.       

          
## Static Patching General Steps:

If you want to STATIC patch then check out the "utilities/ACPI" directory for my files and the patches you can use. Everything is labeled. I can not give you a perfectly detailed method for Static patching a DSDT as its a very complicated process and its very specific to each device which you attempt to utilize it with. All ACPI configurations are different across different manufacturers and thus require specific changes and utilize specific patches which are created by users of the devices they were designed to be used on. I can only provide you with the steps and information thats universal across all devices with Static Patching. That would be extracting the required files, decompiling the DSDT and SSDTs, the process of applying a patch in maciASL, saving the finished product as an compiled configuration in .aml format, and moving the patched files into the         "/Volumes/ESP/EFI/CLOVER/ACPI/patched" folder.

### Instructions:

- Clear out the contents of the "/Volumes/ESP/EFI/CLOVER/ACPI/origin" folder and empty trash if there were files present. Restart the computer and enter the Clover Boot Screen. Now press FN+F4 and release and then press F4 and release. This will dump you ACPI configuration into the ACPI/origin directory and you can access them by booting normally and navigating to the "/Volumes/ESP/EFI/CLOVER/ACPI/origin/" folder.

- Download MaciASL, iasl, and, patchmatic from RehabMans repo and then unzip all 3 files and move iasl and patchmatic files to your home directory, and put MaciASL in Applications folder and then open terminal and execute the following commands:

  ```
  - sudo cp iasl /usr/bin
  - sudo cp patchmatic /usr/bin
  ```

- Delete the two files in your home directory and make a folder on your desktop named DSDT

- Make a folder on your desktop and copy the files from the "/Volumes/ESP/EFI/CLOVER/ACPI/origin" folder (the ones that begin with SSDT or DSDT only) into the folder on your desktop. You can delete the ones which have "x5_2-" in the middle of their name because they aren't needed.

- Open your terminal to the location of your folder on the desktop that contains those files you copied and enter the following command:

  ```
  - iasl -da -dl DSDT.aml SSDT*.aml
  ```

- It will decompile all files from .aml files into .dsl files.... THE ONLY FILE YOU NEED IS DDST.dsl! Remove it from that folder and put it on the          desktop.

- Double click on your DDST.dsl file and it will open maciASL (maciASL needs to be in Applications).

- Hit "compile"and if you get any red lines then you need to fix them depending on what your computer is it will be different so you'll have to find those fixes. Click on each red line from the pop up box and it will show you the line in the DDST.dsl file that needs to be patched in order to use the file. Yellow warnings are ok to have so don't worry. If you have no errors that's fine and you can still add patches for certain things.
         
- Whatever patches you want to add are up to you but all you need to do is hit "patch" and then find the corresponding patch in the left hand menu or enter the contents of a patch you find elsewhere into the right widow on the upper half and then you will see the bar at the bottom indicate changes that are going to be made from that patch. Hit apply and then you just added a patch. You can continue adding patches to this same file. There are a few common patches which you should apply from the left hand menu one by one. So you find the patch and then select it from the left side and then you see the changes on the right side and hit apply then move to the next patch until you've finished. The common patches you should add are (They will all be in the left side menu and begin with "sys" near the bottom of the list. Apply them one by one)

  ```
  - "Fix _WAK Arg0 v2" "HPET Fix"
  - "SMBUS Fix"
  - "IRQ Fix"
  - "RTC Fix"
  - "OS Check Fix"
  - "Fix Mutex with non-zero SyncLevel"
  ```

- When you finish close the patch window but not maciASL yet! Now hit compile again and make sure no red errors show up. Now click "file" and select "save" now click file again then chose "save as" and name the file DSDT.aml and make sure you chose ACPI Machine Language from the "File Format" selection box and save it to your desktop. Now take that file and add it into "/Volumes/ESP/EFI/CLOVER/ACPI/patched" folder and then you're all set! You just patched your DSDT and SSDT files. Take the DDST.dsl file on your desktop and put it somewhere safe so that you can easily add more patches down the road without needing to start all over from the beginning.


PAY ATTENTION TO THE .dsl and .asl extension of each file and don't mix them up.

## Users Who've Installed The T440 TrackPad

I've included a folder that contains the files necessary for implementing my preferred trackpad configuration after installing the Synaptic One Button Clickpad in my Lenovo ThinkPad T450. I don't recommend using these files unless you have installed the T440 trackpad as well. The configuration can be found at "/Volumes/ESP/EFI/CLOVER/utilities/Trackpad/T440-Clickpad/"

### Instructions:

```
1. Run my ".command" file to make changes automatically. 
```

### Manual Install:

```
1. Replace the SSDT-VPS2.aml in the folder listed below with SSDT-ASTP.aml.
   - "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

2. Replace VoodooPS2controller.kext in the following 3 folders listed below with ApplePS2SmartTouchpad.kext.
   - "/Library/Extensions/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

3. Run the !kextcache.command script (requires admin password).
```

## Miscellaneous Information:

- Make sure your bio settings are in order, disable CompuTrace all security chips network booting turn your video men as hit as you can, disable fingerprint sensor because you won’t need it, to play around with a few other settings to get a successful boot if it doesn't work the beginning. Also make sure you enable CSM for UEFI booting because that's what you'll be using this is not a Legacy install.

- Once you get the USB loaded for install, prepare the drive with disk utility and format it as APFS and then install to that drive. About halfway through the install the computer is going to restart it may even restart twice, that’s normal the install did not fail are you need to do is instead of selecting an install Mac OS from install Mac OS you want to select install Mac OS from “whatever you chose the name your drive when you formatted it”. If it restarts again do the same thing allow to continue.

- Once the install finishes go through the setup process take the contents of the install folder which will be just like you used for the USB installer instead move all those contents to the EFI directory of the Drive that used to install Mac OS on because this will be your permanent clover set up. Once you do that you should then be able to into Clover every time you start up and then go directly to your macOS. There are ways to configure it so that you can start directly in the Mac OS but you'll have to figure that out on your own.

- If you decide to go with a USB Wifi dongle instead of upgrading the PCIe card then keep in mind that you will not get the full functionality you would have with an official AirPort module such as AirDrop and Location Services. I suggest using the Asus USB-53 Nano Wireless A/C dongle Because I know for a fact it works with this build and macOS Catalina in general. You'll need to install the driver and wireless utility that comes with it or dl it from Asus' website and then reboot the computer and it will work. You can even open up the computer and unscrew the 3rd USB port that's seated next to the power port on the computer and then you can just plug the USB module in and push the board back from it's seating slightly then close up the case and then you'll have wifi without that little USB module sticking out of the side of the computer all the time. I did this for a few weeks and it works great.
