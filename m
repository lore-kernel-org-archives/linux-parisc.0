From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Tue, 5 Apr 2016 16:15:36 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1604051612310.32758@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com> <570409DA.1060508@gmx.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <570409DA.1060508@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 5 Apr 2016, Helge Deller wrote:

> On 05.04.2016 19:36, Mikulas Patocka wrote:
> > On Tue, 5 Apr 2016, Mikulas Patocka wrote:
> > 
> >> Hi
> >>
> >> The patch "parisc: Use generic extable search and sort routines" makes the 
> >> kernel unable to load any modules. It fails with:
> >>
> >> module unix: Unknown relocation: 9
> >> modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format
> >>
> >> When I revert the patch, the kernel 4.6-rc2 boots fine.
> >>
> >> Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
> >> doesn't handle the new relocation type.
> >>
> >> Mikulas
> > 
> > BTW. I'm using hppa64 binutils 2.21 to build the kernel. It generates the 
> > R_PARISC_PCREL32 relocation that the kernel module loader doesn't handle:
> 
> 
> Can you try attached patch (untested) ?
> 
> Helge

I tried a similar patch, the system booted fine ... but then I discovered 
that the system boots fine no matter what value is written to *loc.

Apparently, none of the modules trigger any exceptions in my 
configuration.

I'll have to create a test module that triggers some exception.

Mikulas
