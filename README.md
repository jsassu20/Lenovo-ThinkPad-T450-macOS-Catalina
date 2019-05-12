# Lenovo ThinkPad T450 Clover Hackintosh Configuration 



* Intel Broadwell (5th Generation) | macOS Mojave | 10.14.x | Hotpatched | Complete Build (Everything Works)



* This setup should work as both the installer as well as the permanent setup. I've tested it with both. Make sure CSM is enabled
  in BIOS. After installation is complete go into the kext folder and double click the kext install command script and all of the
  required kext files will be automatically installed to /Library/Extensions.



* Hardware Configuration:

  - Intel Core i7-5600U | Broadwell (5th Generation) 
  - Dual Core @ 2.7 GHz (up to 3.7 GHz with Turbo Boost) 
  - Crucial 16GB (2x8) | DDR3 @ 1600 mhz | (Model CT102464BF160B.M16) | Pulled from a 2014 MacBook Pro
  - Intel HD 5500 Graphics | 1536 MB VRAM | Full QE/CI & Metal Support  | HDMI Out @ 3840x2160 Max Resolution
  - LG 1080P Full High Definition IPS Display LP140WF6(SP)(C2) (Replaced stock 1600x900 TN Display)
  - 3 Solid State Drives | 500G Samsung 850 Evo SATA | 1TB Samsung 840 Evo M.2 | 500G Samsung 840 Evo M.2
  - Realtek SDHC | 3x USB 3.1 | HDMI | Intel Gigabit LAN | SIM card  | AUX In/Out | Microphone | HD Webcam 
  - Dual Battery Setup (Hotpatched and fully functioning with accurate percentage reporting)   
  - Synaptic One Button Trackpad from T440s (Replaced 3 button Trackpad for better functionality with macOS)
  - AirPort Extreme AC (1300 MB/s) & Bluetooth 4.0 PCIe (Broadcom BCM94360CSAX) NGFF A/E Adapter Required  



* Fully Functional Hackintosh Configuration | All macOS Mojave Native Features Are Working Beautifully!

  - AppStore Purchases, iMessage, FaceTime, Instant Hotspot, Continuity, Handoff, AirDrop, iTunes Purchases, System Update, Siri, Metal, Sleep, Power         Settings, Backlight Control, Touchpad Gestures (3 and 4 Finger Including Swipes) AirPort Extreme Functionality, Bluetooth, Location Services, iCloud      Features are Fully supported with the proper AirPort card (Find My Mac only works with real card, if you lock the device via iCloud with a PC based       card you're gonna find yourself in a situation you don't want to deal with). This is a 100% working macOS Mojave setup. The only things that aren't       functional are the Dock port and VGA port which are Lenovo options. All Mac features are working properly.



* Required Hardware Changes:

  - For full functionality, you will need to swap out the stock Intel WiFi & BT card with a natively supported AirPort Card. 

  - Wireless Network Card is the only hardware change needed for complete functionality (everything else functions in Mac)

  - The original Intel WiFi & Bluetooth 4.1 Card is not supported in macOS (Bluetooth works) so if you want WiFi you have to replace the internal NGFF        card with one that's supported in macOS Mojave. The chipsets that Mac actually comes with are almost always Broadcom or Atheros based cards. There        are no Intel cards which will function in Mac so don't waste your time trying to get it working. I reccomend purchasing the Apple AirPort Extreme         Broadcom BCM94360CSAX along with an NGFF A/E adapter, I can confirm this card fits and works perfectly in the T450. I paid 30 dollars for the AirPort     Extreme card and 10 dollars for the required adapter and it works without any extra requirements. Its functional during installation and recovery as      well. You can get a card which has a supported chipset like the Dell DW1830 but the PC based cards that function with some added kext files can cause     instability in the system. Using an actual Apple card also allows for proper Handoff, AirDrop, Instant Hotspot, and other Continuity features to          function properly. Ive read a lot of reports of spotty bluetooth connections and sleep and wake issues. Just go for the real AirPort card you'll be       happy you did.


* BIOS Configuration Settings:

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
  
  - My BIOS is unlocked which gives me access to the advanced menu so I could set DVMT to 64MB (128 is fine too). I reccomend unlocking yours as well but     it is not a requirement for functionality of this build. It just gives you more control over the systems configuration.
      

* Information Regarding Similar Hardware:

  - This post contain basically everything necessary to install macOS Mojave on a Lenovo ThinkPad T450 as well as most Broadwell Lenovo Laptops from          2014-2016 with Intel HD5500 Graphics on either the i5 or i7 processors. The only exceptions being those laptops which shipped with dual graphics          configurations like the T450s with the Broadwell based i5 which has on board 5500 graphics but uses the Nvidia Geforce 940m graphics chip as the main     configuration for graphics functions. I'm almost positive that you can switch to the 5500 graphics configuration from the bios since its integrated       in the processor and if that's the case then you should be able to follow this guide as well. I'm sure there are ways to get the Nvidia chip              functioning just fine however I can't guarantee that some part of that chip isn't going to render those machines unable to install Mac for some           reason because I don't have one to test this on but I know computers well enough to be about 75% sure it would be the same steps for the most part        with the added step of finding your own method for enabling video acceleration. If Lenovo di enable the option to switch to the onboard HD5500            graphics then it should function exactly like the setups which this thread would apply to.

  - Lenovo is usually very consistent with the type of hardware present in most models with similar chipsets in a given generation (Broadwell, Haswell,       ETC...) of production Laptops under the "ThinkPad" brand because of its preference among business and education organizations which rely on its           quality and the availability of parts along with the ease of repair. So if your model number is different but the gen, cpu, and graphics match then       you should have no issue with installing this as well on your device and you can use this guide, however I am not responsible for potential damage        to your device because its ultimately your responsibility to compare the hardware you have with my model from a detailed layout of specs.



* Installation of Clover and macOS Mojave Setup:

  - Your computer WILL RESTART at least one time while installing. This is normal! Just boot the installer again and it will finish.
 
  - Use CLOVER Installer in order to setup the needed EFI partition on your USB macOS Installer as well as the permanent EFI partition that will be on        the same Hard Drive where you plan on installing macOS (if there is not already the proper partition present on the device Clover installer will          create it for you). When the process finishes all you have to do is mount the EFI partition of both drives and swap out the CLOVER and BOOT folders       that exist inside of the EFI folder with the ones from my setup. My configuration is a full Hotpatch instead of Static DSDT patching which is more of     a problem in maintaining over time. Hotpatching is much more stable and its also universally supported across the designated hardware it was based        on. You won't have to worry about needing to patch your own DSDT because this method doesn't require you to patch your DSDT file. Clover will patch       it on the fly with this setup. 

          

* Static DSDT Patching:

  
  - If you want to STATIC patch then check out the ACPI/misc directory for my files and the patches you can use. Everything is labeled.

  - Clear out the contents of the /EFI/EFI/CLOVER/APIC/patched & origin folders so that they are empty. Restart the computer and enter the Clover screen      and press F4 then boot normally.

  - Download MaciASL , iasl, and, patchmatic from RehabMans repo and then unzip all 3 files and move iasl and patchmatic files to your home directory,        and put MaciASL in Applications folder and then open terminal and execute the following commands:

     * sudo cp iasl /usr/bin
     * sudo cp patchmatic /usr/bin

  - Delete the two files in your home directory and make a folder on your desktop named DSDT

  - Make a folder on your desktop and copy the files from the /EFI/EFI/CLOVER/APIC/origin folder (the ones that begin with SSDT or DSDT only) into the        folder on your desktop. You can delete the ones which have "x5_2-" in the middle of their name because they aren't needed.

  - Open your terminal to the location of your folder on the desktop that contains those files you copied and enter the following command:

     * iasl -da -dl DSDT.aml SSDT*.aml

  - It will decompile all files from .aml files into .dsl files.... THE ONLY FILE YOU NEED IS DDST.dsl! Remove it from that folder and put it on the          desktop.

  - Double click on your DDST.dsl file and it will open maciASL (maciASL needs to be in Applications).

  - Hit "compile"and if you get any red lines then you need to fix them depending on what your computer is it will be different so you'll have to find        those fixes. Click on each red line from the pop up box and it will show you the line in the DDST.dsl file that needs to be patched in order to use       the file. Yellow warnings are ok to have so don't worry. If you have no errors that's fine and you can still add patches for certain things.
         
  - Whatever patches you want to add are up to you but all you need to do is hit "patch" and then find the corresponding patch in the left hand menu or       enter the contents of a patch you find elsewhere into the right widow on the upper half and then you will see the bar at the bottom indicate changes      that are going to be made from that patch. Hit apply and then you just added a patch. You can continue adding patches to this same file. There are a      few common patches which you should apply from the left hand menu one by one. So you find the patch and then select it from the left side and then        you see the changes on the right side and hit apply then move to the next patch until you've finished. The common patches you should add are (They        will all be in the left side menu and begin with "sys" near the bottom of the list. Apply them one by one)

     * "Fix _WAK Arg0 v2" "HPET Fix"
     * "SMBUS Fix"
     * "IRQ Fix"
     * "RTC Fix"
     * "OS Check Fix"
     * "Fix Mutex with non-zero SyncLevel"

  - When you finish close the patch window but not maciASL yet! Now hit compile again and make sure no red errors show up. Now click "file" and select        "save" now click file again then chose "save as" and name the file DSDT.aml and make sure you chose ACPI Machine Language from the "File Format"          selection box and save it to your desktop. Now take that file and add it into /EFI/EFI/CLOVER/ACPI/patched folder and then you're all set! You just       patched your DSDT and SSDT files. Take the DDST.dsl file on your desktop and put it somewhere safe so that you can easily add more patches down the       road without needing to start all over from the beginning.

  - PAY ATTENTION TO THE .dsl and .asl extension of each file and don't mix them up.



* Miscellaneous information for the whole process


  1. Make sure your bio settings are in order, disable CompuTrace all security chips network booting turn your video men as hit as you can, disable            fingerprint sensor because you won’t need it, to play around with a few other settings to get a successful boot if it doesn't work the beginning.         Also make sure you enable CSM for UEFI booting because that's what you'll be using this is not a Legacy install.


  2. Once you get the USB loaded for install, prepare the drive with disk utility and format it as APFS and then install to that drive. About halfway          through the install the computer is going to restart it may even restart twice, that’s normal the install did not fail are you need to do is instead      of selecting an install Mac OS from install Mac OS you want to select install Mac OS from “whatever you chose the name your drive when you formatted      it”. If it restarts again do the same thing allow to continue.


  3. Once the install finishes go through the setup process take the contents of the install folder which will be just like you used for the USB               installer instead move all those contents to the EFI directory of the Drive that used to install Mac OS on because this will be your permanent            clover set up. Once you do that you should then be able to into Clover every time you start up and then go directly to your macOS. There are ways to      configure it so that you can start directly in the Mac OS but you'll have to figure that out on your own.


  4. If you have an Intel Wi-Fi card (of any kind) it will not work with macOS no matter how much time you invest into searching for a way to make it          work! Don't waste your time! macOS does not support Intel based wifi modules because there are no Mac computers which come with one in them as of         2018. Mac computers almost always come with a Broadcom or Atheros based chipset for the AirPort wireless cards which are present in official Mac          computers. It's possible that there may be Realtek based AirPort cards as well however I am not sure about this. I do know that almost all USB wifi       modules utilize a Realtek based chipset and these are usually compatible with macOS provided you find the right next files and WiFi utility in order      for it to function. If you decide to go with a USB module then keep in mind that you will not get the full functionality you would have with an           official AirPort module such as AirDrop and Location Services. There is currently a project that's being developed to Port some Intel based WiFi          cards to macOS and they've made a great deal of progress however they are still not functional so if you want WiFi then you'll unfortunately need to      buy extra hardware. The LAN Port works fine for internet use and if you're going to get a USB module I suggest using the Asus USB-53 Nano Wireless        A/C dongle Because I know for a fact it works with this build and macOS Mojave in general. You'll need to install the driver and wireless utility         that comes with it or dl it from Asus' website and then reboot the computer and it will work. You can even open up the computer and unscrew the 3rd       USB port that's seated next to the power port on the computer and then you can just plug the USB module in and push the board back from it's seating      slightly then close up the case and then you'll have wifi without that little USB module sticking out of the side of the computer all the time. I         did this for a few weeks and it works great however I paid 3 times as much for the USB dongle as I did for the Dell card which has all the features       and a better connection rate.


  5. If your computer is close enough to mine then there's a chance that everything that's in here will pretty much get you up and running


  6. IF YOU GET STUCK YOU CAN CONTACT ME VIA IMESSAGE: JSASSU20@GMAIL.COM
