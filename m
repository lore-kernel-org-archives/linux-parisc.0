Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA13866
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 10:21:20 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 30 Dec 2000 17:24:34 -0000
Subject: Re: [parisc-linux] xchg/cmpxchg defined in wrong place?
To: grundler@cup.hp.com (Grant Grundler)
Date: Sat, 30 Dec 2000 16:46:57 +0000 (GMT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200012300512.VAA24694@milano.cup.hp.com> from "Grant Grundler" at Dec 29, 2000 09:12:19 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14CP9n-0006ma-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> way to inline xchg or cmpxchg for parisc at the moment. And given the
> dependendencies between asm/system.h, asm/spinlock.h, and asm/atomic.h,
> I'm not trying to inline them. Perhaps when the definitions formally move
> to atomic.h (or other more appropriate place).
> 
> And to add insult to injury, drivers/char/drm/drmP.h (the only visible
> consumer of __HAVE_ARCH_CMPXCHG) doesn't even explicitly include
> asm/system.h!

Seems a reasonable thing to try and move to atomic.h yes

> 
