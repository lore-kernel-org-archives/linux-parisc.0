Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA22693
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jul 1999 13:20:36 -0600
Date: Wed, 28 Jul 1999 21:21:24 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Lyonel VINCENT <lyonel_vincent@hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building IPL...
Message-ID: <19990728212124.M21585@suse.de>
References: <379F52A1.4BB9F81D@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <379F52A1.4BB9F81D@hp.com>; from Lyonel VINCENT on Wed, Jul 28, 1999 at 08:57:38PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> I'm new to this list and I would want to tell you that if you need a
> dumb user to test your kernels, I have some systems roaming around which
> could do (C-class, D-class, G-class, K-class, 705, 712, 735). These are
> test systems and I can reboot them without any problem.

Great.  Do you have something set up to boot all of the PA1.1 ones and see
which one come through and where those that don't hang ?

> PPS: I've just built the latest snapshot and my 712 doesn't seem to like
> it... (btw, the 05/07 image works well and correctly detects the
> CPU/frequency/memory...)

I think you ran into our slightly broken Dino detection code. Try to disable
all dino support for the build.
