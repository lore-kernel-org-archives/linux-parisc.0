Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9270F4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Jan 2003 02:30:32 -0700 (MST)
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com [172.21.143.37])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h0G9TZ006678
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Jan 2003 11:29:35 +0200 (EET)
Date: Thu, 16 Jan 2003 11:30:28 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interesting network card ...
Message-ID: <20030116093028.GD17760@aurinko.ntc.nokia.com>
References: <20030115085619.GA17760@aurinko.ntc.nokia.com> <20030116021111.GD8543@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20030116021111.GD8543@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Jan 15, 2003 at 07:11:11PM -0700, ext Grant Grundler wrote:
> On Wed, Jan 15, 2003 at 10:56:20AM +0200, Nahkola Mikko wrote:

> > What's the deal with the various HP-branded tulip-based NICs? Are they 
> > expected to "just work" or what?

> yes.

Well, at least then there's hope in trying to get it to work ...

> > I found one that sure doesn't, but then 
> > again, but my kernel isn't actually new ... (2.4.18-32 packaged)

> ...a newer kernel would be more interesting.

Recommendations? For some reason I haven't managed to get a working 
kernel by building from source ... I do still have a 2.4.19-pa24 that I 
did get to boot even if it wasn't all that good. I mean, at least the .18 
has all the basic functionality that I tend to use.

Could be because I still have only the Debian-packaged tools. I haven't 
taken the time to run after the toolchain development ... didn't even get 
a newer modutils package yet.

Any ready-built package that I should try, or sould I just pull a newer 
(which version?) toolchain and compile from sources (which version?) - I 
haven't really paid enough attention to that stuff lately...

> > The card is the HP ANA-6911A/AUI (yes, it's a 10/100BT with coax and 
> > AUI too), part# A3738-60001, and it _is_ found by the tulip driver, but 
> > for some reason the driver claims that "no MII transceiver found",

> This does sound like a bug (fixed) in the tulip driver relating to
> MII initialization. But I'm surprised to see it manifest on a C240.

What do you mean, surprised to see it manifest on a C240? How so?

> One should be aware that HP sold 4 different flavors of single port
> 100BT cards based on tulip chipsets. IIRC, they were:
> o PCI "server" 
> o GSC (card-mode Dino)
> o PCI "workstation"
> o PCI V-class only
> (and an NIO 100BT also that I don't know anything about).

This might be the PCI "server" card. Not sure, partsurfer only knows an 
ANA-6911 without the A and AUI, and not much about that either... and I 
only see the 4-port cards usually. 

BTW, the NIO 100BT is an interesting beast. It (or the driver) is the 
only reason why one of our HP-UX boxes only gets about half an year max 
uptime usually ... and has other "interesting" "features". 

> And each had a different HP-UX driver to go with it (btlan3-6).
> Eventually all 4 drivers were merged into one but that's still fairly
> recent history.

Well, recent enough to predate all the entries that partsurfer showed 
about the ANA-6911. 

And it was still better than the deal with the EISA drivers - I mean, 
duh, I did get (the devices, not drivers) lan0 and btlan0 as different 
adapters once ... 

Anyway, here's some from lspci and dmesg. The adapter in question is the 
first one - it usurped eth0 and still didn't go anywhere - and as usual,
things got interesting, as the box is a NIS and NFS client... 
Notably it is a higher revision than the builtin adapter, and therefore I 
wouldn't expect to need the de4x5 driver.

--------------------
# lspci -vvx
01:01.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
        Subsystem: Hewlett-Packard Company: Unknown device 1067
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (5000ns min, 10000ns max), cache line size 08
        Interrupt: pin A routed to IRQ 129
        Region 0: I/O ports at 1fd00 [size=128]
        Region 1: Memory at f2ffc000 (32-bit, non-prefetchable) [size=1K]
        Expansion ROM at f2f80000 [disabled] [size=256K]
00: 11 10 19 00 57 01 80 02 41 00 00 02 08 ff 00 00
10: 01 fd 00 00 00 c0 ff f2 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 67 10
30: 00 00 f8 f2 00 00 00 00 00 00 00 00 01 01 14 28

01:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR) 53c875 (rev 04)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (4250ns min, 16000ns max), cache line size 08
        Interrupt: pin A routed to IRQ 131
        Region 0: I/O ports at 1fe00 [size=256]
        Region 1: Memory at f2ffd000 (32-bit, non-prefetchable) [size=256]
        Region 2: Memory at f2ffe000 (32-bit, non-prefetchable) [size=4K]
00: 00 10 0f 00 57 01 00 02 04 00 00 01 08 ff 00 00
10: 01 fe 00 00 00 d0 ff f2 00 e0 ff f2 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 03 01 11 40

01:14.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 30)
        Subsystem: Hewlett-Packard Company: Unknown device 104f
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ Stepping- SERR+ FastB2B-
        Status: Cap- 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
        Latency: 255 (5000ns min, 10000ns max), cache line size 08
        Interrupt: pin A routed to IRQ 128
        Region 0: I/O ports at 1ff00 [size=128]
        Region 1: Memory at f2fff000 (32-bit, non-prefetchable) [size=128]
        Expansion ROM at f2f80000 [disabled] [size=256K]
00: 11 10 19 00 57 01 80 02 30 00 00 02 08 ff 00 00
10: 01 ff 00 00 00 f0 ff f2 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 3c 10 4f 10
30: 00 00 f8 f2 00 00 00 00 00 00 00 00 00 01 14 28

# dmesg |grep -i tulip
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0:  EEPROM default media type Autosense.
tulip0:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip0:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block.
tulip0:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block.
tulip0: ***WARNING***: No MII transceiver found!
eth0: Digital DS21143 Tulip rev 65 at 0x1fd00, 00:10:83:F7:84:33, IRQ 129.
tulip1: no phy info, aborting mtable build
tulip1:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth1: Digital DS21143 Tulip rev 48 at 0x1ff00, 00:60:B0:D0:1B:9F, IRQ 128.

# uname -mrspv
Linux 2.4.18-32 #1 Sat Mar 30 18:26:22 MST 2002 parisc unknown
------------------


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
