// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-ALSO...
//
// This Configuration Injects The ALS0 Controller | Ambient light sensor...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-ALS0", 0)
{
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
}
//EOF