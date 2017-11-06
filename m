From: Helge Deller <deller@gmx.de>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Mon, 6 Nov 2017 22:27:34 +0100
Message-ID: <20171106212734.GA29237@ls3530.fritz.box>
References: <1508874207@msgid.manchmal.in-ulm.de>
 <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
 <1508973952@msgid.manchmal.in-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        Richard Henderson <rth@twiddle.net>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1508973952@msgid.manchmal.in-ulm.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>:
> John David Anglin wrote...
> 
> > On 2017-10-24, at 4:03 PM, Christoph Biedl wrote:
> > 
> > > To start with, using the invalid value 4 as size parameter does not
> > > return ENOSYS as I'd expect but crashes my system[2], using both 32 and
> > > 64 bit kernel, no root privileges required.
> > 
> >         /* Check the validity of the size pointer */
> >         subi,>>= 4, %r23, %r0
> >         b,n     lws_exit_nosys
> > 
> > The condition in the subi instruction should be ">>".  The branch is incorrectly nullified when
> > %r23 is 4.

I'd prefer this (untested) patch:

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 41e60a9c7db2..f8a8754322ae 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -698,8 +698,7 @@ lws_compare_and_swap_2:
 #endif
 
 	/* Check the validity of the size pointer */
-	subi,>>= 4, %r23, %r0
-	b,n	lws_exit_nosys
+	cmpib,COND(<<),n 3, %r23, lws_exit_nosys
 
 	/* Jump to the functions which will load the old and new values into
 	   registers depending on the their size */


> Ups, way too obvious. This does the trick, or: Tested-By:
> Should I try to get a CVE number for this, or is parisc considered
> *that* historical nobody actually cares?

I think a CVE is not needed for parisc. There are no real productive
users (I assume).


> Now, using the given cmpxchg2 function, the following code tests this
> LWS for 32bit: The first test is for *mem == *old, the second for
> *mem != *old. Is there anything wrong with this?
> 
>     uint32_t mem;
>     uint32_t old;
>     uint32_t new;
> 
>     mem = 1;
>     old = 1;
>     new = 3;
>     cmpxchg2 (&mem, &old, &new, 2);
>     if (mem == old) {
>         printf ("PASS: mem unchanged\n");
>     } else {
>         printf ("FAIL: got = 0x%x, expected = 0x%x\n", mem, old);
>     }
> 
>     mem = 1;
>     old = 3;
>     new = 3;
>     cmpxchg2 (&mem, &old, &new, 2);
>     if (mem == new) {
>         printf ("PASS: mem changed\n");
>     } else {
>         printf ("FAIL: got = 0x%x, expected = 0x%x\n", mem, new);
>     }
> 
> My problem here: Both tests fail, and so do more complex ones that test
> the other data sizes as well.
> 
> After staring at lws_compare_and_swap_2 a long time it seems there are
> two issues: First, there is more usage of ",ma" so an update of mem/r26
> hits the wrong place. After that, all results are the wrong way around.
> I'm frightened to tell but I fear the logic in lws_compare_and_swap_2
> is inverted in each and every place. I'm happy to be convinced
> otherwise. But for the time being it seems the patch below is an
> improvement.
> 
> Status: My system boots and all my tests pass. However, I find smartd
> stalling in 100% CPU, might be coincidence. Now I'm putting some more
> load onto the box to see whether it's less crashy then it used to be the
> previous weeks.

Did you continued your tests?
How were the results.

> Aside, there is another ",ma" modifier in lws_compare_and_swap that I
> fail to understand. Haven't checked yet in detail yet, though.

I'd suggest to keep the other ",ma" modifiers for now.

Helge
