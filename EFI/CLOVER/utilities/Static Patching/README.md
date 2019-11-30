# Static Patched Configuration Files

- My T450 Static patch method. This should only be used with T450's and may not work. The SSDTs are universal but you may have to patch your own DSDT to use. You can look over mine for reference. Especially in the battery section.

#

### dsl folder
 
- Collection of dsl files which can be used to add to the StaticPatch method for specific purposes. Make sure you understand whats going on before using them.

#

### off folder

- StaticPatch files that aren't in use.

#

### config.plist

- Configuration file to be used with this configuration.

#

### .aml files

- Each of these files has a particular purpose in the Static Patching method. They are the central files which this method revolves around and their purpose is to make changes to the ASL codebase which controls hardware functionality in the macOS kernel base. The most important being the DSDT.aml. All SSDT files are secondary code injection files which add functionality to the DSDT codebase after booting the computer. 