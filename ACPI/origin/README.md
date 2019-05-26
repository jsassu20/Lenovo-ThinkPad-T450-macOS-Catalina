# Original ACPI Tables

Original system .aml configuration for this specific device. If you're Static Patching your system these files will be the ones you'll need to focus on. 

#

- The most important files are all of the ones which start with "SSDT" as well as the actual "DSDT.aml" file. These are the files which need to be directly patched using maciASL and the community patches for your specific hardware. After you finish patching a file place it inside of the "/Volumes/ESP/EFI/CLOVER/ACPI/patched" folder to have it replace the stock untouched file its based on.



