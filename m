Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from openbsd1.buttafuoco.net (3ff839a7.dsl.flashcom.net [63.248.57.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDDDC4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 12:12:37 -0700 (MST)
Date: Wed, 21 Feb 2001 14:12:37 -0500 (EST)
Message-Id: <200102211912.f1LJCbp28371@openbsd1.buttafuoco.net>
From: "Jim Buttafuoco" <jim@tylerdrive.org>
To: "Bryan W. Headley" <bheadley@interaccess.com>,
	Jim Buttafuoco <jim@tylerdrive.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD boot help with 735
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Bryan,

   Get the latest PALO tree.  The directions are in the README file.  I 
found if you follow the kernel building instructions from the parisc-
linux.org web site, you can't go wrong....

Jim

> Jim Buttafuoco wrote:
> 
> > Bryan,
> >
> > What CD are you using.  I couldn't get the .5 version to work on my
> > 735.  I did create my own kernel and booted via the network. Let me
> > know if you need any help.
> >
> 
> I'll read up on how to do that. I am indeed using the .5 version.
> 
> I don't know what the bootstrap requirements are a network boot. 
Let's assume that making a CD is easier. I can
> build a kernel on the x86 and put the new kernel onto a cd image. 
Question: what's the parameters to mkisofs to
> specify the boot image? El Toritto? Generic boot? That Sun boot track 
thing?
> 
> (In the meantime, I'll read up on network booting)
> 
> >
> > Jim
> >
> > > Hi,
> > >
> > > Am trying to boot the CDROM, but keep getting "ENTRY_INIT status 
= -4"
> > > and a few lines of hex. Never
> > >
> > > 1) The above occurs on the console, routed to built-in video. 
Should I
> > > have done something to redirect console messages to
> > >     COMM port beforehand? Have a laptop attached to be the serial
> > > console, but obviously to no effect
> > > 2) Just being stupid: 9600 8 N 1, COM port A for the serial 
console,
> > > right?
> > > 3) Should I try, "b scsi.6.0 IPL" or without the IPL?
> > >
> > > This is on a 735 box. Your help much appreciated.
> > >
> > >
> > > --
> > > ____               .:.                 ____
> > > Bryan W. Headley - bheadley@interaccess.com
> > >
> > >
> > > ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿéj¸¬sùb&#382;ìfj)b&#382;
> >         b²ÚZ®+þX§»å&#352;Ëlþ&#8211;«&#352;Çÿ&#8211;)
îÇú+&#8218;m§ÿÿ&#8211;+-³úZ®+þX§»è®Ü&#8218;/Û&#352;æj)
> > fjå&#352;Ëb?ú?¥ªâ±Ïå&#352;{±
> > >
> > >
> 
> --
> ____               .:.                 ____
> Bryan W. Headley - bheadley@interaccess.com
> 
> 
> 
> 
