Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta04.chello.at (viemta04.chello.at [195.34.133.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEB2A482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Apr 2001 09:33:03 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3AE1A805.C60DF838@dot.at>
Date: Sat, 21 Apr 2001 17:32:21 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Jason Saggers <psyclone@owbn.net.nz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Hello and Question about the E45
References: <000001c0ca50$2b6c82e0$0414a8c0@darknight.gen.nz>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello !

At the moment, I am the only person who had booted Linux on an
E-server, I have the E55.

The E55 (and the others) have proprietary interfaces and three main
points
are affected:
	- serial multiport (serial console on port 0 !!!)
	- SCSI disks and SCSI sub system
	- parallel port

For the first (serial console) I wrote some "hacks" for the linux
kernel.
I added a tty-device driver for the PDC ROM console (polling, etc....),
and now I can boot the machine, with NFSROOT of course. Even login, etc
is working correctly.

If you have interest in more detail or in my kernel tree for the E55,
please
email to me.

I think for some debugging purposes or problems with serial devices, my
kernel add-on can also be interesting for the main-stream of linux.

With friendly regards
	Christoph Plattner

BTW: My new email address is 
	christoph.plattner@gmx.at    -- soon.

------------------------

Jason Saggers wrote:
> 
> Hi,
> 
>         I realiase that the E45's arent completely support by this project, but has anyone succeded in getting on to boot etc...
> 
>         I am getting it to boot part why... and the just stops..... No errors nothing
> 
>         Any information would be appreciated.  I am currently using the 0.5 iso images.  Am about to try the later kernels etc in the next couple of days.
> 
> Jason
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
