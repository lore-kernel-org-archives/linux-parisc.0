Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA16902
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 May 1999 09:44:20 -0600
Message-ID: <19990513154838.28459@insula.local>
Date: Thu, 13 May 1999 15:48:38 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: Ross Sponholtz <rsponholtz@earthlink.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Hi Also!
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
References: <005301be9cfc$d0cf70e0$770e070a@monorailpc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005301be9cfc$d0cf70e0$770e070a@monorailpc>; from Ross Sponholtz on Wed, May 12, 1999 at 11:55:24PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> Hello, I too am new to the list; I have been lurking for a while, and have
> this related question:  What hardware is being targeted right now, and what
> is the minimum needed to help out?  Would a C110 be ok?  How 'bout a 715/50?

Due to the PDC interface being enough to get us to a bash prompt without
deciding on a single machine / machine group, any machine that does what
the PA1.1 docs say should be useful atm.

I think (this is just my personal plans and might very well change soon)
we'll boot using a ramdisk loaded by the bootloader with the kernel.
This means you need a dedicated Linux disk, and probably a HP-UX disk
to write diskimages to the Linux disk.

> Also, could we put together a newbies task list?  Stuff that needs to be

I think we don't have any of the typical boring repetitive tasks to let
newbies do atm. The basic task is to get the kernel working and there's
a list for things needed (though not up-to-date) somewhere on
www.thepuffingroup.com/parisc.

	Philipp Rumpf
