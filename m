Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA11959
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Feb 2000 10:12:44 -0700
From: willy@thepuffingroup.com
Date: Wed, 9 Feb 2000 10:59:06 -0500
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld: Unsatisfied symbols
Message-ID: <20000209105906.M7236@thepuffingroup.com>
References: <200002090605.WAA12699@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002090605.WAA12699@milano.cup.hp.com>; from Grant Grundler on Tue, Feb 08, 2000 at 10:05:07PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 08, 2000 at 10:05:07PM -0800, Grant Grundler wrote:
> uts_sem (data)
> 	include/linux/utsname.h: extern struct rw_semaphore uts_sem;
> 	kernel/ksyms.c: EXPORT_SYMBOL(uts_sem);          /* UTS semaphore */
> 	kernel/sys.c:  DECLARE_RWSEM(uts_sem);
> 
> 	Seems like another SOM kluge is needed.
> 	Or "DECLARE_RWSEM()" needs to be hacked for SOM.
> 	If someone knows where such "data" kluges are collected,
> 	please either fix it or let me know so we can keep such kluges
> 	all in one place.

nono, this isn't linker magic (for once :-).  It's how to declare a
read-write semaphore (C doesn't have constructors, so you do it manually).
I'll do a silly-C version for now and someone can work on an efficient
assembler version of it later.

> up_read
> up_write
> down_read
> down_write
> 	We seem to need them in asm-parisc/semaphore.h.
> 	I gather this is some form of R/W semaphore.
> 	Anyone who knows more is encouraged to make it happen.

exactly.

thanks for fixing the pci stuff.
