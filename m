From: Chris Frost <chris@frostnet.net>
Subject: Re: [parisc-linux] IOGear Firewire+USB card causes unexpected irq 2
Date: Mon, 3 Apr 2006 20:34:00 -0700
Message-ID: <20060404033400.GQ25493@pooh.bubble.frostnet.net>
References: <20060329093444.GA5593@pooh.bubble.frostnet.net>
	<20060329135838.GL9011@quicksilver.road.mcmartin.ca>
	<20060330080202.GE5336@pooh.bubble.frostnet.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060330080202.GE5336@pooh.bubble.frostnet.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Just curious if anyone might have any thoughts or suggestions? I'd be
quite interested; thanks!


On Thu, Mar 30, 2006 at 12:02:02AM -0800, Chris Frost wrote:
> On Wed, Mar 29, 2006 at 08:58:38AM -0500, Kyle McMartin wrote:
> > lspci -vn for the card, please...
> 
> Attached (pci) is the output of lspci -vvv. The vendor and device codes
> are immediately below. As the machine does not boot with the card in the
> lspci output is from a pc.
> 
> 0:d.0: class 604, vendor id 3388, pci id 0021, rev 13
> 1:c.0: class 0c03, vendor id 1033, pci id 0035, rev 41
> 1:c.1: class 0c03, vendor id 1033, pci id 0035, rev 41
> 1:c.2: class 0c03, vendor id 1033, pci id 00e0, rev 2
> 1:f.0: class 0c00, vendor id 1003, pci id 00f2, rev 1
> 
> 
> > Try commenting out 
> > 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_USB) },
> > 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415) },
> > in superio.c and seeing if that helps at all.
> 
> This change appears to have no effect.
> 
> 
> Max suggested checking the machine's firmware version. It was running 3.4.
> I upgraded the machine to the latest, 5.0, but this has no visible effect.
> 
> 
> Since 2.6.16-pa9 was released today I also upgraded to it, but with no
> visible change.
> 
> thanks again,
> -- 
> Chris Frost  |  <http://www.frostnet.net/chris/>
> -------------+----------------------------------
> Public PGP Key:
>    Email chris@frostnet.net with the subject "retrieve pgp key"
>    or visit <http://www.frostnet.net/chris/about/pgp_key.phtml>

> 00:0d.0 PCI bridge: Hint Corp: Unknown device 0021 (rev 13) (prog-if 00 [Normal decode])
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
> 	Latency: 66, cache line size 08
> 	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
> 	I/O behind bridge: 0000f000-00000fff
> 	Memory behind bridge: ff900000-ff9fffff
> 	Prefetchable memory behind bridge: 00000000ff800000-00000000ff800000
> 	BridgeCtl: Parity+ SERR+ NoISA- VGA- MAbort- >Reset- FastB2B-
> 	Capabilities: [80] Power Management version 2
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
> 		Bridge: PM- B3+
> 	Capabilities: [90] #06 [0000]
> 	Capabilities: [a0] Vital Product Data
> 
> 01:0c.0 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
> 	Subsystem: Unknown device 1735:0035
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
> 	Latency: 64 (250ns min, 10500ns max), cache line size 08
> 	Interrupt: pin A routed to IRQ 7
> 	Region 0: Memory at ff9fc000 (32-bit, non-prefetchable) [size=4K]
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
> 
> 01:0c.1 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI])
> 	Subsystem: Unknown device 1735:0035
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
> 	Latency: 64 (250ns min, 10500ns max), cache line size 08
> 	Interrupt: pin B routed to IRQ 5
> 	Region 0: Memory at ff9fd000 (32-bit, non-prefetchable) [size=4K]
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
> 
> 01:0c.2 USB Controller: NEC Corporation: Unknown device 00e0 (rev 02) (prog-if 20)
> 	Subsystem: Unknown device 1735:00e1
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
> 	Latency: 64 (4000ns min, 8500ns max), cache line size 08
> 	Interrupt: pin C routed to IRQ 11
> 	Region 0: Memory at ff9fec00 (32-bit, non-prefetchable) [size=256]
> 	Capabilities: [40] Power Management version 2
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
> 
> 01:0f.0 FireWire (IEEE 1394): NEC Corporation: Unknown device 00f2 (rev 01) (prog-if 10 [OHCI])
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
> 	Latency: 64 (63750ns min, 63750ns max), cache line size 08
> 	Interrupt: pin A routed to IRQ 9
> 	Region 0: Memory at ff9ff000 (32-bit, non-prefetchable) [size=4K]
> 	Capabilities: [60] Power Management version 2
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
> 		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
Chris Frost  |  <http://www.frostnet.net/chris/>
-------------+----------------------------------
Public PGP Key:
   Email chris@frostnet.net with the subject "retrieve pgp key"
   or visit <http://www.frostnet.net/chris/about/pgp_key.phtml>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
