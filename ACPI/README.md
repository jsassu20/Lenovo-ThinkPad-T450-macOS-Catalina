# Clove ACPI Configuration Folder

This folder will contain the stock Advanced Configuration and Power Interface files related to the system. It houses both the stock ACPI files as well as any modified files you might want to add in order to make changes to the ACPI codebase which fixes certain aspects of your systems overall stability and functionality.

#

### origin

- Contains the stock ACPI codebase which can be pulled from the BIOS directly by pressing F4 at the Clover boot screen. These files can help you produce a fully Static Patched configuration by taking the stock files and directly modifying them in order to achieve a specific function or fix to the macOS system functionality.

#

### patched

- Contains the modified ACPI configuration. Whether its Hot Patched or Static Patched the modified .aml files needed to make the system run properly just as any normal Mac would are required to be kept here so that Clover can inject them into the ACPI configuration during boot and apply the desired changes you are trying to make with each file you place in here.



