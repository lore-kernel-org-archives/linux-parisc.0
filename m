Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA22352
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 18:51:13 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id D35EE1D2
	for <parisc-linux@thepuffingroup.com>; Sat, 30 Dec 2000 17:54:24 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id RAA25264
	for <parisc-linux@thepuffingroup.com>; Sat, 30 Dec 2000 17:55:47 -0800 (PST)
Message-Id: <200012310155.RAA25264@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] xchg/cmpxchg defined in wrong place? 
In-reply-to: Your message of "Sat, 30 Dec 2000 09:52:49 PST."
             <200012301752.JAA25055@milano.cup.hp.com>
Date: Sat, 30 Dec 2000 17:55:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> ok. I'll take a whack at parisc arch and see what happens.

This was easy. Was even able to build/link with DRM and all the
related drivers. Code change committed to parisc-linux CVS:
o removes bogus definition of __xchg_called_with_bad_pointer from setup.c
o definitions follow sparc64 model except I didn't try to inline all
  of this mess.
o added __xchgNN() and __cmpxchg_uNN() functions to bitops.c and
  declared them in parisc_ksyms.c for CONFIG_MODULES support.
o added "include <asm/atomic.h>" to arch/parisc/kernel/semaphore.c
  to make sure it gets the xchg() macro definition.

TODO: DRM should explicitly include asm/atomic.h to pick up
  #define __HAVE_ARCH_CMPXCHG directly.

> If it's easy, I'll try the i386 arch as well - mostly
> to build more drivers as a sanity check.

I moved all the xchg/cmpxchg related code from include/asm-i386/system.h
to include/asm-i386/atomic.h and built an x86 kernel (natively) but didn't
boot it. Booting the kernel shouldn't be necessary since mis-use will
result in a linker error (xchg undefined).

I used 2.4.0-test10 since it was handy. Once I get newer Linus
tree, I can cut/paste again and submit the patch to l-k.
Should be able to do this in the next couple of days unless someone
tells me they've done it already.

thanks,
grant
