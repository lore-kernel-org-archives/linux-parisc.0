Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B1E2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 21:06:57 -0600 (MDT)
Date: Tue, 28 Aug 2001 21:06:55 -0600
To: nick@snowman.net
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <willy@debian.org>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
Message-ID: <20010828210655.A24960@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <20010828150740.Q7064@linuxcare.com> <Pine.LNX.4.21.0108281811470.23152-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0108281811470.23152-100000@ns>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

Arg.... I recongnize this message :(

Nick,

Can you tell me which kernel you are using, and how much
RAM you have in the C180?  This message means that the ccio
driver can not find any available resources in the IO page
directory to allocate for the DMA trasaction.

Thanks,

- Ryan

On Tue, Aug 28, 2001 at 06:12:45PM -0400, nick@snowman.net wrote:
> ok, what I've finally been able to do is boot to an nfsroot, partition sda
> and sdb, then when I try to mke2fs any partition on either drive I get
> errors along the lines of
> init-2.04# SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
>  sdb: sdb1 sdb2
> SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
>  sdb: sdb1 sdb2
> Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> resources.
> 
> Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> resources.
> 
> In interrupt handler - not syncing
> Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> resources.
> 
> In interrupt handler - not syncing
> Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
> resources.
> 
> In interrupt handler - not syncing
> SysRq: Boot Sync Unmount showPc showTasks showMem loglevel0-8 tErm kIll
> killalL
> SysRq: Resetting
> 
> Is that usefull at all, and if not what would be usefull?
> 	Thanks
> 		Nick
