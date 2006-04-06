From: Marc Zyngier <maz@misterjones.org>
Subject: [parisc-linux] B2000 PCI resource problem
Date: Thu, 06 Apr 2006 21:12:05 +0200
Message-ID: <wrp7j62jz7e.fsf@wild-wind.fr.eu.org>
Reply-To: maz@misterjones.org
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

People,

I recently added a Sun dual gigabit, dual scsi PCI card to one of my
B2000s. This board contains 2 cassini chips, and a 53c896, all sitting
behind an Intel (well, Digital) 21154 PCI bridge.

The system works fine, but I'm seeing the following problems:

Whel probing the SCSI part of the board, the kernel spits the
following:

PCI: resource not parented! [2000-2fff]
PCI: resource not parented! [fb000000-fb5fffff]

And if I look at /proc/ioports :

00000000-00001fff : PCI00 Ports
  00000020-0000003e : pic1
  000000a0-000000be : pic2
  000007e0-000007fe : acpi
  00000800-000008ff : sym53c8xx
  00000900-00000907 : ide0
  00000908-0000090f : ide1
  00000d02-00000d02 : ide0
  00000e00-00000e07 : ide0
  00000f00-00000f7f : tulip
00012000-00013fff : PCI01 Ports
  00012000-000120ff : sym53c8xx
  00012100-000121ff : sym53c8xx
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
  00002000-00002fff : PCI Bus #02
[... ad nauseam].

Something looks bad here... Does anybody have a clue about this? lspci
output happended at the end of this mail.

Regards,

	M.

ashes:/home/maz# lspci -vv
0000:00:0c.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
        Subsystem: Hewlett-Packard Company: Unknown device 104f
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (5000ns min, 10000ns max), Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin A routed to IRQ 17
        Region 0: I/O ports at 0f00 [size=128]
        Region 1: Memory at f4005000 (32-bit, non-prefetchable) [size=1K]
        Expansion ROM at f4040000 [disabled] [size=256K]

0000:00:0d.0 Multimedia audio controller: Analog Devices AD1889 sound chip
        Subsystem: Analog Devices AD1889 sound chip
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (250ns min, 63750ns max)
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at f4009000 (32-bit, prefetchable) [size=512]
        Region 1: Memory at f4008000 (32-bit, prefetchable) [size=16]
        Region 2: Memory at f4007000 (32-bit, prefetchable) [size=16]
        Region 3: Memory at f4006000 (32-bit, prefetchable) [size=16]
        Capabilities: [dc] Power Management version 1
                Flags: PMEClk- DSI- D1- D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:0e.0 IDE interface: National Semiconductor Corporation 87415/87560 IDE (rev 03) (prog-if 8f [Master SecP SecO PriP PriO])
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255, Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin ? routed to IRQ 7
        Region 0: I/O ports at 0e00 [size=8]
        Region 1: I/O ports at 0d00 [size=4]
        Region 2: I/O ports at 0b00 [size=8]
        Region 3: I/O ports at 0a00 [size=4]
        Region 4: I/O ports at 0900 [size=16]

0000:00:0e.1 Bridge: National Semiconductor Corporation 87560 Legacy I/O (rev 01)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255, Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin ? routed to IRQ 19

0000:00:0e.2 USB Controller: National Semiconductor Corporation USB Controller (rev 02) (prog-if 10 [OHCI])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 240
        Interrupt: pin D routed to IRQ 1
        Region 0: Memory at f4004000 (32-bit, non-prefetchable) [size=4K]
        Region 1: Memory at f4003000 (32-bit, non-prefetchable) [size=4K]

0000:00:0f.0 SCSI storage controller: LSI Logic / Symbios Logic 53c895a (rev 01)
        Subsystem: LSI Logic / Symbios Logic LSI53C895A PCI to Ultra2 SCSI Controller
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (4250ns min, 16000ns max), Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin A routed to IRQ 20
        Region 0: I/O ports at 0800 [size=256]
        Region 1: Memory at f4002000 (32-bit, non-prefetchable) [size=1K]
        Region 2: Memory at f4000000 (32-bit, non-prefetchable) [size=8K]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:01:00.0 3D controller: Hewlett-Packard Company Visualize FXe (rev 03)
        Subsystem: Hewlett-Packard Company: Unknown device 108c
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR- FastB2B-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255
        Interrupt: pin A routed to IRQ 21
        Region 0: Memory at fa000000 (64-bit, prefetchable) [size=16M]
        Region 2: Memory at f9000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at f4800000 [disabled] [size=128K]

0000:01:02.0 PCI bridge: Intel Corporation 21154 PCI-to-PCI Bridge (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B+
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255, Cache Line Size: 0x10 (64 bytes)
        Bus: primary=01, secondary=02, subordinate=02, sec-latency=255
        I/O behind bridge: 00002000-00002fff
        Memory behind bridge: fb000000-fb5fffff
        Prefetchable memory behind bridge: 00000000f0100000-00000000f0100000
        BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
        Capabilities: [dc] Power Management version 1
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
                Bridge: PM- B3+

0000:02:00.0 Ethernet controller: National Semiconductor Corporation DP83065 [Saturn] 10/100/1000 Ethernet Controller (rev 30)
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR- FastB2B-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=slow >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (16000ns min, 16000ns max), Cache Line Size: 0x20 (128 bytes)
        Interrupt: pin A routed to IRQ 22
        Region 0: Memory at fb200000 (32-bit, non-prefetchable) [size=2M]
        Expansion ROM at fb500000 [disabled] [size=1M]

0000:02:01.0 Ethernet controller: National Semiconductor Corporation DP83065 [Saturn] 10/100/1000 Ethernet Controller (rev 30)
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR- FastB2B-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=slow >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (16000ns min, 16000ns max), Cache Line Size: 0x20 (128 bytes)
        Interrupt: pin A routed to IRQ 23
        Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=2M]
        Expansion ROM at fb500000 [disabled] [size=1M]

0000:02:02.0 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (4250ns min, 16000ns max), Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin A routed to IRQ 24
        Region 0: I/O ports at 12100 [size=256]
        Region 1: Memory at fb405000 (64-bit, non-prefetchable) [size=1K]
        Region 3: Memory at fb402000 (64-bit, non-prefetchable) [size=8K]
        Expansion ROM at fb500000 [disabled] [size=64K]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:02:02.1 SCSI storage controller: LSI Logic / Symbios Logic 53C896/897 (rev 07)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (4250ns min, 16000ns max), Cache Line Size: 0x10 (64 bytes)
        Interrupt: pin B routed to IRQ 25
        Region 0: I/O ports at 12000 [size=256]
        Region 1: Memory at fb404000 (64-bit, non-prefetchable) [size=1K]
        Region 3: Memory at fb400000 (64-bit, non-prefetchable) [size=8K]
        Expansion ROM at fb500000 [disabled] [size=64K]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-


-- 
And if you don't know where you're going, any road will take you there...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
