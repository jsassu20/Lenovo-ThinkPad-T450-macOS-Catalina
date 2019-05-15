// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)...
//
// Clover UEFI Hotpatch | SSDT-IGPU...
//
// This Configuration Injects The Proper _DSM Info For The IGPU Controller | Enables Proper Graphics Functionality Along With Full Graphics Accelleration Activation...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-IGPU", 0x00020000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.IGPU._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x15) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "AAPL,ig-platform-id", Buffer() { 0x06, 0x00, 0x26, 0x16 },
            "name", Buffer() { "Intel Brodwell HD Graphics 5500" }, 
            "model", Buffer() { "Intel HD Graphics 5500" }, 
            "device_type", Buffer() { "Graphics" }, 
            "device-id", Buffer() { 0x16, 0x16, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,1616" },
            "hda-gfx", Buffer() { "onboard-1" },
            "built-in", Buffer() { 0x00 },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
//EOF