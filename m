Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2995482A
	for <parisc-linux@parisc-linux.org>; Thu, 30 Aug 2001 09:58:42 -0600 (MDT)
Date: Thu, 30 Aug 2001 17:58:40 +0200
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.9-pa10 now works on 715/75! Sound?
Message-ID: <20010830175840.A2496@pc5158e>
Reply-To: delahaym@esiee.fr
References: <8D4C69676E66D511A1CB00508BBBB19216273C@ranmx1.ran.harris.com> <20010830161409.B23606@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830161409.B23606@parcelfarce.linux.theplanet.co.uk>
From: Matthieu Delahaye <delahaym@pc5158e.esiee.fr>
List-ID: <linux-parisc.vger.kernel.org>

> 
> This will get fixed once we have an iotree.  Coming soon...


Currently, Harmony needs some bugs fixing.
I'll commit in the next few days a patch for it:
- Suppressing race access;
- Changing behaviour of read/write. These functions didn't respected fs/vfs interface.
- Add poll()
It's quite ready, but I've to correct some strange Harmony behaviour.
So, keep reading!

BTW, http://mkhppa1.esiee.fr/ is accessible again.
http://www.esiee.fr/puffin is still closed

Regards,
Matthieu Delahaye
http://mkhppa1.esiee.fr/ 
 
 
