# One Button MacOS HIDPI

The purpose of this script is to enable the `HiDPI` option for low to medium resolution screens and have a native `HiDPI` setting that can be set in the system monitor settings without the `RDM` software.

The `dpi` mechanism of `MacOS` is not the same as `win`. For example, the `1080p` screen has the scaling options of `125%`, `150%` under `win`, and the same screen is in `MacOS`. Next, the zoom option simply adjusts the resolution, which makes the font and `UI` look small at the default resolution, and the resolution is blurred.

At the same time, this script can also fix the splash screen by injecting the patched `EDID`, or the splash screen after wake-up after sleep. Of course, this fix varies from person to person.

### Info：

![](https://raw.githubusercontent.com/athlonreg/BlogImages/master/Images/2b/78d0d617c5de8c8451351850ce8a49.jpg)

## Instructions

Enter the following command at the terminal to enter:

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/athlonreg/one-key-hidpi/master/hidpi.sh)"
```

![](https://raw.githubusercontent.com/athlonreg/one-key-hidpi/master/docs/example.png)

## Important: 

If you can't enter the system after using this script, please go to the recovery mode and delete the folder corresponding to the display `VendorID` under the terminal delete `/System/Library/Displays/Contents/Resources/Overrides` and put `backup`. The backup in the folder is copied.

The specific commands are as follows:

```
$ cd /Volumes/macOS\ Mojave/System/Library/Displays/Contents/Resources/Overrides
$ VendorID=$(ioreg -l | grep "DisplayVendorID" | awk '{print $8}')
$ Vid=$(echo "obase=16;$VendorID" | bc | tr 'A-Z' 'a-z')
$ rm -rf ./DisplayVendorID-$Vid
$ cp -r ./backup/* ./
```


