Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA07713
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 01:16:20 -0600
Date: Tue, 1 Jun 1999 09:16:01 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Alex deVries <adevries@redhat.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Creating a bootable image.
Message-ID: <19990601091601.A6399@suse.de>
References: <Pine.LNX.3.96.990601002832.8814F-100000@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.990601002832.8814F-100000@devserv.devel.redhat.com>; from Alex deVries on Tue, Jun 01, 1999 at 12:33:05AM -0400
List-ID: <linux-parisc.vger.kernel.org>

> I'm mailing this because I'm not entirely sure what I'm doing is correct.

Neither am I, but arch/parisc/hp/boot/README seems to say something different.

> The way I understand it, the kernel we cross compile on Linux is in fact
> a broken ELF32 file, which doesn't really matter, because at this point we
> don't need the kernel to have any loader information itself. 

I think we should build a binary image of the kernel (that is not ELF) like
we do for x86.

> However, to actually boot you need IPL, which requires SOM linking, so
> that much must be done on HPUX.

This I do not understand. According to arch/parisc/hp/boot/README, the IPL is
stored in a special binary format which we could generate from ELF like we
do for the kernel image.

> and it'll create a kernel and boot header that should just boot right
> away.  That way to do kernel work (and not bootstrap work), you don't need
> HPUX at all.

I think the vast majority of parisc boxes runs HP-UX at the moment so it
probably would not be a big win.

	Philipp Rumpf
