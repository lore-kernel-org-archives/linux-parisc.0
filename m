From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 2 Apr 2006 19:28:31 -0600
Message-ID: <20060403012831.GB12037@colo.lackof.org>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be> <200604021129.31095.deller@gmx.de> <442FB31A.5040308@tiscali.be> <200604021515.04424.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200604021515.04424.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Apr 02, 2006 at 03:15:04PM +0200, Helge Deller wrote:
...
> > IOREMAP: phys=fffffff200000000, size=4000000	BUT THIS BIG 64MB CHUNK FAILS.
> > allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
> > IOREMAP: phys=ffffffffbffea000, size=1000
> > IOREMAP: remapped to 0000000000048000		OTHER SMALLER ONES OK AGAIN..
> > LBA version TR4.0 (0x5) found at 0xffffffffbffea000
> 
> So, the problem is really the 64MB ioremap() from lba_pci.c:1216.
> Grant, Willy, ... : Is it possible to reduce it or to iounmap() it again ?

Unfortunately not. Not unless you want to disable IO Port space access.
Each PCI bus controller routes 64MB of GMMIO space to 64KB of IO port space.
The first 4 bytes of each page maps to a unique 4 byte in IO Port space.

On Astro platforms, we can use 64KB in LMMIO space to access
IO Port space for all busses. The difference is Astro only
has one SBA and IOC. N-class has two. There's more to this
and I'm not sure of all the details at the moment.

240MB is clearly not going to be enough on that machine.
Even on a "normal" machine, a couple of graphics cards
would exhaust the 240MB.  A single infiniband card could
exhaust the 240MB space we have now.

hth,
grant
