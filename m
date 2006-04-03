From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 2 Apr 2006 20:02:59 -0600
Message-ID: <20060403020259.GB8315@parisc-linux.org>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be> <200604021129.31095.deller@gmx.de> <442FB31A.5040308@tiscali.be> <200604021515.04424.deller@gmx.de> <20060403012831.GB12037@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <willy@parisc-linux.org>
In-Reply-To: <20060403012831.GB12037@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Apr 02, 2006 at 07:28:31PM -0600, Grant Grundler wrote:
> > So, the problem is really the 64MB ioremap() from lba_pci.c:1216.
> > Grant, Willy, ... : Is it possible to reduce it or to iounmap() it again ?
> 
> Unfortunately not. Not unless you want to disable IO Port space access.
> Each PCI bus controller routes 64MB of GMMIO space to 64KB of IO port space.
> The first 4 bytes of each page maps to a unique 4 byte in IO Port space.
> 
> On Astro platforms, we can use 64KB in LMMIO space to access
> IO Port space for all busses. The difference is Astro only
> has one SBA and IOC. N-class has two. There's more to this
> and I'm not sure of all the details at the moment.
> 
> 240MB is clearly not going to be enough on that machine.
> Even on a "normal" machine, a couple of graphics cards
> would exhaust the 240MB.  A single infiniband card could
> exhaust the 240MB space we have now.

I think using page tables to map IO Port space isn't really necessary.
We can use the (slightly inappropriately named) gsc_read/writeX to access
that area.

Also, there should be loads of virtual memory space available to us with
a 64-bit kernel, and we should definitely look at increasing the amount
of vmalloc space available with 64-bit.
