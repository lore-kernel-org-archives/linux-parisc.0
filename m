Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC071482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 21:09:28 -0600 (MDT)
Date: Tue, 28 Aug 2001 23:08:49 -0400 (EDT)
From: <nick@snowman.net>
To: rbradetich@uswest.net
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <willy@debian.org>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010828210655.A24960@beavis.ybsoft.com>
Message-ID: <Pine.LNX.4.21.0108282308180.23152-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I have 128meg of ram and am useing the current CVS source compiled
today.  Should I try another kernel?  I have to boot custom kernels as one
of the SCSI drivers hangs the system.
	Nick

On Tue, 28 Aug 2001, Ryan Bradetich wrote:

> Arg.... I recongnize this message :(
> 
> Nick,
> 
> Can you tell me which kernel you are using, and how much
> RAM you have in the C180?  This message means that the ccio
> driver can not find any available resources in the IO page
> directory to allocate for the DMA trasaction.
> 
> Thanks,
> 
> - Ryan
> 
> On Tue, Aug 28, 2001 at 06:12:45PM -0400, nick@snowman.net wrote:
> > ok, what I've finally been able to do is boot to an nfsroot, partition sda
> > and sdb, then when I try to mke2fs any partition on either drive I get
> > errors along the lines of
> > init-2.04# SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
> >  sdb: sdb1 sdb2
> > SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
> >  sdb: sdb1 sdb2
> > Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> > 
> > Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> > 
> > In interrupt handler - not syncing
> > Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> > 
> > In interrupt handler - not syncing
> > Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> > resources.
> > 
> > In interrupt handler - not syncing
> > SysRq: Boot Sync Unmount showPc showTasks showMem loglevel0-8 tErm kIll
> > killalL
> > SysRq: Resetting
> > 
> > Is that usefull at all, and if not what would be usefull?
> > 	Thanks
> > 		Nick
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
