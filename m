Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13641
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 10:11:33 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 30 Dec 2000 17:14:46 -0000
Subject: Re: [parisc-linux] performance
To: grundler@cup.hp.com (Grant Grundler)
Date: Sat, 30 Dec 2000 16:50:18 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), parisc-linux@thepuffingroup.com
In-Reply-To: <200012300613.WAA24743@milano.cup.hp.com> from "Grant Grundler" at Dec 29, 2000 10:13:32 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14CPD3-0006mh-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Given only a handful of people know the PARISC CPU/TLB as well as jsm,
> and I (re)wrote the HPUX PCI code, I suggest long term performance
> gains will be found in linux VM/PM (and other "architected" stuff like
> atomic operations - which will always suck on parisc) and drivers.
> (My definition of drivers includes networking stack and NIC device drivers).
> Short term goal is to optimize existing parisc-specific code around
> existing architecture.

Much of the work Ingo and others did concentrated on the eepro100 driver
internals down to removing every pci stall, doing irq affinity and doing small
optimisations on the networking stack.

So I'd say your suggestion matches what happened on x86 too. The atomic stuff
is trickier. Linux is designed to optimal on the common high performance 
hardware and right now the design therefore focuses on ia32 at the cost 
sometimes of other systems.

Alan
