// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hot Patch | SSDT-HDAU.dsl...
//
// Automatic injection of _SB.PCI0.HDAU (HDMI) layout-id and _DSM info (HDMI audio out functionality)...
//
DefinitionBlock("", "SSDT", 2, "APPLE", "_HDAU", 0)
{
    External(RMCF.AUDL, IntObj) External(RMDA, IntObj) External(RMCF.DAUD, IntObj) External(_SB.PCI0.HDAU, DeviceObj)
    // Inject properties for audio
    Method(_SB.PCI0.HDAU._DSM, 4)
    {
        If (CondRefOf(\RMCF.AUDL)) { If (Ones == \RMCF.AUDL) { Return(0) } }
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Local0 = Package()
        {
            // ALC3232.kext uses the following layout-id settings:
            //"layout-id", Buffer () { 2, 0, 0, 0 },
            // AppleALC.kext uses the following layout-id settings:
            "layout-id", Buffer() { 28, 0, 0, 0 },
            // Enable whichever line for the kext you're useing and disable the other line
            "hda-gfx", Buffer() { "onboard-1" },
            "AAPL,slot-name", Buffer () { "Internal" }, 
            "device-id", Buffer () { 0x0C, 0x16, 0x00, 0x00 },
            "vendor-id", Buffer () { 0x86, 0x80, 0x00, 0x00 }, 
            "device_type", Buffer () { "Audio Device" },
            "model", Buffer () { "Intel Broadwell-U Wildcat Point-LP HDMI Audio Controller" },
            "PinConfigurations", Buffer() { }
        }
        If (CondRefOf(\RMCF.AUDL)) { CreateDWordField(DerefOf(Local0[1]), 0, AUDL) AUDL = \RMCF.AUDL }
        
        // The user can disable "hda-gfx" injection by defining \RMDA or setting RMCF.DAUD=0
        //
        // Assumes that "hda-gfx" is always at index 2 (eg. "hda-gfx" follows ig-platform-id)
        
        Local1 = 0
        If (CondRefOf(\RMDA)) { Local1 = 1 }
        If (CondRefOf(\RMCF.DAUD)) { If (0 == \RMCF.DAUD) { Local1 = 1 } }
        If (Local1) { Local0[2] = "#hda-gfx"; }
        Return(Local0)
    }
}
//EOF
