Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.cacr.caltech.edu (mailhost.cacr.caltech.edu [131.215.145.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44BE6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 17:43:44 -0600 (MDT)
Received: from lugh.cacr.caltech.edu (lugh.cacr.caltech.edu [131.215.145.183])
	by mailhost.cacr.caltech.edu (8.9.3/8.9.1) with ESMTP id QAA17693
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 16:43:42 -0700 (PDT)
Date: Thu, 21 Jun 2001 16:43:42 -0700 (PDT)
From: Al Budriunas <budriuna@cacr.caltech.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.SOL.4.10.10106211604030.8214-100000@lugh.cacr.caltech.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Error creating PALO
List-ID: <linux-parisc.vger.kernel.org>

During the PALO creation phase of the initial installation, an error
message saying "PALO wasn't able to install. You can still remote boot and
point the root device to the installed system".

The install target is an HP 712/60 with a 2.2GB SCSI-SE disk with three
partitions:

sda1 128MB  linux swap fstype 82
sda2 16 MB linux fstype 83
sda3 2GB linux ext2 fstype 83

My intention is to use sda2 for PALO, and sda3 for everything else. Since
I could not find any means of creating F0 fstype for PALO, is assumed the
install/setup process would do that for me. Is that an incorrect
assumption? If so, what steps do I take to create the F0 fstype to install
PALO?

The source is version 0.9 iso image on bootable CDROM, June 1 release.

Your help is greatly appreciated.

Thanks,

Al


------------------------------------------------------------------
Al Budriunas                            email: budriuna@rsn.hp.com  
Hewlett Packard Co.                     voice: 310-535-2884
Los Angeles, Ca.                        
------------------------------------------------------------------
