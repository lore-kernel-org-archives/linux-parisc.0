From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BTLBs usable as HUGHTLBs ?
Date: Sun, 31 Oct 2004 10:33:39 -0700
Message-ID: <20041031173339.GB18072@colo.lackof.org>
References: <200410311504.30552.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200410311504.30552.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 31, 2004 at 03:04:30PM +0100, Helge Deller wrote:
> Since HPPA offers Block-TLBs (BTLBs), couldn't those be used
> comparable/wrapped as so-called HUGHTLBs (CONFIG_HUGETLBFS)
> as available on i386/ia64 ?

I think so. But here is one caveat.
IIRC, PDC calls are required to program the BTLB entries. If that's
correct, then they will be SLOW.  On A500, each PCI Cfg write took
20ms when using PAT PDC vs 4us when using direct access. YMMV depending
on platform and how PDC is stored/loaded on that platform. My advice
is to measure some simple PDC call by reading cr16  before/after
the call. Then do the math to see if it's worth it.

AFAIK, BTLB was only intended for things like GFX buffers,
kernel data/text, and similarly long lived mappings.
Is HugeTLBFS generally used that way?

> from /proc/cpuinfo on my 715/64:
> BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
> BTLB fix-entr.  : 0 instruction, 0 data (8 combined)		<--- 8

8*64MB == 512MB
That's not as bad as I thought for a PA1.1 machine.
IIRC, first generation BTLB only has 2 entries.

hth,
grant
