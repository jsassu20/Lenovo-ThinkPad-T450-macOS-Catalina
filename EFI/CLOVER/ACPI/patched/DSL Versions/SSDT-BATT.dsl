// Lenovo ThinkPad T450 Dual Battery Configuration
//
// Fixes Improper Battery Level and Status Reporting

DefinitionBlock ("", "SSDT", 2, "T450", "_BATT", 0x00000000)
{
    External (_SB_.IAOE.GAOS, MethodObj)    // 0 Arguments
    External (_SB_.IAOE.GSWR, MethodObj)    // 0 Arguments
    External (_SB_.LID_, DeviceObj)
    External (_SB_.LID_._LID, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.EXP6, DeviceObj)
    External (_SB_.PCI0.IGPU.GLIS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.IGPU.STAT, FieldUnitObj)
    External (_SB_.PCI0.IGPU.TCHE, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.IGPU.VRSI, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.AC__._PSR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.ATMC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT0, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.BAT0._BIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT0._BST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT0._HID, IntObj)
    External (_SB_.PCI0.LPC_.EC__.BAT0._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT1, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1._BIF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT1._BST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BAT1._HID, IntObj)
    External (_SB_.PCI0.LPC_.EC__.BAT1._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.BATW, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.BRNS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.EVNT, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.FNST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.HCMU, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.HFNI, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.HFSP, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.HKEY.DHKC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.HKEY.MHKE, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.HKEY.MHKQ, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.HKEY.WGWK, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.HSPA, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.HWAC, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.PIBS, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.PLLS, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.PLMS, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.PLSL, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.PLTU, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.SKEM, FieldUnitObj)
    External (_SB_.PCI0.LPC_.EC__.TMP0, FieldUnitObj)
    External (_SB_.PCI0.XHC_.PR2_, FieldUnitObj)
    External (_SB_.PCI0.XHC_.PR2M, FieldUnitObj)
    External (_SB_.PCI0.XHC_.PR3_, FieldUnitObj)
    External (_SB_.PCI0.XHC_.PR3M, FieldUnitObj)
    External (_SB_.PCI0.XHC_.XRST, FieldUnitObj)
    External (_SB_.SLPB, DeviceObj)
    External (_SI_._SST, MethodObj)    // 1 Arguments
    External (_TZ_.THM0, ThermalZoneObj)
    External (ACST, FieldUnitObj)
    External (AWON, MethodObj)    // 1 Arguments
    External (BATM, MutexObj)
    External (BRLV, FieldUnitObj)
    External (CHKC, FieldUnitObj)
    External (CHKE, FieldUnitObj)
    External (CMPR, FieldUnitObj)
    External (CSUM, MethodObj)    // 1 Arguments
    External (FNID, FieldUnitObj)
    External (HIID, FieldUnitObj)
    External (IOEN, FieldUnitObj)
    External (IOST, FieldUnitObj)
    External (ISCT, FieldUnitObj)
    External (ISWK, FieldUnitObj)
    External (LIDB, FieldUnitObj)
    External (MTAU, FieldUnitObj)
    External (NBCF, FieldUnitObj)
    External (NVSS, MethodObj)    // 1 Arguments
    External (OSC4, FieldUnitObj)
    External (PL1L, FieldUnitObj)
    External (PL1M, FieldUnitObj)
    External (PNTF, MethodObj)    // 1 Arguments
    External (PWRS, FieldUnitObj)
    External (RRBF, FieldUnitObj)
    External (SCRM, FieldUnitObj)
    External (SPS_, FieldUnitObj)
    External (UCMS, MethodObj)    // 1 Arguments
    External (USBR, FieldUnitObj)
    External (VBRC, MethodObj)    // 1 Arguments
    External (VBTD, MethodObj)    // 0 Arguments
    External (VCMS, MethodObj)    // 2 Arguments
    External (VIGD, FieldUnitObj)
    External (VSLD, MethodObj)    // 1 Arguments
    External (WAKI, DeviceObj)
    External (WVIS, FieldUnitObj)
    External (XHC_, FieldUnitObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Device (BATC)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                ^^BAT0._HID = Zero
                ^^BAT1._HID = Zero
            }

            Method (CVWA, 3, NotSerialized)
            {
                If (Arg2)
                {
                    Arg0 = ((Arg0 * 0x03E8) / Arg1)
                }

                Return (Arg0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return ((^^BAT0._STA () | ^^BAT1._STA ()))
            }

            Name (B0CO, Zero)
            Name (B1CO, Zero)
            Name (B0DV, Zero)
            Name (B1DV, Zero)
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Local0 = ^^BAT0._BST ()
                Local2 = ^^BAT0._STA ()
                If ((0x1F == Local2))
                {
                    Local4 = DerefOf (Local0 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }
                }

                Local1 = ^^BAT1._BST ()
                Local3 = ^^BAT1._STA ()
                If ((0x1F == Local3))
                {
                    Local4 = DerefOf (Local1 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }
                }

                If (((0x1F != Local2) && (0x1F == Local3)))
                {
                    Local0 = Local1
                    Local2 = Local3
                    Local3 = Zero
                }

                If (((0x1F == Local2) && (0x1F == Local3)))
                {
                    Local4 = DerefOf (Local0 [Zero])
                    Local5 = DerefOf (Local1 [Zero])
                    If (((Local4 == 0x02) || (Local5 == 0x02)))
                    {
                        Local0 [Zero] = 0x02
                    }
                    ElseIf (((Local4 == One) || (Local5 == One)))
                    {
                        Local0 [Zero] = One
                    }
                    ElseIf (((Local4 == 0x05) || (Local5 == 0x05)))
                    {
                        Local0 [Zero] = 0x05
                    }
                    ElseIf (((Local4 == 0x04) || (Local5 == 0x04)))
                    {
                        Local0 [Zero] = 0x04
                    }

                    Local0 [One] = (CVWA (DerefOf (Local0 [One]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [One]), B1DV, B1CO))
                    Local0 [0x02] = (CVWA (DerefOf (Local0 [0x02]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x02]), B1DV, B1CO))
                    Local0 [0x03] = ((DerefOf (Local0 [0x03]) + DerefOf (
                        Local1 [0x03])) / 0x02)
                }

                Return (Local0)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Local0 = ^^BAT0._BIF ()
                Local2 = ^^BAT0._STA ()
                If ((0x1F == Local2))
                {
                    Local4 = DerefOf (Local0 [One])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }

                    Local4 = DerefOf (Local0 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }

                    Local4 = DerefOf (Local0 [0x04])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local2 = Zero
                    }
                }

                Local1 = ^^BAT1._BIF ()
                Local3 = ^^BAT1._STA ()
                If ((0x1F == Local3))
                {
                    Local4 = DerefOf (Local1 [One])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }

                    Local4 = DerefOf (Local1 [0x02])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }

                    Local4 = DerefOf (Local1 [0x04])
                    If ((!Local4 || (Ones == Local4)))
                    {
                        Local3 = Zero
                    }
                }

                If (((0x1F != Local2) && (0x1F == Local3)))
                {
                    Local0 = Local1
                    Local2 = Local3
                    Local3 = Zero
                }

                If (((0x1F == Local2) && (0x1F == Local3)))
                {
                    B0CO = !DerefOf (Local0 [Zero])
                    B1CO = !DerefOf (Local1 [Zero])
                    Local0 [Zero] = One
                    B0DV = DerefOf (Local0 [0x04])
                    B1DV = DerefOf (Local1 [0x04])
                    Local0 [One] = (CVWA (DerefOf (Local0 [One]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [One]), B1DV, B1CO))
                    Local0 [0x02] = (CVWA (DerefOf (Local0 [0x02]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x02]), B1DV, B1CO))
                    Local0 [0x04] = ((B0DV + B1DV) / 0x02)
                    Local0 [0x05] = (CVWA (DerefOf (Local0 [0x05]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x05]), B1DV, B1CO))
                    Local0 [0x06] = (CVWA (DerefOf (Local0 [0x06]), B0DV, 
                        B0CO) + CVWA (DerefOf (Local1 [0x06]), B1DV, B1CO))
                }

                Return (Local0)
            }
        }

        OperationRegion (ECR1, EmbeddedControl, Zero, 0x0100)
        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36), 
            WAC0,   8, 
            WAC1,   8, 
            Offset (0x4E), 
            WAK0,   8, 
            WAK1,   8, 
            Offset (0x84), 
            SPD0,   8, 
            SPD1,   8
        }

        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0), 
            BRC0,   8, 
            BRC1,   8, 
            BFC0,   8, 
            BFC1,   8, 
            Offset (0xA8), 
            BAC0,   8, 
            BAC1,   8, 
            BVO0,   8, 
            BVO1,   8
        }

        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0), 
            BBM0,   8, 
            BBM1,   8, 
            Offset (0xA4), 
            BCC0,   8, 
            BCC1,   8
        }

        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0), 
            BDC0,   8, 
            BDC1,   8, 
            BDV0,   8, 
            BDV1,   8, 
            Offset (0xAA), 
            BSN0,   8, 
            BSN1,   8
        }

        Field (ECR1, ByteAcc, NoLock, Preserve)
        {
            Offset (0xA0), 
            BCH0,   8, 
            BCH1,   8, 
            BCH2,   8, 
            BCH3,   8
        }

        Method (GBIF, 3, NotSerialized)
        {
            Acquire (BATM, 0xFFFF)
            If (Arg2)
            {
                HIID = (Arg0 | One)
                Local7 = B1B2 (BBM0, BBM1)
                Local7 >>= 0x0F
                Arg1 [Zero] = (Local7 ^ One)
                HIID = Arg0
                If (Local7)
                {
                    Local1 = (B1B2 (BFC0, BFC1) * 0x0A)
                }
                Else
                {
                    Local1 = B1B2 (BFC0, BFC1)
                }

                Arg1 [0x02] = Local1
                HIID = (Arg0 | 0x02)
                If (Local7)
                {
                    Local0 = (B1B2 (BDC0, BDC1) * 0x0A)
                }
                Else
                {
                    Local0 = B1B2 (BDC0, BDC1)
                }

                Arg1 [One] = Local0
                Divide (Local1, 0x14, Local2, Arg1 [0x05])
                If (Local7)
                {
                    Arg1 [0x06] = 0xC8
                }
                ElseIf (B1B2 (BDV0, BDV1))
                {
                    Divide (0x00030D40, B1B2 (BDV0, BDV1), Local2, Arg1 [0x06])
                }
                Else
                {
                    Arg1 [0x06] = Zero
                }

                Arg1 [0x04] = B1B2 (BDV0, BDV1)
                Local0 = B1B2 (BSN0, BSN1)
                Name (SERN, Buffer (0x06)
                {
                    "     "
                })
                Local2 = 0x04
                While (Local0)
                {
                    Divide (Local0, 0x0A, Local1, Local0)
                    SERN [Local2] = (Local1 + 0x30)
                    Local2--
                }

                Arg1 [0x0A] = SERN /* \_SB_.PCI0.LPC_.EC__.GBIF.SERN */
                HIID = (Arg0 | 0x06)
                Arg1 [0x09] = RECB (0xA0, 0x80)
                HIID = (Arg0 | 0x04)
                Name (BTYP, Buffer (0x05)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00                     // .....
                })
                BTYP = B1B4 (BCH0, BCH1, BCH2, BCH3)
                Arg1 [0x0B] = BTYP /* \_SB_.PCI0.LPC_.EC__.GBIF.BTYP */
                HIID = (Arg0 | 0x05)
                Arg1 [0x0C] = RECB (0xA0, 0x80)
            }
            Else
            {
                Arg1 [One] = 0xFFFFFFFF
                Arg1 [0x05] = Zero
                Arg1 [0x06] = Zero
                Arg1 [0x02] = 0xFFFFFFFF
            }

            Release (BATM)
            Return (Arg1)
        }

        Method (GBST, 4, NotSerialized)
        {
            Acquire (BATM, 0xFFFF)
            If ((Arg1 & 0x20))
            {
                Local0 = 0x02
            }
            ElseIf ((Arg1 & 0x40))
            {
                Local0 = One
            }
            Else
            {
                Local0 = Zero
            }

            If ((Arg1 & 0x07)){}
            Else
            {
                Local0 |= 0x04
            }

            If (((Arg1 & 0x07) == 0x07))
            {
                Local0 = 0x04
                Local1 = Zero
                Local2 = Zero
                Local3 = Zero
            }
            Else
            {
                HIID = Arg0
                Local3 = B1B2 (BVO0, BVO1)
                If (Arg2)
                {
                    Local2 = (B1B2 (BRC0, BRC1) * 0x0A)
                }
                Else
                {
                    Local2 = B1B2 (BRC0, BRC1)
                }

                Local1 = B1B2 (BAC0, BAC1)
                If ((Local1 >= 0x8000))
                {
                    If ((Local0 & One))
                    {
                        Local1 = (0x00010000 - Local1)
                    }
                    Else
                    {
                        Local1 = Zero
                    }
                }
                ElseIf (!(Local0 & 0x02))
                {
                    Local1 = Zero
                }

                If (Arg2)
                {
                    Local1 *= Local3
                    Divide (Local1, 0x03E8, Local7, Local1)
                }
            }

            Arg3 [Zero] = Local0
            Arg3 [One] = Local1
            Arg3 [0x02] = Local2
            Arg3 [0x03] = Local3
            Release (BATM)
            Return (Arg3)
        }

        Method (\_WAK, 1, NotSerialized)  // _WAK: Wake
        {
            \SPS = Zero
            \_SB.PCI0.LPC.EC.HCMU = Zero
            \_SB.PCI0.LPC.EC.EVNT (One)
            \_SB.PCI0.LPC.EC.HKEY.MHKE (One)
            \_SB.PCI0.LPC.EC.FNST ()
            \UCMS (0x0D)
            \LIDB = Zero
            \_SB.PCI0.IGPU.VRSI ()
            If ((Arg0 == One))
            {
                \FNID = \_SB.PCI0.LPC.EC.HFNI ()
            }

            If ((Arg0 == 0x03))
            {
                \NVSS (Zero)
                \_SI._SST (One)
                \PWRS = \_SB.PCI0.LPC.EC.AC._PSR ()
                If (\OSC4)
                {
                    \PNTF (0x81)
                }

                If ((\ACST != \_SB.PCI0.LPC.EC.AC._PSR ()))
                {
                    \_SB.PCI0.LPC.EC.ATMC ()
                }

                If (\SCRM)
                {
                    \_SB.PCI0.LPC.EC.HFSP = 0x07
                    If (\MTAU)
                    {
                        Local2 = 0x03E8
                        While ((\_SB.PCI0.LPC.EC.PIBS && Local2))
                        {
                            Sleep (One)
                            Local2--
                        }

                        If (Local2)
                        {
                            \_SB.PCI0.LPC.EC.PLSL = One
                            \_SB.PCI0.LPC.EC.PLTU = \MTAU /* External reference */
                            \_SB.PCI0.LPC.EC.PLLS = \PL1L /* External reference */
                            \_SB.PCI0.LPC.EC.PLMS = \PL1M /* External reference */
                        }
                    }
                }

                \IOEN = Zero
                \IOST = Zero
                If ((\ISWK == One))
                {
                    If (\_SB.PCI0.LPC.EC.HKEY.DHKC ())
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

                \VCMS (One, \_SB.LID._LID ())
                \AWON (Zero)
                If (\CMPR)
                {
                    Notify (\_SB.SLPB, 0x02) // Device Wake
                    \CMPR = Zero
                }

                If ((\USBR || \_SB.PCI0.XHC.XRST))
                {
                    If (((\XHC == 0x02) || (\XHC == 0x03)))
                    {
                        Local0 = Zero
                        Local0 = (\_SB.PCI0.XHC.PR3 & 0xFFFFFFC0)
                        \_SB.PCI0.XHC.PR3 |= Local0
                        Local0 = Zero
                        Local0 = (\_SB.PCI0.XHC.PR2 & 0xFFFF8000)
                        \_SB.PCI0.XHC.PR2 |= Local0
                    }
                }

                If ((\ISCT != Zero))
                {
                    If (\VIGD)
                    {
                        If ((\_SB.PCI0.IGPU.TCHE () & 0x0100))
                        {
                            If ((\_SB.IAOE.GAOS () & One))
                            {
                                If ((\_SB.IAOE.GSWR () & 0x02))
                                {
                                    \_SB.PCI0.IGPU.STAT = ((\_SB.PCI0.IGPU.STAT & 0xFFFFFFFFFFFFFFFC) | One)
                                    \_SB.PCI0.LPC.EC.SKEM = One
                                }
                            }
                        }
                    }
                }
            }

            If ((Arg0 == 0x04))
            {
                \NVSS (Zero)
                \_SB.PCI0.LPC.EC.HSPA = Zero
                \PWRS = \_SB.PCI0.LPC.EC.AC._PSR ()
                If (\OSC4)
                {
                    \PNTF (0x81)
                }

                \_SB.PCI0.LPC.EC.ATMC ()
                If (\SCRM)
                {
                    \_SB.PCI0.LPC.EC.HFSP = 0x07
                    If (\MTAU)
                    {
                        Local2 = 0x03E8
                        While ((\_SB.PCI0.LPC.EC.PIBS && Local2))
                        {
                            Sleep (One)
                            Local2--
                        }

                        If (Local2)
                        {
                            \_SB.PCI0.LPC.EC.PLSL = One
                            \_SB.PCI0.LPC.EC.PLTU = \MTAU /* External reference */
                            \_SB.PCI0.LPC.EC.PLLS = \PL1L /* External reference */
                            \_SB.PCI0.LPC.EC.PLMS = \PL1M /* External reference */
                        }
                    }
                }

                If (!\NBCF)
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

                \IOEN = Zero
                \IOST = Zero
                If ((\ISWK == 0x02))
                {
                    If (\_SB.PCI0.LPC.EC.HKEY.DHKC ())
                    {
                        \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6080)
                    }
                }

                If (\_SB.PCI0.XHC.XRST)
                {
                    If (((\XHC == 0x02) || (\XHC == 0x03)))
                    {
                        Local0 = Zero
                        Local0 = (\_SB.PCI0.XHC.PR3 & 0xFFFFFFC0)
                        \_SB.PCI0.XHC.PR3 |= Local0
                        Local0 = Zero
                        Local0 = (\_SB.PCI0.XHC.PR2 & 0xFFFF8000)
                        \_SB.PCI0.XHC.PR2 |= Local0
                    }
                }
            }

            \_SB.PCI0.LPC.EC.BATW (Arg0)
            \_SB.PCI0.LPC.EC.HKEY.WGWK (Arg0)
            Notify (\_TZ.THM0, 0x80) // Status Change
            \VSLD (\_SB.LID._LID ())
            If (\VIGD)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
            }
            ElseIf (\WVIS)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
            }

            If ((Arg0 < 0x04))
            {
                If (((\RRBF & 0x02) || (B1B2 (\_SB.PCI0.LPC.EC.WAC0, \_SB.PCI0.LPC.EC.WAC1) & 0x02)))
                {
                    Local0 = (Arg0 << 0x08)
                    Local0 |= 0x2013
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (Local0)
                }
            }

            If ((Arg0 == 0x04))
            {
                Local0 = Zero
                Local1 = \CSUM (Zero)
                If ((Local1 != \CHKC))
                {
                    Local0 = One
                    \CHKC = Local1
                }

                Local1 = \CSUM (One)
                If ((Local1 != \CHKE))
                {
                    Local0 = One
                    \CHKE = Local1
                }

                If (Local0)
                {
                    Notify (\_SB, Zero) // Bus Check
                }
            }

            \RRBF = Zero
            Return (WAKI) /* External reference */
        }

        Device (SMCD)
        {
            Name (_HID, "MON0000")  // _HID: Hardware ID
            Method (FAN0, 0, NotSerialized)
            {
                Local0 = B1B2 (\_SB.PCI0.LPC.EC.SPD0, \_SB.PCI0.LPC.EC.SPD1)
                Return (Local0)
            }
        }

        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPC_.EC__.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP) /* \_SB_.PCI0.LPC_.EC__.RECB.TEMP */
        }

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ERAM, EmbeddedControl, Arg0, One)
            Field (ERAM, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Method (B1B4, 4, NotSerialized)
    {
        Local0 = Arg3
        Local0 = (Arg2 | (Local0 << 0x08))
        Local0 = (Arg1 | (Local0 << 0x08))
        Local0 = (Arg0 | (Local0 << 0x08))
        Return (Local0)
    }

    Scope (_GPE)
    {
        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Local0 = B1B2 (\_SB.PCI0.LPC.EC.WAC0, \_SB.PCI0.LPC.EC.WAC1)
            \RRBF = Local0
            Sleep (0x0A)
            If ((Local0 & 0x02)){}
            If ((Local0 & 0x04))
            {
                Notify (\_SB.LID, 0x02) // Device Wake
            }

            If ((Local0 & 0x08))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x10))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }

            If ((Local0 & 0x40)){}
            If ((Local0 & 0x80))
            {
                Notify (\_SB.SLPB, 0x02) // Device Wake
            }
        }
    }
}

