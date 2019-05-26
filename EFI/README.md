# EFI Folder Setup

- This folder represents the required configuration for booting Clover and successfully running macOS on PC hardware. This folder is the folder that should be present in you "/Volumes/ESP/" partition which is where all of your UEFI based boot configurations reside. You can use this folder to better understand how to setup Clover the correct way and understand the file structure of your bootloaders in general.

  * The CLOVER and BOOT folders are required for running Clover and booting macOS.
  
  * The CLOVER folder should contain all of the files present in the main GitHub directory for this project. All files in the main GitHub directory for this project except for         except the EFI folder should be present in the identical CLOVER folder in your "/Volumes/ESP/EFI" directory.
  
  * The clover bootloader is named "BOOTx64.efi" and it belongs in the "BOOT" folder in order for Clover to load up at the start of your machine in order to run macOS.
  
  * You do not need to use this folder for anything its just meant to give you an idea of what files belong where.