Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 385C34829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 00:48:08 -0700 (MST)
Date: Tue, 12 Nov 2002 23:52:34 -0800
From: Randolph Chung <randolph@tausq.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Broken Cache Flushing in arch/parisc/kernel/signal.c.??
Message-ID: <20021113075234.GF8261@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1037173492.9031.7.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1037173492.9031.7.camel@beavis>
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

> +#if CACHE_FLUSHING_IS_NOT_BROKEN
>  	flush_icache_range((unsigned long) &frame->tramp[0],
>  			   (unsigned long) &frame->tramp[4]);
> +#else
> +       /* It should *always* be cache line-aligned, but the compiler
> +           sometimes screws up. */
> +       asm volatile("fdc 0(%%sr3,%0)\n\t"
> +                    "fdc %1(%%sr3,%0)\n\t"
> +                    "sync\n\t"
> +                    "fic 0(%%sr3,%0)\n\t"
> +                    "fic %1(%%sr3,%0)\n\t"
> +                    "sync\n\t"
> +                    : : "r" (frame->tramp), "r" (L1_CACHE_BYTES));
> +#endif
> +

<sigh>
this is partly my fault, since i thought we have unbroken cache flushing
and asked thibaut to check this in... now i see that the original code
flushes sr3 space, but flush_icache_range() flushes the kernel space...
oops!

perhaps we should just check the old code back in for now?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
