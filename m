Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA23298
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 21:44:44 -0600
Message-ID: <19990506053931.13099@insula.local>
Date: Thu, 6 May 1999 05:39:31 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Alex deVries <adevries@redhat.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld problem workaround
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <19990506052437.44410@insula.local> <Pine.LNX.3.96.990506012143.25834A-100000@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990506012143.25834A-100000@devserv.devel.redhat.com>; from Alex deVries on Thu, May 06, 1999 at 01:22:24AM -0400
List-ID: <linux-parisc.vger.kernel.org>

> > There is now an ugly workaround in the CVS tree that allows us to
> > use 0x8000 as kernel entry point.
> 
> So if I understand it correctly, we should be able to fix the bootloader
> to jump to 0x8000 and actually load the kernel.

The other way round preferably.

> Chris, how far off that are we?

Where are the bootloader sources atm ?
