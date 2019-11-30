// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-RP0X...
//
// Injects _DSM Information For Root Ports #3 and #6 Into The DSDT | Patched On The Fly... 
// 
// Find Device: _SB.PCI0.EXP1   Rename Device: RP01
// Find Device: _SB.PCI0.EXP2   Rename Device: RP02
// Find Device: _SB.PCI0.EXP3   Rename Device: RP03
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-RP0X", 0)
{
    External (_SB.PCI0.RP01, DeviceObj)
    External (_SB.PCI0.RP02, DeviceObj)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.RP01._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x1B) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple PCI Express Root Port #3" }, 
            "model", Buffer() { "Apple PCI Express Root Port #3 (Intel Broadwell Wildcat Point-LP PCIe Root Port #3)" },
            "device_type", Buffer() { "PCI Bridge" }, 
            "device-id", Buffer() { 0x9A, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9c9a" },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
    Method (_SB.PCI0.RP02._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x1B) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple PCI Express Root Port #6" }, 
            "model", Buffer() { "Apple PCI Express Root Port #6 (Intel Broadwell Wildcat Point-LP PCIe Root Port #6)" }, 
            "device_type", Buffer() { "PCI Bridge" }, 
            "device-id", Buffer() { 0x94, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9c94" },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
//EOF