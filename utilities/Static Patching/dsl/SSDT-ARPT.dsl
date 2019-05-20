// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)...
//
// Clover UEFI Hotpatch | SSDT-ARPT...
//
// Rename Devices Using Clover Configurator | Apple Airport Extreme 802.11 a/b/g/n/ac WiFi Configuration (Broadcom BCM94360CSAX Gigabit WLAN 3x3 MIMO) PCIe Device Information-
// Also Defines LAN0 & SDXC System Devices...
//
// Find Device: _SB.PCI0.EXP1   Rename Device: RP01
// Find Device: _SB.PCI0.EXP2   Rename Device: RP02
// Find Device: _SB.PCI0.EXP3   Rename Device: RP03
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-ARPT", 0)
{
    External (_SB_.PCI0.RP01.SDXC, DeviceObj)
    External (_SB_.PCI0.RP02.ARPT, DeviceObj)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.RP01.SDXC._DSM, 4, NotSerialized)
    {
        Store (Package (0x0F) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple Internal SDXC Memory Card Reader" }, 
            "model", Buffer() { "Apple Internal SDXC Card Reader (Realtek Semiconductor Corporation PCI Express SDHC Card Reader)" }, 
            "device_type", Buffer() { "Card Reader" }, 
            "device-id", Buffer() { 0x27, 0x52, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0xEC, 0x10, 0x00, 0x00 },  
            "compatible", Buffer() { "pci10ec,5227" }
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
        
    }
    Method (_SB.PCI0.RP02.ARPT._DSM, 4, NotSerialized)
    {
        Store (Package (0x0F) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "AirPort Extreme Wireless Network Adapter" }, 
            "model", Buffer() { "AirPort Extreme Wireless Network Adapter (Broadcom BCM4360 802.11ac Gigabit WiFi Adapter| MIMO 3x3 | 1300 MB/s)" }, 
            "device_type", Buffer() { "Network Controller" }, 
            "device-id", Buffer() { 0xA0, 0x43, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0xE4, 0x14, 0x00, 0x00 },  
            "compatible", Buffer() { "pci14e4,43a0" }
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
     }        
}
//EOF
