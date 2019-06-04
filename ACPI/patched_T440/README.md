# Patched T440 ACPI Files

Patched .aml configuration files are inserted here and Clover will inject them at boot time in order to modify the ACPI codebase with all changes present in the individual files. 

#

### DSL Folder

- Decompiled Hot Patch files for the Lenovo ThinkPad T440. These files are in a decompiled state and thus can be modified with maciASL without any issues. In order to use the patches you must compile them in .aml format by saving them individually as .aml files in maciASL or using iasl through the terminal to create individual .aml files as well as a single compilation of all desired patches.

#

### AIO Folder

- Contains a single .aml file which is a compilation of all the individual .aml Hot Patches which can be used by itself in place of using the individual Hot Patch files. I go with individual files because you can modify them without the need to compile a new single Hot Patch file configuration whenever you need to change something, but the option is still here.

#

### AML Folder

- Single Hot Patch files used with the Lenovo ThinkPad T440 Hot Patched configuration. These patches come straight from Sniiki's T440s configuration.

#

### Off Folder

- Hot Patches not currently needed or desired.





