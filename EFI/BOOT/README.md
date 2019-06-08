# Boot-loader Directory 

This directory houses the systems UEFI bootloader binaries. The bootloader is a program that loads at the beginning when the system powers up and it allows you to load an operating system which allows for a far greater capacity of functionality. For instances WIN64.efi binary is an example of a boot binary which would reside in so part of this directory if Windows were installed and it would be required in order to be able to successfully load up the Windows operating system unless some other binary was present which could handle that requirement. This directory can contain any number of binaries which could load up any number of operating systems which could potentially be installed on the system. If you were dual or triple booting you would most likely have a bootloader present for each OS thats been installed however the best thing to do would be to utilize only one single bootloader in order to handle the loading process of each OS you intend on using. 

Keep the following things in mind with regard to installing Windows and Linux systems:

- Only one binary is required in order to load an operating system so long as its capable of loading the OS you want.
- There can be multiple bootloader binaries present in this directory.
- An OS will almost always install its default bootloader in this folder (usually in its own folder).
- The last OS you've installed is probably going to be the default bootloader on startup.
- Most modern bootloader are capable of loading more OS images than just the one is meant to load by default.
- There can be multiple bootloaders in this folder without any issues being a risk for loading any installed operating systems.
- If you plan on dual booting with Windows then your best bet is to install it first if you're partitioning a single drive into multiple volumes where each OS will reside.
- Windows bootloader is capable of booting other OS images if present but its poorly written and should be avoided as the default option for all OS installs.
- Windows creates extra partitions automatically during its install process and this can corrupt the volume layout of other OS images which is a pain to fix.
- This problem can be avoided by wiping your main drive completely and starting with Windows as the first OS you install (if you want to dual boot).
- It can also be avoided by keeping a Widows system on its own physical storage drive if you have more than one SSD/HDD available.
- macOS and Linux installs will only occupy the partitions you select as their intended installation path.
- Install Windows to a fully formatted disk and then use the partition manager in Win to shrink the drive which frees up space to install the next OS you want.
- You can shrink your allocated space in Windows more than once which will create as many extra partitions where other systems can be installed if you only have one storage device. 

The following applies only macOS systems and Clover Bootloader:

- On any device other than official Apple hardware a special bootloader is required in order to be able to successfully load the installer and the finished installation.
- The reason is because macOS requires the detection of specific code in the form of firmware that resides on physical hardware present in genuine Apple computers.
- Traditional bootloaders on PC hardware lack the ability to boot macOS because PCs do not contain the hardware with the code that macOS needs to initiate the boot process.
- Apple designed macOS to require this specific code in order to prevent macOS from running on anything other than there own personal hardware.
- macOS is a UNIX based OS and UNIX has been supported on PC hardware since before Apple built their OS on top of the UNIX core in the late 70's.
- Apple could easily allow macOS to officially support PC hardware as an option to install and us macOS as opposed to only across their own desired hardware.
- The reason they do not is because PC hardware is always improving and this creates access to better and better hardware for less and less money as new hardware always evolves.
- Apple wants consumers to believe only Mac computers can handle macOS. Intel architecture is the lifeblood of macOS and thus its all thats actually required to run macOS. 
- Intel processors are not unique to Mac computers. They are available in unlimited configurations as PC hardware and can run the same code as Mac computers, including macOS.
- The absence of hardware in PC's known as SMC chips is whats really preventing macOS from being able to install on PCs like Windows and Linux system are able to do by default.
- The way to get around this issue is by using a special bootloader which has the ability to mimic the appearance of official Apple hardware and can initiate macOS install on PC.
- Clover is one of a number of bootloaders capable of fooling security checks built into macOS to prevent it from loading on unauthorized hardware.

Instead of dual booting, I instead opt for what I believe is a better method of being able to run multiple OS systems on my ThinPad. The only bootloader that I have in this folder is ClOVERx64.efi which you can copy from the main GitHub directory for this project and paste directly into the /ESP/EFI/BOOT folder (which this folder is supposed to represent). Rename the copied file from CLOVERX64.efi to BOOTX64.efi. Then just ensure that the entire archive of my files for this project are copied directly into the /ESP/EFI/CLOVER folder on your main drive and USB installer. This will allow the ability to successfully load macOS on PC hardware. This is the only OS I run on my ThinkPad and when I need to run Windows or Linux I run it from within VMWare Fusion on my Hackintosh and it works perfectly.    
   

