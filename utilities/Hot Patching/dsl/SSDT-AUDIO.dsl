// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | Configuration For System Sound Functionality...
//
// Automatic Injection Of HDEF (System) & HDAU (HDMI) Layout Properties (System Audio Functionality) | Only Use Layout 28 | 1C000000 | Also Injects _DSM Info Under System Information...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-AUDI0", 0)
{
    External(_SB.PCI0.HDEF, DeviceObj)
    External(_SB.PCI0.HDAU, DeviceObj)
    External(RMCF.AUDL, IntObj)

    // inject properties for audio
    Method(_SB.PCI0.HDEF._DSM, 4)
    {
        If (CondRefOf(\RMCF.AUDL)) { If (Ones == \RMCF.AUDL) { Return(0) } }
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Local0 = Package()
        {
            "layout-id", Buffer() { 28, 0, 0, 0 },
            "hda-gfx", Buffer() { "onboard-1" },
            "PinConfigurations", Buffer() { },
            "AAPL,slot-name", Buffer() { "Built In" },
            "codec-id", Buffer() { 0x92, 0x02, 0xEC, 0x10 },
            "name", Buffer() { "Realtek ALC3232 High Definition Audio Controller" },
            "model", Buffer() { "Realtek ALC3232 High Definition Audio (Intel Broadwell Wildcat Point-LP HD Audio Controller)" },
            "device_type", Buffer() { "Audio" },
            "device-id", Buffer() { 0x92, 0x02, 0x00, 0x00 },
            "vendor-id", Buffer() { 0xEC, 0x10, 0x00, 0x00 },
            "built-in", Buffer() { 0x00 },
            //"MaximumBootBeepVolume", 77,
        }
        If (CondRefOf(\RMCF.AUDL))
        {
            CreateDWordField(DerefOf(Local0[1]), 0, AUDL)
            AUDL = \RMCF.AUDL
        }
        Return(Local0)
    }
    // inject properties for hdmi audio
    Method(_SB.PCI0.HDAU._DSM, 4)
    {
        If (CondRefOf(\RMCF.AUDL)) { If (Ones == \RMCF.AUDL) { Return(0) } }
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Local0 = Package()
        {
            "layout-id", Buffer() { 28, 0, 0, 0 },
            "hda-gfx", Buffer() { "onboard-1" },
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Intel Broadwell-U HDMI Audio Controller" },
            "model", Buffer() { "Apple High Definition Audio Controller (Intel Broadwell-U HDMI Audio Controller)" },
            "device_type", Buffer() { "Audio" },
            "device-id", Buffer() { 0x0C, 0x16, 0x00, 0x00 },
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "compatible", Buffer() { "pci8086,160c" },
            "built-in", Buffer() { 0x00 },
        }
        If (CondRefOf(\RMCF.AUDL))
        {
            CreateDWordField(DerefOf(Local0[1]), 0, AUDL)
            AUDL = \RMCF.AUDL
        }
        Return(Local0)
    }
}
//EOF