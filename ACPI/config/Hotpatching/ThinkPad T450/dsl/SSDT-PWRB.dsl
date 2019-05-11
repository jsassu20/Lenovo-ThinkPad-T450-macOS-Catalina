DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-PWRB", 0x00000000)
{
    External (_SB.PWRB, DeviceObj)
    
    Device (_SB.PWRB)
    {
        Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
    }
}

