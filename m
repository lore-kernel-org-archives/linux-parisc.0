Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D163482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 16:13:21 -0600 (MDT)
Date: Tue, 28 Aug 2001 18:12:45 -0400 (EDT)
From: <nick@snowman.net>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>, Helge Deller <deller@gmx.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010828150740.Q7064@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0108281811470.23152-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

ok, what I've finally been able to do is boot to an nfsroot, partition sda
and sdb, then when I try to mke2fs any partition on either drive I get
errors along the lines of
init-2.04# SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
 sdb: sdb1 sdb2
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
 sdb: sdb1 sdb2
Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
resources.

Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
resources.

In interrupt handler - not syncing
Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
resources.

In interrupt handler - not syncing
Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping
resources.

In interrupt handler - not syncing
SysRq: Boot Sync Unmount showPc showTasks showMem loglevel0-8 tErm kIll
killalL
SysRq: Resetting

Is that usefull at all, and if not what would be usefull?
	Thanks
		Nick


On Tue, 28 Aug 2001, Richard Hirst wrote:

> I don't recall any reports that C180 works, so it might just not be
> supported.  
> 
> I can tell from your log that the scsi chip is basically working, it
> has executed a few script instructions, but in each case it has hung
> on a SELECT instruction.  If there is no device on a given ID the
> chip should interrupt and say so; in this case there is no interrupt,
> so the higher level code times out and resets.  From the log it appears
> that the chip hasn't tried to generate an interrupt, so it is not just
> an interrupt routing problem.
> 
> Do you have terminators on your scsi bus?
> 
> What devices are present, on which scsi IDs?
> 
> If you let it run on beyond this point does it continue to generate
> errors for scsi IDs up to ID 6?
> 
> I guess the C180 has more than one scsi bus, these errors relate to the
> narrow scsi bus, probably used for the CDROM.  If your disks are on
> another scsi bus, and you can install va the network, you could perhaps
> get going that way.
> 
> Feel free to send me a complete log of the boot msgs.
> 
> Richard
> 
> 
> On Thu, Aug 23, 2001 at 10:19:16PM -0400, nick@snowman.net wrote:
> > SCSI subsystem driver Revision: 1.00
> > sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86, options 0
> > scsi0: Revision 0x2
> > Post test1, istat 01, sstat0 00, dstat 84
> > sim700: WARNING IRQ probe failed, (returned 0)
> > scsi0: Good, target data areas are dma coherent
> > scsi0: test 1 completed ok.
> > scsi0 : LASI/Simple 53c7xx
> > scsi0: Unable to abort command for target 0
> > scsi0: Unable to send Bus Device Reset for target 0
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 00088018 (script[0x0006]), dsps = 00088448, target = 0
> > scsi0: Failing command for ID0
> > scsi0: Unable to abort command for target 0
> > scsi0: Unable to abort command for target 1
> > scsi0: Unable to send Bus Device Reset for target 1
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 00088018 (script[0x0006]), dsps = 00088448, target = 0
> > scsi0: Failing command for ID0
> > scsi0: Unable to abort command for target 1
> >   Vendor:           Model:                   Rev:     
> >   Type:   Direct-Access                      ANSI SCSI revision: 00
> > scsi0: Unable to abort command for target 2
> > scsi0: Unable to send Bus Device Reset for target 2
> > scsi0: Unable to do SCSI bus reset
> > scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> > scsi0: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
> > scsi0: dsp = 00089018 (script[0x0406]), dsps = 00089448, target = 0
> > scsi0: Failing command for ID1
> > scsi0: Unable to abort command for target 2
> > 
> > 
> > If you need more of the boot messages I can provide them.
> > 	Nick
> > 
> > On Fri, 24 Aug 2001, Matthew Wilcox wrote:
> > 
> > > On Thu, Aug 23, 2001 at 03:33:36PM -0400, nick@snowman.net wrote:
> > > > Ok, only one more question hopefully.  I updated my PDC firmware from v2.7
> > > > to v6.1, that went fine.  I tried booting a 32bit lifimage, that worked
> > > > untill it got to the SCSI, at which point it spat out lots of errors for
> > > > id's 0, 1 and 2, then locked.  Is there something special I need to do to
> > > > keep C180's scsi happy?  I am useing the debian iso's lifimages right now.
> > > 
> > > I don't recognise this problem, can you post the SCSI messages?
> > > 
> > > -- 
> > > Revolutions do not require corporate support.
> > > 
> > > 
> > > _______________________________________________
> > > parisc-linux mailing list
> > > parisc-linux@lists.parisc-linux.org
> > > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> > > 
> > 
> > 
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> > 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
