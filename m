Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 097E14829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 16:23:05 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18heJL-0002bK-00; Sat, 08 Feb 2003 23:23:03 +0000
Date: Sat, 8 Feb 2003 23:23:03 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk>
References: <20030208222242.AA3554829@dsl2.external.hp.com> <20030208222746.GB19683@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030208222746.GB19683@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Feb 08, 2003 at 03:27:46PM -0700
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sat, Feb 08, 2003 at 03:27:46PM -0700, Grant Grundler wrote:
> > Kudos to John David Anglin and Carlos O'Donnell for realizing
> > PA 2.0 is not strongly ordered like PA1.x is.
> > Read appendix G or PA-RISC 2.0 Architecture (Gerry Kane) for
> > details on "Memory Ordering Model".

I'm confused.  This directly contradicts the comments in
include/asm-parisc/system.h.  If this needs updating, so does that.

> > I've uploaded palinux-20030208.tgz to dsl2 and will try to build
> > a binutils.deb with this change as well.

Is all that's needed to take the latest binutils from debian unstable
and rebuild it on woody?

> +++ arch/parisc/Makefile	8 Feb 2003 06:21:32 -0000
> @@ -32,6 +32,10 @@ CROSS_COMPILE := hppa-linux-
> +ifdef CONFIG_PA20
> +CFLAGS += -mpa-risc-2-0
> +endif

I've reverted this one.  We already have:

ifdef CONFIG_PA8X00
CFLAGS += -march=2.0 -mschedule=8000
endif

which covers the same cases.

> +++ include/asm-parisc/spinlock_t.h	8 Feb 2003 06:21:34 -0000
> +> I've attached a summary of the change, but basically, for PA 2.0, as
> +> long as the ",CO" (coherent operation) completer is specified, then the
> +> 16-byte alignment requirement for ldcw and ldcd is relaxed, and instead
> +> they only require "natural" alignment (4-byte for ldcw, 8-byte for
> +> ldcd).

That's interesting from an architecture PoV.  From my recollection when jsm
was debugging problems on the 710, PCX-S is the only processor which actually
enforces the 16-byte alignment restriction on ldcw.  So _practically_, we
don't need it unless we're supporting those old processors.

> +#ifdef CONFIG_PA20
> +/* PA2.0 is not strongly ordered. ldcw enforces ordering
> + * and we need to make sure ordering is enforced on the unlock too.
> + */
> +#define spin_unlock(x) \
> +		__asm__ __volatile__ ("stw,o  %%sp,0(%0)" : : "r" (x) : "memory" )
> +#else
> +
> +/* PA1.1 is strongly ordered. No issues here. */
>  #define spin_unlock(x)		do { (x)->lock = 1; } while(0)
> +
> +#endif

Actually... this may be a long-standing bug in our spinlocks.  There's nothing
to prevent gcc reordering writes around this assignment.  We need a barrier()
before the assignment, or maybe it'd be as well to do the assignment in an
asm() statement.

>  #define spin_unlock_wait(x)     do { barrier(); } while(((volatile spinlock_t *)(x))->lock == 0)

i wonder if this one was working around some obscure compiler bug a
while back.  I don't see why we need to cast to a volatile spinlock_t *
given that lock is already defined as volatile.

One final point.... up till now, we've been telling people it's OK to
run kernels configured for PA1.1 on PA2.0 processors.  This patch says
to me that's not safe.  Do we need our distros (yeah, I hear there'll
soon be more than Debian supporting PA) to ship 5 flavours of kernel
(PA1.1 UP & SMP, PA2.0 32-bit SMP, 64-bit UP and 64-bit SMP) rather than
the current four?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
