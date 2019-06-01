// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)...
//
// Hot Patch | SSDT-HD5500...
//
// This patch sets the proper _DSM information for the IGPU device in laptops with integrated Intel HD Graphics 5500 chips...
// 
// It also enables 2048 MB of Video Memory instead of the standard 1536 MB in real MacBook Pro devices with Intel HD Graphics 5500 chips...
//
// This patch should only be used with systems that have their DVMT Pre Allocated Memory set between 64-128 MB...
//
// If this patch is used on systems with 32 MB of DVMT Pre Allocated Memory it will cause a framebuffer kernel panic...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "HD5500", 0x00002000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)

    Method (_SB.PCI0.IGPU._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
	    Return (Package ()
		{
            "AAPL,GfxYTile", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-unifiedmem", Buffer() { 0x00, 0x00, 0x00, 0x80 },
            "framebuffer-con2-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-portcount", Buffer() { 0x02, 0x00, 0x00, 0x00 },
            "disable-external-gpu", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "device-id", Buffer() { 0x16, 0x16, 0x00, 0x00 },
            "framebuffer-con1-pipe", Buffer() { 0x12, 0x00, 0x00, 0x00 },
            "device_type", Buffer() { "VGA Compatible Controller" },
            "hda-gfx", Buffer() { "onboard-1" },
            "built-in", Buffer() { 0x00 },
            "framebuffer-patch-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-con0-pipe", Buffer() { 0x12, 0x00, 0x00, 0x00 },
            "framebuffer-con1-type", Buffer() { 0x00, 0x08, 0x00, 0x00 },
            "AAPL,slot-name", Buffer() { "Internal" },
            "AAPL,ig-platform-id", Buffer() { 0x06, 0x00, 0x26, 0x16 },
            "framebuffer-con2-index", Buffer() { 0xFF, 0xFF, 0xFF, 0xFF },
            "model", Buffer() { "Intel HD Graphics 5500" },
            "framebuffer-con1-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0xAA, 0x17, 0x00, 0x00 },
            "subsystem-device-id", Buffer() { 0x34, 0x50, 0x00, 0x00 },
            "name", Buffer() { "Retina Display" },
        })
    }
}
    


