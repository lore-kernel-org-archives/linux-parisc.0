Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA05471
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Dec 2000 22:07:45 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 6DBB27C8
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 21:10:58 -0800 (PST)
Date: Fri, 29 Dec 2000 21:12:19 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012300512.VAA24694@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] xchg/cmpxchg defined in wrong place?
List-ID: <linux-parisc.vger.kernel.org>

Hello Linux Kernel Guru's,

After surveying all the arches that define __HAVE_ARCH_CMPXCHG:

./include/asm-alpha/system.h:#define __HAVE_ARCH_CMPXCHG 1
./include/asm-i386/system.h:#define __HAVE_ARCH_CMPXCHG 1
./include/asm-ia64/system.h:#define __HAVE_ARCH_CMPXCHG 1
./include/asm-ppc/system.h:#define __HAVE_ARCH_CMPXCHG  1
./include/asm-sparc64/system.h:#define __HAVE_ARCH_CMPXCHG 1

I've come to the conclusion xchg/cmpxchg definitions do NOT
belong in system.h.  AFAICT, all the above use Load Linked semantics
(or in the i386 case, operation is atomic). In other words, xchg/cmpxchg
are atomic operations.  Shouldn't xchg/cmpxchg definitions live
with other atomic operations - asm/atomic.h?

Currently, parisc __xchg lives in arch/parisc/kernel/setup.c. There is no
way to inline xchg or cmpxchg for parisc at the moment. And given the
dependendencies between asm/system.h, asm/spinlock.h, and asm/atomic.h,
I'm not trying to inline them. Perhaps when the definitions formally move
to atomic.h (or other more appropriate place).

And to add insult to injury, drivers/char/drm/drmP.h (the only visible
consumer of __HAVE_ARCH_CMPXCHG) doesn't even explicitly include
asm/system.h!

thanks,
grant
