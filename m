From: Frans Pop <elendil@planet.nl>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Sat, 1 Aug 2009 23:17:43 +0200
Message-ID: <200908012317.45383.elendil@planet.nl>
References: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca> <20090801190715.0929A500B@hiauly1.hia.nrc.ca> <119aab440908011302p6ee9eed1w3f72a17e89a001c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	kyle@mcmartin.ca, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440908011302p6ee9eed1w3f72a17e89a001c3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Saturday 01 August 2009, Carlos O'Donell wrote:
> I suggest you use Dave's patch please, it is IMO the most correct
> patch.

Right. I think the original patch is probably responsible for endless
errors on shutdown/reboot:

Bad Address (null pointer deref?): Code=15 regs=00000000bea7cf70 (Addr=c00007ffbea7c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  000000ff0804ff0e 00000000405ead40 000000006fc00000 00000000bea7ca18
r04-07  0000000037de0000 ffffffffffe00008 00000000bea7ca18 00000000405ea540
r08-11  000000000fc212c1 000000006bc23fd9 000000000000000f 00000000faf59048
r12-15  00000000be784b28 0000000000000025 00000000faf5932d 0000000000000000
r16-19  00000000bea7bfa0 0000000000000014 000000004074b134 00000000bea7cda0
r20-23  00000000ffffe000 000000004011d2b4 0000000040479004 0000000000000010
r24-27  0000000000000000 000000004011d1e0 000000004011d838 00000000405dcd40
r28-31  ffffffffbea7cd90 0000000000000350 00000000bea7cf70 ffffffffbea7cda0
sr00-03  000000000607b000 0000000000000000 0000000000000000 000000000607b000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040127a10 0000000040127a14
 IIR: 0f8010dc    ISR: 000000003ffff800  IOR: c00007ffbea7cd90
 CPU:        1   CR30: 00000000bea60000 CR31: 0000000011111111
 ORIG_R28: 0000000000000000
 IAOQ[0]: unwind_once+0x370/0x3d0
 IAOQ[1]: unwind_once+0x374/0x3d0
 RP(r2): 0x6fc00000


John's version works too for me and the system now shuts down cleanly.

Cheers,
FJP

P.S. If anybody ever wants access to my box, just ask:
- model: 9000/785/J5600
- cpu: 2 x PA8600 (PCX-W+) at 552.000000 MHz
- memory: 2048 MB
- 3 x 9.1 GB SCSI harddisks
