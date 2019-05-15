// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | AppleHDA Custom Configuration For Enabling System Sound...
//
// Must Use AlcPlugFix To Have All Inputs & Outputs Functioning | Wake & Sleep Fix | Solves Internal Microphone Issues...
//
// Realtek ALC3232 Codec Configuration | Patched AppleHDA Configuration | Install ALC3232.kext In BOTH /Library/Extensions & /EFI/CLOVER/other/kexts... 
//
// |***ALC3232 REPLACES APPLEALC EXTENSION FOR SYSTEM SOUND FUNCTIONALITY***| This Along With ALC3232.kext Is A Patched AppleHDA.kext Method For Proper Sound And Mic Setup... 
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-ALC3", 0)
{
    External(_SB.PCI0.HDEF, DeviceObj)
    Name(_SB.PCI0.HDEF.RMCF, Package()
    {
        "CodecCommander", Package()
        {
            "Custom Commands", Package()
            {
                Package(){}, // signifies Array instead of Dictionary
                Package()
                {
                    // 0x15 SET_UNSOLICITED_ENABLE 0x83
                    "Command", Buffer() { 0x01, 0x57, 0x08, 0x83 },
                    "On Init", ">y",
                    "On Sleep", ">n",
                    "On Wake", ">y",
                },
                Package()
                {
                    // 0x1a SET_PIN_WIDGET_CONTROL 0x24
                    // Node 0x1a - Pin Control (In Enable / VRefEn)
                    "Command", Buffer() { 0x01, 0xa7, 0x07, 0x24 },
                    "On Init", ">y",
                    "On Sleep", ">n",
                    "On Wake", ">y",
                },
            },
            "Perform Reset", ">y",
            "Send Delay", 10,
            "Sleep Nodes", ">n",
        },
    })
}
//EOF
