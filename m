Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB13F482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 19:05:22 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GF3POV03.VFX for
          <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 17:05:19 -0800
Date: Sun, 17 Jun 2001 17:05:20 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: buggz <buggz@america.net>
Cc: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] PALO/kernel-build change proposal
In-Reply-To: <Pine.LNX.4.33.0106172013490.20079-100000@buggz1.buggz.net>
Message-ID: <Pine.LNX.4.33.0106171703250.18884-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I don't suppose someone has an updated how-to for actually *using* your
> > new kernel, do they? Replacing /boot/vmlinux-2.4.0 with the new one
> > results in an immediate hang on reboot...
>
> *shrug*
> Well, I've made two successful kernels, cp'd to /boot, edited
> /etc/palo.conf, just like normal to me.

Hmmm... I tried that - copied lifimage to /boot/vmlinux-240-pa15, edited
/etc/palo.conf to change the kernel listed, then ran palo to update it and
rebooted. Same error - can't understand the kernel executable format.

Am wondering if perhaps it's me goofing it up rather than the system.
(Actually am pretty certain it's me, since other people can compile
kernels fine...)

Time to try again!
