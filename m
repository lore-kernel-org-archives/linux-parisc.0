Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp010.mail.yahoo.com (smtp010.mail.yahoo.com [216.136.173.30])
	by dsl2.external.hp.com (Postfix) with SMTP id 4C266482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Aug 2001 13:10:44 -0600 (MDT)
Sender: chuck@dsl2.external.hp.com
Message-ID: <3B7EBE4A.B122B1FA@yahoo.com>
Date: Sat, 18 Aug 2001 15:13:14 -0400
From: caslivkoff@yahoo.com
MIME-Version: 1.0
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michdaen@iiic.ethz.ch>
Cc: xpert@XFree86.Org, parisc-linux@lists.parisc-linux.org
Subject: Re: [Xpert][parisc-linux] white is blue
References: <3B7DE89A.5A665A16@yahoo.com> <3B7E9021.AA279076@iiic.ethz.ch>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

[[ I'm cross-posting this to both mailing lists.  ]]
[[ Someone let me know if this is a problem.      ]]

Michel D=E4nzer wrote:
> =

> caslivkoff@yahoo.com wrote:
> =

> > I posted this to the parisc-linux mailing list, but so far, no
> > responses. Can anyone offer a suggestion? The fbdev driver is "suppos=
ed"
> > to work with the graphics in the 712/60. I also tried this on a secon=
d
> > 712 with the same behavior. What's wierd is that other colors appear =
OK.
> > I'm attaching the XFree86.0.log.
> >
> > -----------------------------------------------------
> >
> > I just loaded the ISO on a 712/60 and setup XFree86 to use the fbdev
> > driver. It seems to be OK, with the exception that "white" is "blue".=
 If
> > I xwd the root  window dump and examine it on another X display, it
> > looks fine.
> =

> The fbdev driver uses the framebuffer device to set the colormap, which=
 works
> in general (at least for me ;), so I suspect there is a problem with th=
e
> framebuffer device.

That's what I though too, but I've tried this on 2 different 712's and
have the same behavior. What is strange is that the framebuffer can
display white text with no problem on the console (the default cursor is
white). Also, under X, specifying #fefefe shows up as "almost white".

Any other ideas?  I thought that possibly the rgb.txt was not getting
loaded, but I'm fairly certain that it is.

_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
