Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11795
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 17:09:17 -0700
Message-ID: <20000322170913.B11714@puffin.external.hp.com>
Date: Wed, 22 Mar 2000 17:09:13 -0700
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: 5116@telia.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Any docs on the 715?
References: <200003222235.XAA11684@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003222235.XAA11684@zaphod.halden.lillfab.se>; from 5116@telia.com on Wed, Mar 22, 2000 at 11:35:52PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> Are there any documents on the ASICs found in the 715 available? 
> The stuff on the web page only seem the cover newer boxes.

There are two kinds of 715;  if you're lucky, you've got a "new" 715,
which has (really, check the hardware database for details) Lasi and
a PA7100LC, both documented, and undocumented graphics (all graphics
is).  There is very little difference between such 715s and 712s.

If you're unlucky (like me), you've got an "old" 715, which has ASP
(a Lasi predecessor) and what I believe is a PA7100.

Here's the list of things that work on the two boxes (* for things I
haven't actually checked, but believe should work):

715 old:
	network (10 mbit/s ethernet with a 10 base t transceiver)
	1 bpp unaccelerated framebuffer
	keyboard (HIL) *
	sound *
	serial *

715 new:
	network *
	1bpp unaccelerated framebuffer *
	keyboard (either PS/2 or HIL, both should work) *
	sound *
	serial *

I don't know about the 715 scsi chip, the eisa slot, parallel;
I don't think anyone has worked out how to use the LEDs yet.

	Philipp Rumpf
