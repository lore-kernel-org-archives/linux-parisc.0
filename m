Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.cacr.caltech.edu (mailhost.cacr.caltech.edu [131.215.145.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24CCC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:41:15 -0600 (MDT)
Date: Thu, 21 Jun 2001 17:41:12 -0700 (PDT)
From: Al Budriunas <budriuna@cacr.caltech.edu>
To: bame@riverrock.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: <m15DETo-000OSEC@bame.riverrock.org>
Message-ID: <Pine.SOL.4.10.10106211740150.8214-100000@lugh.cacr.caltech.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 21 Jun 2001 bame@riverrock.org wrote:

> > During the PALO creation phase of the initial installation, an error
> > message saying "PALO wasn't able to install. You can still remote boot and
> > point the root device to the installed system".
> > 
> > The install target is an HP 712/60 with a 2.2GB SCSI-SE disk with three
> > partitions:
> > 
> > sda1 128MB  linux swap fstype 82
> > sda2 16 MB linux fstype 83
> > sda3 2GB linux ext2 fstype 83
> > 
> > My intention is to use sda2 for PALO, and sda3 for everything else. Since
> > I could not find any means of creating F0 fstype for PALO, is assumed the
> > install/setup process would do that for me. Is that an incorrect
> > assumption? If so, what steps do I take to create the F0 fstype to install
> > PALO?
> 
> cfdisk and fdisk both can change a partition type.  in cfdisk select
> the partition you desire and use the [Type] item below.
> 
> palo currently requires that both the "F0" partition, and any partitions
> from which you are going to boot, *end* within the first 2Gbytes, so your
> sda3 is just over the limit.  Perhaps you might make a small /boot
> partition near the front of the drive.
> 
> 	-P
> 

The installation menu for partitioning didn't have an option for F0 in
cfdisk. In fact, there were no options to even use fdisk. The installation
notes mentioned that the /boot flag was ignored in cfdisk (I used it
anyway during the latest attempt). The partition I was intending to use
for PALO is within the first 2GB (sda2, just after swap, sda1).

I'll reinstall again without exceeding the 2GB limitation.

Thanks,

Al
 
------------------------------------------------------------------
Al Budriunas                            email: budriuna@rsn.hp.com  
Hewlett Packard Co.                     voice: 310-535-2884
Los Angeles, Ca.                        
------------------------------------------------------------------
