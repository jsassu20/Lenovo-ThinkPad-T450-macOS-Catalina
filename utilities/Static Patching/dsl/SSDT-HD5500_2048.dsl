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
            "framebuffer-patch-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-con0-pipe", Buffer() { 0x12, 0x00, 0x00, 0x00 },
            "framebuffer-con1-type", Buffer() { 0x00, 0x08, 0x00, 0x00 },
            "AAPL,slot-name", Buffer() { "Internal" },
            "AAPL,ig-platform-id", Buffer() { 0x06, 0x00, 0x26, 0x16 },
            "framebuffer-con2-index", Buffer() { 0xFF, 0xFF, 0xFF, 0xFF },
            "model", Buffer() { "Intel HD Graphics 5500" },
            "framebuffer-con1-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
        })
    }
}
    


