// Clover UEFI Hotpatch | Fake Ambient Sensor | Lenovo ThinkPad T450 Ultrabook | Hackintosh (macOS Mojave) | Compiled By: Sass86oh |

// This Configuration Adds The Missing DSDT DeviceObj ALS0 | Hardware Entry For The Ambient Light Sensors To Be Able To Function Properly |
// Fixes Issues With System Functions Like Sleep/Wake | As Well As Screen Brightness |
//
//DefinitionBlock("", "SSDT", 2, "T450 ", "FALS", 0)
//{
    Device(_SB.ALS0)
    {
        Name(_HID, "ACPI0008")
        Name(_CID, "smc-als")
        Name(_ALI, 300)
        Name(_ALR, Package()
        {
            //Package() { 70, 0 },
            //Package() { 73, 10 },
            //Package() { 85, 80 },
            Package() { 100, 300 },
            //Package() { 150, 1000 },
        })
    }
//}
//EOF