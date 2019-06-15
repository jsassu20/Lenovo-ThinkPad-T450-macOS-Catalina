# Main CLOVER Files Directory

This directory is the main folder which should house all of the files in the main GitHub directory for this project. This folder within the projects folder structure serves no purpose and is only included as a visual aide regarding the proper file tree configuration for the corresponding folder present in your main EFI partition on the drive which contains your macOS installation. Both of the EFI partitions which your files should be copied too will have the same setup files present in the same locations. It works like this:

- Your USB drive with the macOS Mojave installation present should have 2 total partitions:
  
  1. The first partition is the ESP section which should be formatted as a FAT32 based file system (but needs to be an ESP based FAT32 configuration).  
  2. The partition should be between 200MB and 512MB total capacity. It can be more if you do the partitioning manually which I don't advise with beginners.
  3. This partition can be created automatically by 
   

