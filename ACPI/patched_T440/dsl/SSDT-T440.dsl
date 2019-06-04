// Lenovo ThinkPad T440 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-T440...
//
// for testing including all SSDTs with NO_DEFINITIONBLOCK
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-T440", 0)
{
    #define NO_DEFINITIONBLOCK
    #include "SSDT-XOSI.dsl"
    #include "SSDT-RMCF.dsl"
    #include "SSDT-BAT.dsl"
    #include "SSDT-KBD.dsl"
    #include "SSDT-IMEI.dsl"
    #include "SSDT-PNLF.dsl"
    #include "SSDT-ALS0.dsl"
    #include "SSDT-DEH01.dsl"
    #include "SSDT-USB.dsl"
    #include "SSDT-HDEF.dsl"
    #include "SSDT-HDAU.dsl"
    #include "SSDT-ALC3232.dsl"
}
//EOF
