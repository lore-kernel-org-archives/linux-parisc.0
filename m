Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA08972
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 07:59:30 -0600
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id GAA18394
	for <parisc-linux@thepuffingroup.com>; Tue, 1 Jun 1999 06:58:49 -0700 (PDT)
Sender: shaver@netscape.com
Message-ID: <3753E8FA.3B109474@mozilla.org>
Date: Tue, 01 Jun 1999 10:06:50 -0400
From: Mike Shaver <shaver@mozilla.org>
MIME-Version: 1.0
To: Philipp Rumpf <prumpf@suse.de>
CC: Alex deVries <adevries@redhat.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Creating a bootable image.
References: <Pine.LNX.3.96.990601002832.8814F-100000@devserv.devel.redhat.com> <19990601091601.A6399@suse.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> > and it'll create a kernel and boot header that should just boot right
> > away.  That way to do kernel work (and not bootstrap work), you don't need
> > HPUX at all.
> 
> I think the vast majority of parisc boxes runs HP-UX at the moment so it
> probably would not be a big win.

I think that being able to cross your kernel is a big win, since it
makes the edit-compile-test cycle much shorter if you've got a spare
machine off of which to netboot.

I've got the linker script documentation printed and waiting for my move
to safely complete, but someone who's got their hands in already should
feel free to pre-empt me.

Mike

-- 
40858.97 38157.23
