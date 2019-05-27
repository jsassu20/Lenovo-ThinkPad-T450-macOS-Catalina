// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)...
//
// Clover UEFI Hotpatch | SSDT-GLAN...
//
// This Configuration Injects The Proper _DSM Info For The Ethernet Network Controller...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-GLAN", 0)
{
    External (_SB_.PCI0.GLAN, DeviceObj)    // (from opcode)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.GLAN._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package () {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple Gigabit Ethernet Network Controller" }, 
            "model", Buffer() { "Apple PCI Express Gigabit Ethernet Network Adapter (Intel I218-LM Gigabt Ethernet Adapter | LAN0 | 1000 MB/s)" }, 
            "device_type", Buffer() { "Ethernet Controller" }, 
            "device-id", Buffer() { 0xA2, 0x15, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,15a2" },
            "built-in", Buffer() { 0x01 },
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
//EOF