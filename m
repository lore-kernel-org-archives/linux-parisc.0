Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA23019
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 21:38:56 -0600
Date: Thu, 6 May 1999 01:22:24 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld problem workaround
In-Reply-To: <19990506052437.44410@insula.local>
Message-ID: <Pine.LNX.3.96.990506012143.25834A-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 6 May 1999, Philipp Rumpf wrote:

> There is now an ugly workaround in the CVS tree that allows us to
> use 0x8000 as kernel entry point.

So if I understand it correctly, we should be able to fix the bootloader
to jump to 0x8000 and actually load the kernel.

Chris, how far off that are we?

- Alex
