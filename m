Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FB58482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 00:11:36 -0600 (MDT)
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15x0DH-000OzaC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 00:11:27 -0600 (MDT)
Message-Id: <m15x0DH-000OzaC@bame.riverrock.org>
To: Daniel Williams <dan@bigw.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to Boot CD on C110 
In-Reply-To: Your message of "Fri, 26 Oct 2001 00:32:56 CDT."
             <E8D73E09-C9D2-11D5-8938-0030657D1C94@bigw.org>
References: <E8D73E09-C9D2-11D5-8938-0030657D1C94@bigw.org> 
Date: Fri, 26 Oct 2001 00:11:27 -0600
From: Paul Bame <bame@riverrock.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 
> For making a boot CD, what exactly has to be done to make it boot?  How 
> does the firmware recognize that a particular media is bootable and what 
> steps does it then take to load the bootstrap code into memory and from 
> where on the media does that bootstrap code come?  Can the kernel be 
> loaded from a plain ISO or does there need to be special 'first block 
> magic code' that will do the rest?

Yes there's a special first block, and our ISO images always have it.
The details of the block are well described.  Check the palo README.html,
or the palo data structure 'struct firstblock', or the PDC (firmware)
documents accessable from parisc-linux.org.

But I bet you didn't really want to know how to calculate checksums
and poke magic values into the first block :-)

> If I try to boot of 'core.SCSI.2.0' it comes back and says ENTRY_INIT, 
> nextline STATUS=-7, and then a couple of rows of 8 digit numbers, the 
> first being 00000080.  What's it trying to do here?

Another part of the firmware is called IODC, and I think there's
an iodc.pdf on line.  In there you can search for ENTRY_INIT, which is
a firmware procedure call, and look for the return status of -7 (If you
can't search PDF, look for something like ENTRY_IO and BOOTDEV_READ.
Sorry I don't recall what -7 is, but I'm guessing with your other symptoms
it's saying it can't even initialize the device, because it can't see it.

Until your 'search' command sees something I don't think booting
is going to work.  'Search' cycles through SCSI addresses
and while it's running you should see flashing access lights on
SCSI devices which have them like the CD.  'search' will display
the bootable devices despite what's on the media, though may not
show removable-media devices which are unloaded.  I'm betting on a
cable, connector, or termination problem -- hopefully not a fried
SCSI controller.

Good luck!

	-Paul Bame
