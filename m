Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC558482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:05:00 -0600 (MDT)
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: Your message of "Thu, 21 Jun 2001 16:43:42 PDT."
             <Pine.SOL.4.10.10106211604030.8214-100000@lugh.cacr.caltech.edu>
References: <Pine.SOL.4.10.10106211604030.8214-100000@lugh.cacr.caltech.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Jun 2001 18:07:47 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010622000747.175BE37D2C@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Al Budriunas writes...

> The install target is an HP 712/60 with a 2.2GB SCSI-SE disk with three
> partitions:
> 
> sda1 128MB  linux swap fstype 82
> sda2 16 MB linux fstype 83
> sda3 2GB linux ext2 fstype 83
> 
> My intention is to use sda2 for PALO, and sda3 for everything else. Since
> I could not find any means of creating F0 fstype for PALO, is assumed the
> install/setup process would do that for me. Is that an incorrect
> assumption? If so, what steps do I take to create the F0 fstype to install
> PALO?

The partition types are set during the disk partitioning phase of the install 
when running the "cfdisk" tool.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
