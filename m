Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9890E4841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Nov 2003 14:10:16 -0700 (MST)
Date: Sun, 30 Nov 2003 14:10:14 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC] rewrite kernel spinlock code to work better with gcc]
Message-ID: <20031130211014.GA5208@colo.lackof.org>
References: <20031126070714.GN975@tausq.org> <3FC93D47.5020501@tiscali.be> <20031130033705.GA24965@colo.lackof.org> <3FCA1B75.9020600@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FCA1B75.9020600@tiscali.be>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Nov 30, 2003 at 04:31:49PM +0000, Joel Soete wrote:
> No, i think it is right but I forgot to embrace spinlock_t declaration 
> with "#ifdef CONFIG_SMP ...#endif" in system.h. Done in the new attched 
> patch (tested and run fine on c100 (32bit up) with kernel up and smp)
> My bad in previous test: forgot make distclean ; make mrproper (to be sure).

Use of "make distclean" means you don't have the dependencies correct.
ie whereever "ifdef CONFIG_*" is used, linux/config.h needs to be included.

> If you find some interest can you ci (I would like to test Randolph 
> patch on n4k just to be sure).

I don't. I have a basic problem with this patch.

...
> -#include <asm/spinlock_t.h>
...
> diff -Naur linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock_t.h linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock_t.h
> --- linux-2.4.23-rc5-pa17/include/asm-parisc/spinlock_t.h	2003-11-29 16:13:04.000000000 +0100
> +++ linux-2.4.23-rc5-pa17-bp/include/asm-parisc/spinlock_t.h	1970-01-01 01:00:00.000000000 +0100
> @@ -1,97 +0,0 @@
> -#ifndef __PARISC_SPINLOCK_T_H
> -#define __PARISC_SPINLOCK_T_H
...

Why delete spinlock_t.h?

I added spinlock_t.h to resolve the circular inter-dependency between
asm/system.h, asm/bitops.h, and asm/spinlock.h.  spinlock_t.h depends
on nothing and defines spinlock primitives used by the others.

grant
