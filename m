Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BCA6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Apr 2001 10:22:54 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0FCE5B007; Fri, 20 Apr 2001 17:22:45 +0100 (BST)
Date: Fri, 20 Apr 2001 17:22:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rbradetich@uswest.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic using cpio from cdrom to disk.
Message-ID: <20010420172245.L11226@linuxcare.com>
References: <20010414005252.A9322@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010414005252.A9322@beavis.ybsoft.com>; from rbrad@beavis.ybsoft.com on Sat, Apr 14, 2001 at 12:52:52AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 14, 2001 at 12:52:52AM -0600, Ryan Bradetich wrote:
> Hello parisc-linux hackers,
> 
> A bug (#105) was discovered today reguarding cpio'ing an iso image from
> the cdrom to the disk.  This was a stupid error and I have a quick patch
> for this.  But this leads to my next question....  I am getting a kernel
> panic when perfoming the cpio from the cdrom to the disk.  I am trying
> to verify if their in another problem with the ccio code, or if this is
> a problem witht the scsi driver itself.  Can someone else try it on a
> non-ccio machine and see if fails for them also.  [Note:  The cdrom
> content should not matter, in this case I have an i386 debian disk I 
> was cpio'ing over because it was handy.]

I just tried (with a suse install cd), on my B180, using the 53c710 i/f,
without any problems.

> Disk to disk transfers seem to work fine under ccio...
> 
> Thanks,
> 
> - Ryan
> 
> 
> vega:/tmp# mount /dev/sr0 /cdrom
> ISO 9660 Extensions: RRIP_1991A
> vega:/tmp# find /cdrom | cpio -pm /tmp   
> scsi1: Unexpected Illegal Instruction, script[0002]
> scsi1: script[fffffffe]: 00000000 00000000 60000200 00000000 7c1bef00 00000000 41040000 00182448
> scsi1: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip
> scsi1: istat = 00, sstat0 = 00, sstat1 = 00, dstat = 00
> scsi1: dsp = 00182008 (script[0x0802]), dsps = 7b255263, target = 0
> scsi1: Failing command for ID2

What appears to have happened here is that the driver tried to start a
command on scsi ID 2, which it does by writing 00182000 in to DSP in this
case.  The scsi chip then picks up an instruction from that address and
and decides it is not a valid instruction.  The memory is correct though,
reported as 60000200 00000000 above.  That data is static in memory from
driver startup - it doesn't get modified on the fly.  The memory is
allocated at startup via pci_alloc_consistant().

I'd guess that the iommu entry for the scsi chip to access that consistent
memory got trashed.

> Dumping Stack from 1027e000 to 1027e2c0:

Errors similar to that above from the scsi driver don't usually take the
machine out, so I'd guess something else went wrong also.

Richard
