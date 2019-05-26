# Clover File Directory

- I added this folder just for the purpose of allowing you to copy all of the files in the root directory into this folder if you want an easy method for just swapping everything out. Just highlight all of the files in the main directory (except the EFI folder) then you can copy them directly into this folder and swap out the EFI folder in your "/Volumes/ESP/" directory to make things a bit easier for beginners. Some people are confused about where the files in the root directory are supposed to go. 

  * The EFI Folder that holds this folder is supposed to represent the structure of the /Volumes/ESP/EFI folder which is where CLOVER resides.
  
  * The CLOVER and BOOT folders in the EFI folder are the main folders used in running Clover successfully.
  
  * The BOOT folder contains the actual Clover boot-loader.
  
  * If your original EFI folder contains a Linux or Windows boot-loader configuration then copy them as they are into the EFI folder before swapping them out or you wont be able       to boot into either of them any more. 

  * Same goes for the contents of your BOOT folder, copy everything into the BOOT folder in my EFI folder before swapping anything.
