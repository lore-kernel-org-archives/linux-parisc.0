Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA6094829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 08:19:30 -0600 (MDT)
Message-ID: <3DA43B47.A8AA380D@hpfrcu81.france.hp.com>
Date: Wed, 09 Oct 2002 16:20:55 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot (micro) hang
References: <3DA2945D.7010301@visoel.de>
		<3DA2E27B.5708975E@hpfrcu81.france.hp.com>
		<20021008170152.AD42D4839@dsl2.external.hp.com>
		<3DA424C6.58F6806C@hpfrcu81.france.hp.com> <1034172329.31713.16.camel@beavis>
Content-Type: text/plain; charset=us-ascii
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

Ryan Bradetich wrote:
> 
> *sigh*
> 
> This is due to a change I made to detect devices on the E class systems.
> 
> Before we encountered the E Class systems, the devices were always at
> the bottom of the range, but E Class put them at the top.  The function
> will break out once a device is found ... it appears that your system
> also has the devices towards the top of the io range.
> 
> post the contents of /proc/iomem and I can verify this for sure.  We
> need to come up with a better way for discovering these devices.
> 
> btw, what model system is this?
> 


This is a recycled C180 

$ cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8000 (PCX-U)
cpu MHz         : 180.000000
model           : 9000/780/C180
model name      : Raven U 180 (9000/780/C180)
hversion        : 0x000059c0
sversion        : 0x00000481
I-cache         : 1024 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 359.62
software id     : 2012010320




$ cat /proc/iomem
00000000-07ffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002f9fff : Kernel code
  002fa000-003fb7bf : Kernel data
f1000000-f1ffffff : GSC Bus [10/]
f2000000-f3ffffff : GSC Bus [8/]
  f2000000-f2000fff : Dino
  f200c000-f200cfff : GSC SCSI (Zalon)
f4000000-fff7ffff : GSC Bus [8/]
  fa000000-fa000fff : sti (native)
  fa100000-fa4fffff : stifb mmio
  fb000000-fbffffff : stifb
  fc000000-ffbfffff : EISA
    fc000000-fc000fff : EISA Bus Adapter
  ffd00000-ffdfffff : Lasi
    ffd00000-ffd00fff : Lasi
    ffd02000-ffd02fff : Parallel
    ffd04000-ffd04fff : Lasi Harmony
    ffd05000-ffd05fff : Serial RS232
    ffd06000-ffd06fff : Lasi SCSI
    ffd07000-ffd07fff : Apricot
    ffd08000-ffd08fff : Lasi psaux
  ffe00000-ffefffff : Wax
    ffe00000-ffe00fff : Wax
    ffe01000-ffe01fff : HP SDC
    ffe02000-ffe02fff : Serial RS232
fff80000-fffaffff : Central Bus
  fff88000-fff88fff : U2/Uturn
  fff8a000-fff8afff : U2/Uturn
  fffa0000-fffa0fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast


Cheers,
Phi
