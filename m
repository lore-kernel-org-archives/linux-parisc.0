Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 79AE7482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Aug 2001 13:48:52 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Michel =?iso-8859-1?q?D=E4nzer?= <michdaen@iiic.ethz.ch>,
	caslivkoff@yahoo.com
Subject: Re: [Xpert][parisc-linux] white is blue
Date: Sat, 18 Aug 2001 21:46:46 +0200
Cc: xpert@XFree86.Org, parisc-linux@lists.parisc-linux.org
References: <3B7DE89A.5A665A16@yahoo.com> <3B7EBE4A.B122B1FA@yahoo.com> <3B7EC209.87A159D2@iiic.ethz.ch>
In-Reply-To: <3B7EC209.87A159D2@iiic.ethz.ch>
MIME-Version: 1.0
Message-Id: <20010818194852.79AE7482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > That's what I though too, but I've tried this on 2 different 712's and
> > have the same behavior.
>
> But I assume you use the same framebuffer device on both? (Note that when I
> say framebuffer device, I refer to the Linux kernel driver)

Both 712 have the same Graphics chip ("Artist") and use the same stifb driver (it's 
also the only one which supports HP's build-in graphics atm).

> > What is strange is that the framebuffer can display white text with no
> > problem on the console (the default cursor is white). Also, under X,
> > specifying #fefefe shows up as "almost white".
>
> There are no known problems with the XFree86 fbdev colormap handling, but
> maybe you have found one... :)

This is definitively a bug in the linux kernel stifb driver.
I wrote (migrated) most parts of this stifb driver and it works perfectly without any
color-problems together with the XFree86 fbdev driver here on my 715/64. 
The 715/64 has the Artist graphics chip too, so I suspect we just need some more 
initialization for the "older revisions" of the Artist chip in the 712 machines.

Greetings,
Helge
