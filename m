Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD900140D.dip.t-dialin.net [217.0.20.13])
	by dsl2.external.hp.com (Postfix) with SMTP id 20870482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 18:00:23 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3AF8888C.A8AB2BC9@fischlustig.de>
Date: Wed, 09 May 2001 02:00:12 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drivers, sound
References: <3AF878EA.3F043FD7@fischlustig.de> <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:

> On Wed, May 09, 2001 at 12:53:31AM +0200, Andi wrote:
> > The stifb driver is working for me, but the colors are completely wrong
> > and the
> > system crashes if i try to cat /dev/fb0.
>
> Yup, the stifb is buggy.  Please, if you have time, it would be great
> if you could help clean it up and get it working.

I hope that I will find the time, but I cant promise anything.

> sticon works rather
> better but it is still not great.

well, sticon has correct colors, but works worse than stifb
(swiching a vt does not redraw the whole screen,
dselect is not usable ...)

> The STI docs are publically available
> from the documentation page.

Yeah, the STI docs.... HP should release the hardware level
docs, this is the only way to implement a full featured fbdev
driver. A stifb would still be usefull since it is works for
every HP gfxcard with STI BIOS, but a special driver for each
gfxcard would be nice to have things like mode switching.

Andreas - "I want color recovery!!!" ;-)
