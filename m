Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pismo (dclient217-162-20-87.hispeed.ch [217.162.20.87])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95D47482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Aug 2001 13:29:40 -0600 (MDT)
Sender: daenzer@dsl2.external.hp.com
Message-ID: <3B7EC209.87A159D2@iiic.ethz.ch>
Date: Sat, 18 Aug 2001 21:29:13 +0200
From: Michel =?iso-8859-1?Q?D=E4nzer?= <michdaen@iiic.ethz.ch>
MIME-Version: 1.0
To: caslivkoff@yahoo.com
Cc: xpert@XFree86.Org, parisc-linux@lists.parisc-linux.org
Subject: Re: [Xpert][parisc-linux] white is blue
References: <3B7DE89A.5A665A16@yahoo.com> <3B7E9021.AA279076@iiic.ethz.ch> <3B7EBE4A.B122B1FA@yahoo.com>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

caslivkoff@yahoo.com wrote:

> Michel Dänzer wrote:
> >
> > caslivkoff@yahoo.com wrote:
> >
> > > I posted this to the parisc-linux mailing list, but so far, no
> > > responses. Can anyone offer a suggestion? The fbdev driver is "supposed"
> > > to work with the graphics in the 712/60. I also tried this on a second
> > > 712 with the same behavior. What's wierd is that other colors appear OK.
> > > I'm attaching the XFree86.0.log.
> > >
> > > -----------------------------------------------------
> > >
> > > I just loaded the ISO on a 712/60 and setup XFree86 to use the fbdev
> > > driver. It seems to be OK, with the exception that "white" is "blue". If
> > > I xwd the root  window dump and examine it on another X display, it
> > > looks fine.
> >
> > The fbdev driver uses the framebuffer device to set the colormap, which
> > works in general (at least for me ;), so I suspect there is a problem with
> > the framebuffer device.
> 
> That's what I though too, but I've tried this on 2 different 712's and
> have the same behavior.

But I assume you use the same framebuffer device on both? (Note that when I
say framebuffer device, I refer to the Linux kernel driver)

> What is strange is that the framebuffer can display white text with no
> problem on the console (the default cursor is white). Also, under X,
> specifying #fefefe shows up as "almost white".

There are no known problems with the XFree86 fbdev colormap handling, but
maybe you have found one... :)


> Any other ideas?  I thought that possibly the rgb.txt was not getting
> loaded, but I'm fairly certain that it is.

You can easily check with grep -i rgb /var/log/XFree86.0.log .


-- 
Earthling Michel Dänzer (MrCooper)    \   Debian GNU/Linux (powerpc) developer
CS student, Free Software enthusiast   \        XFree86 and DRI project member
