Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id AED74482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:57:50 -0600 (MDT)
Date: Thu, 23 Aug 2001 14:57:17 -0400 (EDT)
From: <nick@snowman.net>
To: Matthew Wilcox <willy@debian.org>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010823194014.C27374@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0108231456280.16296-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Well thanks to your suggestion I tried not even attempting to change the
params and just see what happened.  what I got was
The 64-bit Kernel has started...
Determining PDC firmware type: Ancient Box (bus_id = 0x0)
Kernel panic: This system will probably never run Linux.

In idle task - not syncing

Is that as bad as it sounds?  Can I update the PDC firmware, or would that
not help?
	Thanks
		Nick

On Thu, 23 Aug 2001, Matthew Wilcox wrote:

> On Thu, Aug 23, 2001 at 02:21:10PM -0400, nick@snowman.net wrote:
> > I'm not even getting that far.  I can't get the linux kernel to start
> > booting, I always get errors along the lines of 
> > Current command line:
> > vmlinux HOME=/ TERM=vt100 root=/dev/nfs nfsroot=172.16.1.1:/mnt
> > console=ttyS0
> >  0: vmlinux
> >  1: HOME=/
> >  2: TERM=vt100
> >  3: root=/dev/nfs
> >  4: nfsroot=172.16.1.1:/mnt
> >  5: console=ttyS0
> > Edit which field?
> > (or 'b' to boot with this command line)? b
> > Kernel: partition 0 file vmlinux
> > ERROR: Read from boot device failed (status = -3).
> > byteio_read: seekread() returned -1 expected 2048
> 
> You're running into a known palo bug.  Sometimes when you're editing
> entries it does this.  No-one's tracked down the cause yet (and it
> is sporadic).
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
