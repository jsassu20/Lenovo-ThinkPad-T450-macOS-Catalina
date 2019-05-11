// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)
//
// Clover UEFI Hotpatch | Returns XOSI MethodObj Is Called By ACPI...
//
// Voids _OSI MethodObj And Replaces It With XOSI For Returning "Darwin" During OS Probing And Instead Returns "Windows" As The OS In Use | More Stable With ACPI Patching Done By Clover...
//
// Requires Clover Configurator ACPI/Patch "change _OSI to XOSI" In Order To Work...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-XOSI", 0)
{
    Method(XOSI, 1)
    {
        Local0 = Package()
        {
            "Windows",              // generic Windows query
            //"Windows 2001",       // Windows XP
            "Windows 2001 SP2",     // Windows XP SP2
            //"Windows 2001.1",     // Windows Server 2003
            "Windows 2001.1 SP1", // Windows Server 2003 SP1
            //"Windows 2006",       // Windows Vista
            "Windows 2006 SP1",   // Windows Vista SP1
            "Windows 2006.1",     // Windows Server 2008
            "Windows 2009",         // Windows 7/Windows Server 2008 R2
            "Windows 2012",         // Windows 8/Windows Server 2012
            "Windows 2013",         // Windows 8.1/Windows Server 2012 R2
            "Windows 2015",         // Windows 10/Windows Server TP
        }
        Return (Ones != Match(Local0, MEQ, Arg0, MTR, 0, 0))
    }
}
//EOF