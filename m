Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id E87F6482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 03:44:06 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sLKs-0007Ei-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 11:44:02 +0200
Date: Sat, 13 Oct 2001 11:43:59 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Followup: 735/125 hangs...
Message-ID: <20011013114359.A1681@dogbert.localdomain>
References: <Pine.LNX.4.21.0110122341540.766-100000@ibanez.csuder.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0110122341540.766-100000@ibanez.csuder.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

Hello,

My 720/50 had similiar problems. I don't know what kind of SCSI chipset
you have, but I needed to add the following kernel command line
parameter to get my SCSI disks to work properly:

sim700=noneg:0xff,nodisc:0xff or sim700=nodisc:0xff

This more or less solved my problems. Writing the superblock info still
took some time (think 10 minutes), but it got it done. :-)

In a message from Richard Hirst a few days ago, when he checked in a new
driver for the 53c700 and 53c710 chips:

The main improvements in this driver are sync transfers (where the scsi
chip allows it) and tagged commands.  Also disconenct/reselect works
properly, so there is no longer any need to boot with sim700=nodisc:0xff
(or similar).

So I guess if you compile the latest kernel, and make a new debian
bootfloppies lifimage to boot from, you should be fine. Alternatively,
the options above might also fix your problems with the LOOP_CTL thingy.

When in doubt, do a network install. :-)

Regards,

Albert

On Fri, 12 Oct 2001, Christian Suder wrote:

> 
> FWIW, 
> 
> I repartitioned the HD, from boot-swap-root to boot-root-swap. Formatting
> the filesystem went until after the message about tune2fs
> appears. Powercycled and did not format again but selected 'use existing
> fs'. Hangs with : 'ioctl: LOOP_CLR_FD: No such device or address' when
> installing the system image. 
> 
> Tried the same excercise again and got lots of 
> 
>  - block = 4244379656, count = 1
> EXT2-fs error (device sd(8,2)): ext2_free_blocks: Freeing blocks not in
> datazone - block = 4269604550, count = 1
> 
> Hmmm.... saw the same when the C110 had problems. 
> 
> Used the same CD on a 712/80 with no problems at all !
> 
> 	Christian
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
