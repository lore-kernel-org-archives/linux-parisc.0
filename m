Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA17927
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 19:19:19 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id AAB6481B
	for <parisc-linux@thepuffingroup.com>; Thu,  5 Oct 2000 18:20:18 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id SAA05210
	for <parisc-linux@thepuffingroup.com>; Thu, 5 Oct 2000 18:24:29 -0700 (PDT)
Message-Id: <200010060124.SAA05210@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] udelay() inconsistent 
In-reply-to: Your message of "Thu, 05 Oct 2000 17:37:34 PDT."
             <200010060037.RAA05141@milano.cup.hp.com>
Date: Thu, 05 Oct 2000 18:24:21 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> I still need to work on the "CACHE TEST FAILED: script execution failed."
> messages. I'm pretty sure those are due to LCI instruction being (mis-)used
> in sba_iommu.c.

I ditched the __LP64__ code in sba_iommu.c (uses asm("lci..")) in order to
use the same code as 32-bit uses. The scsi "CACHE TEST" failures went away.

So if anyone can make the LCI work...I'll think of a suitable reward...
(something better than a 710...perhaps a 4GB, 7200RPM, SE SCSI disk?
or a dual headed GSC graphics card?)


But on this run the ms/D_cr16 values do NOT agree:
...
sym53c875-0: rev 0x3 on pci bus 1 device 5 function 0 irq 769
ncrgetfreq()  mdelay(1) = 398649  INW(nc_sist) costs cr16 576
ncrgetfreq()  ms 91  D_cr16 71007434
ncrgetfreq()  mdelay(1) = 796482  INW(nc_sist) costs cr16 585
ncrgetfreq()  ms 80  D_cr16 63473212
ncrgetfreq()  mdelay(1) = 796482  INW(nc_sist) costs cr16 594
ncrgetfreq()  ms 81  D_cr16 63570830
sym53c875-0: NCR clock is 109732KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf4901000
ncrgetfreq()  mdelay(1) = 398488  INW(nc_sist) costs cr16 580
ncrgetfreq()  ms 87  D_cr16 68386143
ncrgetfreq()  mdelay(1) = 796482  INW(nc_sist) costs cr16 566
ncrgetfreq()  ms 108  D_cr16 85026462
ncrgetfreq()  mdelay(1) = 796482  INW(nc_sist) costs cr16 591
ncrgetfreq()  ms 108  D_cr16 85728994
sym53c875-0: PCI clock (82299 KHz) is out of range [22688 KHz - 45375 KHz].
sym53c875-0: giving up ...
sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 513
...

(ie 85728994/400000 = 214 != 108)

later,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
