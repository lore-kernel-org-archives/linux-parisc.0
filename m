Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AA5C4866
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Aug 2003 11:36:16 -0600 (MDT)
Date: Wed, 27 Aug 2003 18:36:12 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and IDE DMA support
In-Reply-To: <1062001812.22739.84.camel@dhcp23.swansea.linux.org.uk>
Message-ID: <Pine.LNX.4.44.0308271731570.14906-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 27 Aug 2003, Alan Cox wrote:

> On Maw, 2003-08-26 at 12:46, M. Grabert wrote:
> > - the hard disk performs very bad (just 3.13 MB/s instead of expected
> >   >30 MB/s, tested with similar drive in PC and same hdparm settings)
> >   In fact it shows typical data rates for unsupported DMA transfers
>
> Your drive is in PIO, probably PIO3 or so.

beast:/home/xam# hdparm -i /dev/hda

/dev/hda:

 Model=ST3120022A, FwRev=3.06, SerialNo=5JT04M42
 Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs RotSpdTol>.5% }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=4
 BuffType=unknown, BuffSize=2048kB, MaxMultSect=16, MultSect=16
 CurCHS=16383/16/63, CurSects=4228907259, LBA=yes, LBAsects=234441648
 IORDY=on/off, tPIO={min:240,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4
 DMA modes:  mdma0 mdma1 *mdma2
 UDMA modes: udma0 udma1 udma2 udma3 udma4 udma5
 AdvancedPM=no WriteCache=enabled
 Drive conforms to: ATA/ATAPI-6 T13 1410D revision 2:  1 2 3 4 5 6


Mhh, also "hdparm -d" shows that the "DMA mode" of the hard disk is
"enabled", but I really have the feeling it isn't.


[...]

> > Is unmasq_irq supported? What about DMA? Is it obviously not fixed yet
> > (at least somebody wrote that "ns87415 dma doesn't work reliably on
> >  suckyio-systems" a couple of weeks back)
>
> irq unmasking is a generic IDE property so should be fine on any
> platform with a non prehistoric defunct controller (NS87415 is fine)
>
> > Any hints how to speed up the transfer rate?
>
> Buy a PC ;)

Close ;)
Bought a IDE controller (Silicon Image Sil680) for EUR 15 ...

Hope it works, since I need a quick solution because this machine is used
as a WLAN Bridge/DNS cache/DHCP server/DSL router/Fire server in our house.

> Basically you need to fix DMA support

If I have/had time besides my PhD ... moreover I still have to little
knowledge about IDE stuff and kernel hacking to help.
I think you know the feeling since you're taking a sabbatical to do a MBA ;)

I'm just good at AI stuff (PhD) and parallel computing (former job & hobby).

Anyway, I try to help by testing and experimenting with new kernels
and telling what obvious mistakes I found and what's not running.
I.e. I don't intend to complain but help with what I report.
So far I'm quite happy with the stability of Linux/PA-RISC, so I've
really no reason to complain (rather the opposite: thank you!).


Slan,
  Max
