Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.cacr.caltech.edu (mailhost.cacr.caltech.edu [131.215.145.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A38D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:20:18 -0600 (MDT)
Date: Thu, 21 Jun 2001 17:16:52 -0700 (PDT)
From: Al Budriunas <budriuna@cacr.caltech.edu>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: <20010622000747.175BE37D2C@carmen.fc.hp.com>
Message-ID: <Pine.SOL.4.10.10106211709290.8214-100000@lugh.cacr.caltech.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

on Thu, 21 Jun 2001, Matt Taggart wrote:
> Al Budriunas writes...
> 
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
> The partition types are set during the disk partitioning phase of the install 
> when running the "cfdisk" tool.
> 

Matt,

The cfdisk utility didn't have a F0 fstype available. There was a message
during the installation that mentioned this. Hence, my assumption.  

Regards,

Al

--------------------------------------------------------------------
Al Budriunas                            email: budriuna@rsn.hp.com  
Hewlett Packard Co.                     voice: 310-535-2884
Los Angeles, Ca.                        
------------------------------------------------------------------
