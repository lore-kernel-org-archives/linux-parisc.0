Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22551482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 13:34:10 -0600 (MDT)
Date: Thu, 23 Aug 2001 15:33:36 -0400 (EDT)
From: <nick@snowman.net>
To: Matthew Wilcox <willy@debian.org>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010823200234.D27374@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0108231532130.16296-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Ok, only one more question hopefully.  I updated my PDC firmware from v2.7
to v6.1, that went fine.  I tried booting a 32bit lifimage, that worked
untill it got to the SCSI, at which point it spat out lots of errors for
id's 0, 1 and 2, then locked.  Is there something special I need to do to
keep C180's scsi happy?  I am useing the debian iso's lifimages right now.
	Nick

On Thu, 23 Aug 2001, Matthew Wilcox wrote:

> On Thu, Aug 23, 2001 at 02:57:17PM -0400, nick@snowman.net wrote:
> > Well thanks to your suggestion I tried not even attempting to change the
> > params and just see what happened.  what I got was
> > The 64-bit Kernel has started...
> > Determining PDC firmware type: Ancient Box (bus_id = 0x0)
> > Kernel panic: This system will probably never run Linux.
> > 
> > In idle task - not syncing
> > 
> > Is that as bad as it sounds?  Can I update the PDC firmware, or would that
> > not help?
> > 	Thanks
> 
> You should run a 32-bit kernel on the C180 :-)
> 
> -- 
> Revolutions do not require corporate support.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
