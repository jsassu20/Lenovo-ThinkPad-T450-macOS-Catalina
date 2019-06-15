// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-BATT...
//
// This Configuration Will Combine BAT1 and BAT2 Into BATC Which Allows For Proper Battery Functionality And Capacity Reporting...
//
// Requires RehabMan's ACPIBatteryManager.kext or SMCBatteryManager.kext (VirtualSMC Plugin) To Be Installed For Proper Functionality...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-BATT", 0)
{
    External(_SB.PCI0.LPC.EC, DeviceObj)
    External(BATM, MutexObj)
    External(HIID, FieldUnitObj)
    External(SPS, FieldUnitObj)
    External(WAKI, DeviceObj)
    External(UCMS, MethodObj)
    External(LIDB, FieldUnitObj)
    External(FNID, FieldUnitObj)
    External(NVSS, MethodObj)
    External(PWRS, FieldUnitObj)
    External(OSC4, FieldUnitObj)
    External(PNTF, MethodObj)
    External(ACST, FieldUnitObj)
    External(SCRM, FieldUnitObj)
    External(MTAU, FieldUnitObj)
    External(PL1L, FieldUnitObj)
    External(PL1M, FieldUnitObj)
    External(IOEN, FieldUnitObj)
    External(IOST, FieldUnitObj)
    External(VIGD, FieldUnitObj)
    External(WVIS, FieldUnitObj)
    External(VBTD, MethodObj)
    External(VCMS, MethodObj)
    External(AWON, MethodObj)
    External(RRBF, FieldUnitObj)
    External(CHKE, FieldUnitObj)
    External(CHKC, FieldUnitObj)
    External(CSUM, MethodObj)
    External(VSLD, MethodObj)
    External(XHC, FieldUnitObj)
    External(ISWK, FieldUnitObj)
    External(BRLV, FieldUnitObj)
    External(VBRC, MethodObj)
    External(NBCF, FieldUnitObj)
    External(ISCT, FieldUnitObj)
    External(USBR, FieldUnitObj)
    External(CMPR, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.LED, MethodObj)
    External(_SB.PCI0.LPC.EC.HCMU, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PIBS, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLSL, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLTU, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLLS, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLMS, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.SKEM, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HSPA, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HWAC, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.BWAK, MethodObj)
    External(_SB.PCI0.LPC.EC.BATW, MethodObj)
    External(_SB.PCI0.LPC.EC.BRNS, MethodObj)
    External(_SB.PCI0.LPC.EC.EVNT, MethodObj)
    External(_SB.PCI0.LPC.EC.FNST, MethodObj)
    External(_SB.PCI0.LPC.EC.HFNI, MethodObj)
    External(_SB.PCI0.LPC.EC.ATMC, MethodObj)
    External(_SB.PCI0.LPC.EC.HFSP, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HKEY.MHKE, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.MHKQ, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.WGWK, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.DHKC, MethodObj)
    External(_SB.PCI0.LPC.EC.AC._PSR, MethodObj)
    External(_SB.PCI0.IGPU.GLIS, MethodObj)
    External(_SB.PCI0.IGPU.TCHE, MethodObj)
    External(_SB.PCI0.IGPU.STAT, FieldUnitObj)
    External(_SB.PCI0.IGPU.VRSI, MethodObj)
    External(_SB.LID, DeviceObj)
    External(_SB.LID._LID, MethodObj)
    External(_SB.SLPB, DeviceObj)
    External(_TZ.THM0, ThermalZoneObj)
    External(_SB.IAOE.GAOS, MethodObj)
    External(_SB.IAOE.GSWR, MethodObj)
    External(_SB.PCI0.XHC.XRST, FieldUnitObj)
    External(_SB.PCI0.XHC.PR3, FieldUnitObj)
    External(_SB.PCI0.XHC.PR3M, FieldUnitObj)
    External(_SB.PCI0.XHC.PR2, FieldUnitObj)
    External(_SB.PCI0.XHC.PR2M, FieldUnitObj)
    External(_SB.PCI0.EXP6, DeviceObj)
    External(_SB.PCI0.LPC.EC.TMP0, FieldUnitObj)
    External(ZPTS, MethodObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    
    Scope (_SB.PCI0.LPC.EC)
    {
        External(BAT0, DeviceObj)
        External(BAT0._HID, IntObj)
        External(BAT0._STA, MethodObj)
        External(BAT0._BIF, MethodObj)
        External(BAT0._BST, MethodObj)
        External(BAT1, DeviceObj)
        External(BAT1._HID, IntObj)
        External(BAT1._STA, MethodObj)
        External(BAT1._BIF, MethodObj)
        External(BAT1._BST, MethodObj)
        
        Device(BATC)
        {
            Name(_HID, EisaId ("PNP0C0A"))
            Name(_UID, 0x02)

            Method(_INI)
            {
                // disable original battery objects by setting invalid _HID
                ^^BAT0._HID = 0
                ^^BAT1._HID = 0
            }

            Method(CVWA, 3)
            // Convert mW to mA (or mWh to mAh)
            // Arg0 is mW or mWh (or mA/mAh in the case Arg2==0)
            // Arg1 is mV (usually design voltage)
            // Arg2 is whether conversion is needed (non-zero for convert)
            // return is mA or mAh
            {
                If (Arg2)
                {
                    Arg0 = (Arg0 * 1000) / Arg1
                }
                Return(Arg0)
            }

            Method(_STA)
            {
                // call original _STA for BAT0 and BAT1
                // result is bitwise OR between them
                Return(^^BAT0._STA() | ^^BAT1._STA())
            }

            Name(B0CO, 0x00) // BAT0 0/1 needs conversion to mAh
            Name(B1CO, 0x00) // BAT1 0/1 needs conversion to mAh
            Name(B0DV, 0x00) // BAT0 design voltage
            Name(B1DV, 0x00) // BAT1 design voltage

            Method(_BST)
            {
                // Local0 BAT0._BST
                // Local1 BAT1._BST
                // Local2 BAT0._STA
                // Local3 BAT1._STA
                // Local4/Local5 scratch

                // gather battery data from BAT0
                Local0 = ^^BAT0._BST()
                Local2 = ^^BAT0._STA()
                If (0x1f == Local2)
                {
                    // check for invalid remaining capacity
                    Local4 = DerefOf(Local0[2])
                    If (!Local4 || Ones == Local4) { Local2 = 0; }
                }
                // gather battery data from BAT1
                Local1 = ^^BAT1._BST()
                Local3 = ^^BAT1._STA()
                If (0x1f == Local3)
                {
                    // check for invalid remaining capacity
                    Local4 = DerefOf(Local1[2])
                    If (!Local4 || Ones == Local4) { Local3 = 0; }
                }
                // find primary and secondary battery
                If (0x1f != Local2 && 0x1f == Local3)
                {
                    // make primary use BAT1 data
                    Local0 = Local1 // BAT1._BST result
                    Local2 = Local3 // BAT1._STA result
                    Local3 = 0  // no secondary battery
                }
                // combine batteries into Local0 result if possible
                If (0x1f == Local2 && 0x1f == Local3)
                {
                    // _BST 0 - Battery State - if one battery is charging, then charging, else discharging
                    Local4 = DerefOf(Local0[0])
                    Local5 = DerefOf(Local1[0])
                    If (Local4 == 2 || Local5 == 2)
                    {
                        // 2 = charging
                        Local0[0] = 2
                    }
                    ElseIf (Local4 == 1 || Local5 == 1)
                    {
                        // 1 = discharging
                        Local0[0] = 1
                    }
                    ElseIf (Local4 == 5 || Local5 == 5)
                    {
                        // critical and discharging
                        Local0[0] = 5
                    }
                    ElseIf (Local4 == 4 || Local5 == 4)
                    {
                        // critical
                        Local0[0] = 4
                    }
                    // if none of the above, just leave as BAT0 is

                    // Note: Following code depends on _BIF being called before _BST to set B0CO and B1CO

                    // _BST 1 - Battery Present Rate - Add BAT0 and BAT1 values
                    Local0[1] = CVWA(DerefOf(Local0[1]), B0DV, B0CO) + CVWA(DerefOf(Local1[1]), B1DV, B1CO)
                    // _BST 2 - Battery Remaining Capacity - Add BAT0 and BAT1 values
                    Local0[2] = CVWA(DerefOf(Local0[2]), B0DV, B0CO) + CVWA(DerefOf(Local1[2]), B1DV, B1CO)
                    // _BST 3 - Battery Present Voltage - Average BAT0 and BAT1 values
                    Local0[3] = (DerefOf(Local0[3]) + DerefOf(Local1[3])) / 2
                }
                Return(Local0)
            } // _BST

            Method(_BIF)
            {
                // Local0 BAT0._BIF
                // Local1 BAT1._BIF
                // Local2 BAT0._STA
                // Local3 BAT1._STA
                // Local4/Local5 scratch

                // gather and validate data from BAT0
                Local0 = ^^BAT0._BIF()
                Local2 = ^^BAT0._STA()
                If (0x1f == Local2)
                {
                    // check for invalid design capacity
                    Local4 = DerefOf(Local0[1])
                    If (!Local4 || Ones == Local4) { Local2 = 0; }
                    // check for invalid max capacity
                    Local4 = DerefOf(Local0[2])
                    If (!Local4 || Ones == Local4) { Local2 = 0; }
                    // check for invalid design voltage
                    Local4 = DerefOf(Local0[4])
                    If (!Local4 || Ones == Local4) { Local2 = 0; }
                }
                // gather and validate data from BAT1
                Local1 = ^^BAT1._BIF()
                Local3 = ^^BAT1._STA()
                If (0x1f == Local3)
                {
                    // check for invalid design capacity
                    Local4 = DerefOf(Local1[1])
                    If (!Local4 || Ones == Local4) { Local3 = 0; }
                    // check for invalid max capacity
                    Local4 = DerefOf(Local1[2])
                    If (!Local4 || Ones == Local4) { Local3 = 0; }
                    // check for invalid design voltage
                    Local4 = DerefOf(Local1[4])
                    If (!Local4 || Ones == Local4) { Local3 = 0; }
                }
                // find primary and secondary battery
                If (0x1f != Local2 && 0x1f == Local3)
                {
                    // make primary use BAT1 data
                    Local0 = Local1 // BAT1._BIF result
                    Local2 = Local3 // BAT1._STA result
                    Local3 = 0  // no secondary battery
                }
                // combine batteries into Local0 result if possible
                If (0x1f == Local2 && 0x1f == Local3)
                {
                    // _BIF 0 - Power Unit - 0 = mWh | 1 = mAh
                    // set B0CO/B1CO if convertion to amps needed
                    B0CO = !DerefOf(Local0[0])
                    B1CO = !DerefOf(Local1[0])
                    // set _BIF[0] = 1 => mAh
                    Local0[0] = 1
                    // _BIF 4 - Design Voltage - store value for each Battery in mV
                    B0DV = DerefOf(Local0[4]) // cache BAT0 voltage
                    B1DV = DerefOf(Local1[4]) // cache BAT1 voltage
                    // _BIF 1 - Design Capacity - add BAT0 and BAT1 values
                    Local0[1] = CVWA(DerefOf(Local0[1]), B0DV, B0CO) + CVWA(DerefOf(Local1[1]), B1DV, B1CO)
                    // _BIF 2 - Last Full Charge Capacity - add BAT0 and BAT1 values
                    Local0[2] = CVWA(DerefOf(Local0[2]), B0DV, B0CO) + CVWA(DerefOf(Local1[2]), B1DV, B1CO)
                    // _BIF 3 - Battery Technology - leave BAT0 value
                    // _BIF 4 - Design Voltage - average BAT0 and BAT1 values
                    Local0[4] = (B0DV + B1DV) / 2
                    // _BIF 5 - Design Capacity Warning - add BAT0 and BAT1 values
                    Local0[5] = CVWA(DerefOf(Local0[5]), B0DV, B0CO) + CVWA(DerefOf(Local1[5]), B1DV, B1CO)
                    // _BIF 6 - Design Capacity of Low - add BAT0 and BAT1 values
                    Local0[6] = CVWA(DerefOf(Local0[6]), B0DV, B0CO) + CVWA(DerefOf(Local1[6]), B1DV, B1CO)
                    // _BIF 7+ - Leave BAT0 values for now
                }
                Return(Local0)
            } // _BIF
        } // BATC
        
        OperationRegion (ECR1, EmbeddedControl, 0x00, 0x0100)
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36),
            WAC0, 8,WAC1, 8,
            //Offset (0x4C)
            //HTMH, 8, (0x4C)
            //HTML, 8, (0x4D)
            Offset (0x4E),
            WAK0, 8,WAK1, 8,
            //Others in order.
            Offset (0x84),
            SPD0, 8,SPD1, 8,
        }
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0),             BRC0, 8,BRC1, 8,            BFC0, 8,BFC1, 8,            //SBAE,   16,            //SBRS,   16,
            Offset (0xA8),            BAC0, 8,BAC1, 8,            BVO0, 8,BVO1, 8,
        }
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0),             BBM0, 8,BBM1, 8,             //SBMD,   16,
            Offset (0xA4),            BCC0, 8,BCC1, 8,
        }
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0),             BDC0, 8,BDC1, 8,             BDV0, 8,BDV1, 8,             //SBOM,   16,             //SBSI,   16,             //SBDT,   16,
            Offset (0xAA),            BSN0, 8,BSN1, 8,
        }
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0),             BCH0, 8,BCH1, 8,BCH2, 8,BCH3, 8,
    }
        
    Method (GBIF, 3, NotSerialized)
    {
        Acquire (BATM, 0xFFFF)
        If (Arg2)
        {
            Or (Arg0, 0x01, HIID)
            Store (B1B2(BBM0,BBM1), Local7)
            ShiftRight (Local7, 0x0F, Local7)
            XOr (Local7, 0x01, Index (Arg1, 0x00))
            Store (Arg0, HIID)
            If (Local7)
            {
                Multiply (B1B2 (BFC0, BFC1), 0x0A, Local1)
            }
            Else
            {
                Store (B1B2 (BFC0, BFC1), Local1)
            }

            Store (Local1, Index (Arg1, 0x02))
            Or (Arg0, 0x02, HIID)
            If (Local7)
            {
            Multiply (B1B2 (BDC0, BDC1), 0x0A, Local0)
            }
            Else
            {
                Store (B1B2 (BDC0, BDC1), Local0)
            }

            Store (Local0, Index (Arg1, 0x01))
            Divide (Local1, 0x14, Local2, Index (Arg1, 0x05))
            If (Local7)
            {
                Store (0xC8, Index (Arg1, 0x06))
            }
            ElseIf (B1B2 (BDV0, BDV1))
            {
                Divide (0x00030D40,B1B2(BDV0, BDV1), Local2, Index (Arg1, 0x06))
            }
            Else
            {
                Store (0x00, Index (Arg1, 0x06))
            }

            Store (B1B2 (BDV0, BDV1), Index (Arg1, 0x04))
            Store (B1B2 (BSN0, BSN1), Local0)
            Name (SERN, Buffer (0x06)
            {
                "     "
            })
            Store (0x04, Local2)
            While (Local0)
            {
                Divide (Local0, 0x0A, Local1, Local0)
                Add (Local1, 0x30, Index (SERN, Local2))
                Decrement (Local2)
            }
            Store (SERN, Index (Arg1, 0x0A))
            Or (Arg0, 0x06, HIID)
            Store (RECB(0xA0,128), Index (Arg1, 0x09))
            Or (Arg0, 0x04, HIID)
            Name (BTYP, Buffer (0x05)
            {
                0x00, 0x00, 0x00, 0x00, 0x00                   
        })
        Store (B1B4(BCH0,BCH1,BCH2,BCH3), BTYP)
        Store (BTYP, Index (Arg1, 0x0B))
        Or (Arg0, 0x05, HIID)
        Store (RECB(0xA0,128), Index (Arg1, 0x0C))
        }
        Else
        {
            Store (0xFFFFFFFF, Index (Arg1, 0x01))
            Store (0x00, Index (Arg1, 0x05))
            Store (0x00, Index (Arg1, 0x06))
            Store (0xFFFFFFFF, Index (Arg1, 0x02))
        }

        Release (BATM)
        Return (Arg1)
    }

    Method (GBST, 4, NotSerialized)
    {
        Acquire (BATM, 0xFFFF)
        If (And (Arg1, 0x20))
        {
            Store (0x02, Local0)
        }
        ElseIf (And (Arg1, 0x40))
        {
            Store (0x01, Local0)
        }
        Else
        {
            Store (0x00, Local0)
        }

        If (And (Arg1, 0x07)) {}
        Else
        {
            Or (Local0, 0x04, Local0)
        }

        If (LEqual (And (Arg1, 0x07), 0x07))
        {
            Store (0x04, Local0)
            Store (0x00, Local1)
            Store (0x00, Local2)
            Store (0x00, Local3)
        }
        Else
        {
            Store (Arg0, HIID)
            Store (B1B2 (BVO0, BVO1), Local3)
            If (Arg2)
            {
                Multiply (B1B2 (BRC0, BRC1), 0x0A, Local2)
        }
        Else
        {
            Store (B1B2 (BRC0, BRC1), Local2)
        }

        Store (B1B2 (BAC0, BAC1), Local1)
        If (LGreaterEqual (Local1, 0x8000))
        {
            If (And (Local0, 0x01))
            {
                Subtract (0x00010000, Local1, Local1)
            }
            Else
            {
                Store (0x00, Local1)
            }
        }
        ElseIf (LNot (And (Local0, 0x02)))
        {
            Store (0x00, Local1)
        }

        If (Arg2)
        {
            Multiply (Local3, Local1, Local1)
            Divide (Local1, 0x03E8, Local7, Local1)
            }
        }

       Store (Local0, Index (Arg3, 0x00))
       Store (Local1, Index (Arg3, 0x01))
       Store (Local2, Index (Arg3, 0x02))
       Store (Local3, Index (Arg3, 0x03))
       Release (BATM)
       Return (Arg3)
    }
                    
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            // fix "auto start after shutdown if a USB Device is Plugged In"
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
    
    Method (\_WAK, 1, NotSerialized)
    {     
        Store (0x00, \SPS)
        Store (0x00, \_SB.PCI0.LPC.EC.HCMU)
        \_SB.PCI0.LPC.EC.EVNT (0x01)
        \_SB.PCI0.LPC.EC.HKEY.MHKE (0x01)
        \_SB.PCI0.LPC.EC.FNST ()
        \UCMS (0x0D)
        Store (0x00, \LIDB)
        \_SB.PCI0.IGPU.VRSI ()
        If (LEqual (Arg0, 0x01))
        {
            Store (\_SB.PCI0.LPC.EC.HFNI, \FNID)
        }

        If (LEqual (Arg0, 0x03))
        {
            \NVSS (0x00)
            External(\_SI._SST, MethodObj)
            \_SI._SST(1) // fixes power LED blinking after wake
            Store (\_SB.PCI0.LPC.EC.AC._PSR (), \PWRS)
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            If (LNotEqual (\ACST, \_SB.PCI0.LPC.EC.AC._PSR ()))
            {
                \_SB.PCI0.LPC.EC.ATMC ()
            }

            If (\SCRM)
            {
                Store (0x07, \_SB.PCI0.LPC.EC.HFSP)
                If (\MTAU)
                {
                    Store (0x03E8, Local2)
                    While (LAnd (\_SB.PCI0.LPC.EC.PIBS, Local2))
                    {
                        Sleep (0x01)
                        Decrement (Local2)
                    }

                    If (Local2)
                    {
                        Store (0x01, \_SB.PCI0.LPC.EC.PLSL)
                        Store (\MTAU, \_SB.PCI0.LPC.EC.PLTU)
                        Store (\PL1L, \_SB.PCI0.LPC.EC.PLLS)
                        Store (\PL1M, \_SB.PCI0.LPC.EC.PLMS)
                    }
                }
            }

            Store (0x00, \IOEN)
            Store (0x00, \IOST)
            If (LEqual (\ISWK, 0x01))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6070)
                }
            }

            If (\VIGD)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                If (\WVIS)
                {
                    \VBTD ()
                }
            }
            ElseIf (\WVIS)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                \VBTD ()
            }

            \VCMS (0x01, \_SB.LID._LID ())
            \AWON (0x00)
            If (\CMPR)
            {
                Notify (\_SB.SLPB, 0x02)
                Store (0x00, \CMPR)
            }

            If (LOr (\USBR, \_SB.PCI0.XHC.XRST))
            {
                If (LOr (LEqual (\XHC, 0x02), LEqual (\XHC, 0x03)))
                {
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHC.PR3, 0xFFFFFFC0, Local0)
                    Or (Local0, \_SB.PCI0.XHC.PR3M, \_SB.PCI0.XHC.PR3)
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHC.PR2, 0xFFFF8000, Local0)
                    Or (Local0, \_SB.PCI0.XHC.PR2M, \_SB.PCI0.XHC.PR2)
                }
            }

            If (LNotEqual (\ISCT, 0x00))
            {
                If (\VIGD)
                {
                    If (And (\_SB.PCI0.IGPU.TCHE, 0x0100))
                    {
                        If (And (\_SB.IAOE.GAOS (), 0x01))
                        {
                            If (And (\_SB.IAOE.GSWR (), 0x02))
                            {
                                Store (Or (And (\_SB.PCI0.IGPU.STAT, Not (0x03)), 0x01), \_SB.PCI0.IGPU.STAT)
                                Store (0x01, \_SB.PCI0.LPC.EC.SKEM)
                            }
                        }
                    }
                }
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            \NVSS (0x00)
            Store (0x00, \_SB.PCI0.LPC.EC.HSPA)
            Store (\_SB.PCI0.LPC.EC.AC._PSR (), \PWRS)
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            \_SB.PCI0.LPC.EC.ATMC ()
            If (\SCRM)
            {
                Store (0x07, \_SB.PCI0.LPC.EC.HFSP)
                If (\MTAU)
                {
                    Store (0x03E8, Local2)
                    While (LAnd (\_SB.PCI0.LPC.EC.PIBS, Local2))
                    {
                        Sleep (0x01)
                        Decrement (Local2)
                    }

                    If (Local2)
                    {
                        Store (0x01, \_SB.PCI0.LPC.EC.PLSL)
                        Store (\MTAU, \_SB.PCI0.LPC.EC.PLTU)
                        Store (\PL1L, \_SB.PCI0.LPC.EC.PLLS)
                        Store (\PL1M, \_SB.PCI0.LPC.EC.PLMS)
                    }
                }
            }

            If (LNot (\NBCF))
            {
                If (\VIGD)
                {
                    \_SB.PCI0.LPC.EC.BRNS ()
                }
                Else
                {
                    \VBRC (\BRLV)
                }
            }

            Store (0x00, \IOEN)
            Store (0x00, \IOST)
            If (LEqual (\ISWK, 0x02))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6080)
                }
            }

            If (\_SB.PCI0.XHC.XRST)
            {
                If (LOr (LEqual (\XHC, 0x02), LEqual (\XHC, 0x03)))
                {
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHC.PR3, 0xFFFFFFC0, Local0)
                    Or (Local0, \_SB.PCI0.XHC.PR3M, \_SB.PCI0.XHC.PR3)
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHC.PR2, 0xFFFF8000, Local0)
                    Or (Local0, \_SB.PCI0.XHC.PR2M, \_SB.PCI0.XHC.PR2)
                }
            }
        }

        \_SB.PCI0.LPC.EC.BATW (Arg0)
        \_SB.PCI0.LPC.EC.HKEY.WGWK (Arg0)
        Notify (\_TZ.THM0, 0x80)
        \VSLD (\_SB.LID._LID ())
        If (\VIGD)
        {
            \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
        }
        ElseIf (\WVIS)
        {
            \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
        }

        If (LLess (Arg0, 0x04))
        {
            If (LOr (And (\RRBF, 0x02), And (B1B2(\_SB.PCI0.LPC.EC.WAC0,\_SB.PCI0.LPC.EC.WAC1), 0x02)))
            {
                ShiftLeft (Arg0, 0x08, Local0)
                Store (Or (0x2013, Local0), Local0)
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (Local0)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, Local0)
            Store (\CSUM (0x00), Local1)
            If (LNotEqual (Local1, \CHKC))
            {
                Store (0x01, Local0)
                Store (Local1, \CHKC)
            }

            Store (\CSUM (0x01), Local1)
            If (LNotEqual (Local1, \CHKE))
            {
                Store (0x01, Local0)
                Store (Local1, \CHKE)
            }

            If (Local0)
            {
                Notify (\_SB, 0x00)
            }
        }

        Store (Zero, \RRBF)
        Return (WAKI)
    }
    
    Device (SMCD)
    {
        Name (_HID, "MON0000")  // _HID: Hardware ID
        Method (FAN0, 0, NotSerialized)
        {
            Store (B1B2 (\_SB.PCI0.LPC.EC.SPD0, \_SB.PCI0.LPC.EC.SPD1), Local0)
            Return (Local0)
        }
    }
    
    Method (RE1B, 1, NotSerialized)
    {
        OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
        Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
        Return(BYTE)
    }
    Method (RECB, 2, Serialized)
    // Arg0 - offset in bytes from zero-based EC
    // Arg1 - size of buffer in bits
    {
        ShiftRight(Add(Arg1,7), 3, Arg1)
        Name(TEMP, Buffer(Arg1) { })
        Add(Arg0, Arg1, Arg1)
        Store(0, Local0)
        While (LLess(Arg0, Arg1))
        {
            Store(RE1B(Arg0), Index(TEMP, Local0))
            Increment(Arg0)
            Increment(Local0)
        }
        Return(TEMP)
    }
        
    Method (WE1B, 2, NotSerialized)
    {
        OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
        Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
        Store(Arg1, BYTE)
    }
        
    Method (WECB, 3, Serialized)
    // Arg0 - offset in bytes from zero-based EC
    // Arg1 - size of buffer in bits
    // Arg2 - value to write
    {
        ShiftRight(Add(Arg1,7), 3, Arg1)
        Name(TEMP, Buffer(Arg1) { })
        Store(Arg2, TEMP)
        Add(Arg0, Arg1, Arg1)
        Store(0, Local0)
        While (LLess(Arg0, Arg1))
        {
            WE1B(Arg0, DerefOf(Index(TEMP, Local0)))
            Increment(Arg0)
            Increment(Local0)
            }
        }    
    }  
         
    Method (B1B2, 2, NotSerialized) { Return (Or (Arg0, ShiftLeft (Arg1, 8))) }

    Method (B1B4, 4, NotSerialized)
    {

        Store(Arg3, Local0)
        Or(Arg2, ShiftLeft(Local0, 8), Local0)
        Or(Arg1, ShiftLeft(Local0, 8), Local0)
        Or(Arg0, ShiftLeft(Local0, 8), Local0)
        Return(Local0)
    }
    
    Scope (_GPE)
    {
        Method (_L0D, 0, NotSerialized)
        {
            Store (B1B2(\_SB.PCI0.LPC.EC.WAC0,\_SB.PCI0.LPC.EC.WAC1), Local0)
            Store (Local0, \RRBF)
            Sleep (0x0A)
            If (And (Local0, 0x02)) {}
            If (And (Local0, 0x04))
            {
                Notify (\_SB.LID, 0x02)
            }

            If (And (Local0, 0x08))
            {
                Notify (\_SB.SLPB, 0x02)
            }

            If (And (Local0, 0x10))
            {
                Notify (\_SB.SLPB, 0x02)
            }

            If (And (Local0, 0x40)) {}
            If (And (Local0, 0x80))
            {
                Notify (\_SB.SLPB, 0x02)
            }
        }
    }
}
//EOF