Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.dpmms.cam.ac.uk (smtp.dpmms.cam.ac.uk [131.111.24.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56843482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Aug 2001 13:58:14 -0600 (MDT)
Date: Sat, 18 Aug 2001 20:55:19 +0100 (BST)
From: Dr Andrew C Aitchison <A.C.Aitchison@dpmms.cam.ac.uk>
To: <caslivkoff@yahoo.com>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michdaen@iiic.ethz.ch>,
	<xpert@xfree86.org>, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [Xpert][parisc-linux] white is blue
In-Reply-To: <3B7EBE4A.B122B1FA@yahoo.com>
Message-ID: <Pine.LNX.4.33.0108182048110.3587-100000@harrier.dpmms.cam.ac.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Sender: Dr Andrew C Aitchison <werdna@dpmms.cam.ac.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 18 Aug 2001 caslivkoff@yahoo.com wrote:
> > > I posted this to the parisc-linux mailing list, but so far, no
> > > responses. Can anyone offer a suggestion? The fbdev driver is "suppos=
ed"
> > > to work with the graphics in the 712/60. I also tried this on a secon=
d
> > > 712 with the same behavior. What's wierd is that other colors appear =
OK.
> > >
> > > I just loaded the ISO on a 712/60 and setup XFree86 to use the fbdev
> > > driver. It seems to be OK, with the exception that "white" is "blue".=
 If

> Michel D=E4nzer wrote:
> > The fbdev driver uses the framebuffer device to set the colormap, which=
 works
> > in general (at least for me ;), so I suspect there is a problem with th=
e
> > framebuffer device.

> Any other ideas?  I thought that possibly the rgb.txt was not getting
> loaded, but I'm fairly certain that it is.

It does sound as though the active colormap isn't being initialized fully.
Does the 712/60 have more than one colormap ?

--=20
Dr. Andrew C. Aitchison=09=09Computer Officer, DPMMS, Cambridge
A.C.Aitchison@dpmms.cam.ac.uk=09http://www.dpmms.cam.ac.uk/~werdna
