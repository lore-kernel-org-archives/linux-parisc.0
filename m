Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F752482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:07:53 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15DETo-000OSEC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 18:07:20 -0600 (MDT)
Message-Id: <m15DETo-000OSEC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-reply-to: Your message of "Thu, 21 Jun 2001 16:43:42 PDT."
             <Pine.SOL.4.10.10106211604030.8214-100000@lugh.cacr.caltech.edu>
Date: Thu, 21 Jun 2001 18:07:20 -0600
Sender: bame@riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

> 
> During the PALO creation phase of the initial installation, an error
> message saying "PALO wasn't able to install. You can still remote boot and
> point the root device to the installed system".
> 
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

cfdisk and fdisk both can change a partition type.  in cfdisk select
the partition you desire and use the [Type] item below.

palo currently requires that both the "F0" partition, and any partitions
from which you are going to boot, *end* within the first 2Gbytes, so your
sda3 is just over the limit.  Perhaps you might make a small /boot
partition near the front of the drive.

	-P
