Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA06533
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Dec 2000 23:09:05 -0700
Message-Id: <200012300613.WAA24743@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] performance 
In-reply-to: Your message of "Wed, 27 Dec 2000 18:08:29 PST."
             <E14BL04-0002Zj-00@the-village.bc.nu>
Date: Fri, 29 Dec 2000 22:13:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan,
Interesting comments. I had to think about them for a bit.

Alan Cox wrote:
> Specweb is basically a con. Its not a materially valuable benchmark.
> It benches how fast your irq handler path is, how fast your memory cache
> is, how good your DMA transfers are. It has almost nothing to do with how
> good a web server the box is.

At some level, all benchmarks are bogus. Bogomips encapsulates the issue.
Taking the benchmarks out of context is when the con game starts.
Isn't Specweb just one aspect of what makes a good webserver?
Others include cost, size, security, manageability, reliability, etc.
It just seems CPU/Memory/IO "bandwidth" and utilization (efficiency) are
valid things to measure. An outsiders perspective is Specweb attempts to
encapsulate those numbers with a representative workload.

Marketing drives most benchmarking I've been involved in.
And Marketing targets the more ignorant (but not too poor) customers. 
Smart (and rich) customers use specific benchmarks make a "short list"
and then measure *their* application performance.
HP has several "Capacity Planning Centers" just for those customers.

[ deleted comment about putting webserver in kernel ]

> So it comes down to - tuning the network card driver, tuning the IRQ path, 
> making sure the cache handling is optimal. The rest consists of loading the
> machine with 8Gbytes of RAM, using obscenely smart ethernet cards and having
> good memory bandwidth.
> 
> The 64bit pa-risc boxes have the hardware for it, in fact they have better 
> hardware for it than x86. All you have to do is write better tlb, irq and pci
> handling code than the HP/UX engineering team 8).

Given only a handful of people know the PARISC CPU/TLB as well as jsm,
and I (re)wrote the HPUX PCI code, I suggest long term performance
gains will be found in linux VM/PM (and other "architected" stuff like
atomic operations - which will always suck on parisc) and drivers.
(My definition of drivers includes networking stack and NIC device drivers).
Short term goal is to optimize existing parisc-specific code around
existing architecture.

[ /rant on ]
The HPUX engineering team is not lacking in talent - just opportunity to
make the zillions of small changes required to improve scalability and
reduce CPU utilization. Any single change resulting in less than 2%
performance improvement on something like SpecWeb is very hard to get
into HPUX kernel.
[ /rant off ]

grant
