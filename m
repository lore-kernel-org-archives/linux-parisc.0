From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Thu, 26 Oct 2017 02:22:17 +0200
Message-ID: <1508973952@msgid.manchmal.in-ulm.de>
References: <1508874207@msgid.manchmal.in-ulm.de>
 <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote...

> On 2017-10-24, at 4:03 PM, Christoph Biedl wrote:
> 
> > To start with, using the invalid value 4 as size parameter does not
> > return ENOSYS as I'd expect but crashes my system[2], using both 32 and
> > 64 bit kernel, no root privileges required.
> 
>         /* Check the validity of the size pointer */
>         subi,>>= 4, %r23, %r0
>         b,n     lws_exit_nosys
> 
> The condition in the subi instruction should be ">>".  The branch is incorrectly nullified when
> %r23 is 4.

Ups, way too obvious. This does the trick, or: Tested-By:
Should I try to get a CVE number for this, or is parisc considered
*that* historical nobody actually cares?


Now, using the given cmpxchg2 function, the following code tests this
LWS for 32bit: The first test is for *mem == *old, the second for
*mem != *old. Is there anything wrong with this?

    uint32_t mem;
    uint32_t old;
    uint32_t new;

    mem = 1;
    old = 1;
    new = 3;
    cmpxchg2 (&mem, &old, &new, 2);
    if (mem == old) {
        printf ("PASS: mem unchanged\n");
    } else {
        printf ("FAIL: got = 0x%x, expected = 0x%x\n", mem, old);
    }

    mem = 1;
    old = 3;
    new = 3;
    cmpxchg2 (&mem, &old, &new, 2);
    if (mem == new) {
        printf ("PASS: mem changed\n");
    } else {
        printf ("FAIL: got = 0x%x, expected = 0x%x\n", mem, new);
    }

My problem here: Both tests fail, and so do more complex ones that test
the other data sizes as well.

After staring at lws_compare_and_swap_2 a long time it seems there are
two issues: First, there is more usage of ",ma" so an update of mem/r26
hits the wrong place. After that, all results are the wrong way around.
I'm frightened to tell but I fear the logic in lws_compare_and_swap_2
is inverted in each and every place. I'm happy to be convinced
otherwise. But for the time being it seems the patch below is an
improvement.

Status: My system boots and all my tests pass. However, I find smartd
stalling in 100% CPU, might be coincidence. Now I'm putting some more
load onto the box to see whether it's less crashy then it used to be the
previous weeks.

Aside, there is another ",ma" modifier in lws_compare_and_swap that I
fail to understand. Haven't checked yet in detail yet, though.

Cheers,
    Christoph

--- a/src/arch/parisc/kernel/syscall.S
+++ b/src/arch/parisc/kernel/syscall.S
@@ -796,30 +796,30 @@
 	ldo	1(%r0),%r28
 
 	/* 8bit CAS */
-13:	ldb,ma	0(%r26), %r29
-	sub,=	%r29, %r25, %r0
+13:	ldb	0(%r26), %r29
+	sub,<>	%r29, %r25, %r0
 	b,n	cas2_end
-14:	stb,ma	%r24, 0(%r26)
+14:	stb	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
 	nop
 
 	/* 16bit CAS */
-15:	ldh,ma	0(%r26), %r29
-	sub,=	%r29, %r25, %r0
+15:	ldh	0(%r26), %r29
+	sub,<>	%r29, %r25, %r0
 	b,n	cas2_end
-16:	sth,ma	%r24, 0(%r26)
+16:	sth	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
 	nop
 
 	/* 32bit CAS */
-17:	ldw,ma	0(%r26), %r29
-	sub,=	%r29, %r25, %r0
+17:	ldw	0(%r26), %r29
+	sub,<>	%r29, %r25, %r0
 	b,n	cas2_end
-18:	stw,ma	%r24, 0(%r26)
+18:	stw	%r24, 0(%r26)
 	b	cas2_end
 	copy	%r0, %r28
 	nop
@@ -827,21 +827,22 @@
 
 	/* 64bit CAS */
 #ifdef CONFIG_64BIT
-19:	ldd,ma	0(%r26), %r29
-	sub,*=	%r29, %r25, %r0
+19:	ldd	0(%r26), %r29
+	sub,<>	%r29, %r25, %r0
 	b,n	cas2_end
-20:	std,ma	%r24, 0(%r26)
+20:	std	%r24, 0(%r26)
 	copy	%r0, %r28
 #else
 	/* Compare first word */
 19:	ldw	0(%r26), %r29
 	sub,=	%r29, %r22, %r0
-	b,n	cas2_end
+	b,n	cas2_64set
 	/* Compare second word */
 20:	ldw	4(%r26), %r29
-	sub,=	%r29, %r23, %r0
+	sub,<>	%r29, %r23, %r0
 	b,n	cas2_end
 	/* Perform the store */
+cas2_64set:
 21:	fstdx	%fr4, 0(%r26)
 	copy	%r0, %r28
 #endif
