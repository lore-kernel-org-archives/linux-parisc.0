From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sun, 12 Sep 2004 15:19:56 -0400
Message-ID: <20040912191955.GU1854@baldric.uwo.ca>
References: <20040911165325.GO28659@tausq.org>
	<20040912134707.GL1854@baldric.uwo.ca>
	<20040912161550.GR28659@tausq.org>
	<20040912175433.GQ1854@baldric.uwo.ca>
	<20040912184817.GS28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912184817.GS28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

> when you have a fault, we already store the ior/isr into the pt_regs
> structure. so as long as we are not clobbering those in the interruption
> exit path, it will still be accessible in the fixup code.

I worry that the fixup code may trigger another interruption and clobber
those values before it can read them? Any interruption will resave
ior/isr. Perhaps storing them into r8/r9 is still best.

> possibly, we can create a centralized fixup routine in
> arch/parisc/lib/fixup.S that looks like:
> 
>     .section .fixup, "ax"
> fixup_load_skip_1:
>     ldi -14, %r8
>     copy %r0, %r9
>     mfctl %cr30, %r1
>     LDREG 0(%r1), %r1
>     LDREG TASK_PT_IOR(%r1), %r1
>     ldo 4(%r1), %r1
>     bv,n %r0(%r1)
> 
> and __get_user_asm() will become
> 
> #define __get_user_asm(ldx,ptr)                         \
>         __asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
>                 "2:\n"                                  \
>                 "\t.section __ex_table,\"aw\"\n"        \
>                  "\t.word\t1b,fixup_load_skip_1\n"      \
>                  "\t.previous"                          \
>                 : "=r"(__gu_val), "=r"(__gu_err)        \
>                 : "r"(ptr), "1"(__gu_err));
> 
> similarly we will have fixup_store_skip_1, and for 32-bit we also need
> fixup_load_skip_2 and fixup_store_skip_2 for the 64-bit
> get_user/put_user calls.

That would be a brilliant space saver. I take it back, I hand't thought
about interrupting to a generic fixup function for all the
__get_user_asm uses.
 
> this reintroduces the requirement that __gu_val and __gu_err be in fixed
> registers, but the fixup regions don't need to be duplicated, so the
> kernel size should become smaller again.

Implementation?

a. Single generic fixup for all the asm macros (reduce kernel size).
        - Fixes previous quibble that absolute addresses made
          the kernel bigger because asm macros had more insns.
b. Absoulte fixup addresses (allows fixup to be anywhere).
c. Use only one flag in the fixup address to indicate wether
   r8/r9 should be written to with ior/iir or not. 
   Leaving a spare flag for future uses.

Pro:

o Kernel size is smaller.
        - Bonus!
o fixup can be located almost anywhere (absolute address).
        - Bonus!
o Custom code can examine r8/r9 to determine more accurately the 
  faulting situation.
        - Bonus!

Con:

o Generic slow path is a couple more insns slower ;)
        - Regression, no worries.
o Generic fixup always locks r8/r9 into gu_err and gu_val
        - Same as always.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
