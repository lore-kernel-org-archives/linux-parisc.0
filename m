From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sun, 12 Sep 2004 11:48:17 -0700
Message-ID: <20040912184817.GS28659@tausq.org>
References: <20040911165325.GO28659@tausq.org>
	<20040912134707.GL1854@baldric.uwo.ca>
	<20040912161550.GR28659@tausq.org>
	<20040912175433.GQ1854@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912175433.GQ1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> That's quite a bit, but it does make the infrastructure more flexible.
> I don't think anyone is going to be building embedded PA systems, but
> lets not bloat.

yes, that's why i brought it up :)

> > actually a nice effect of this patch is that you don't need to lock down
> > r8 and r9 anymore for the get_user/put_user cases. Potentially any 
> > register can be used to store the error and result values.
> 
> I don't see how the fixup code knows which registers to use?

Consider:

#define __get_user_asm(ldx,ptr)                         \
        __asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
                "2:\n"                                  \
                "\t.section .fixup,\"ax\"\n"            \
                "3:\tldi -14, %1\n"                     \
                "\tcopy %%r0, %0\n"                     \
                FIXUP_BRANCH(2b)                        \
                "\t.previous"                           \
                "\t.section __ex_table,\"aw\"\n"        \
                 "\t.word\t1b,3b\n"                     \
                 "\t.previous"                          \
                : "=r"(__gu_val), "=r"(__gu_err)        \
                : "r"(ptr), "1"(__gu_err));

By the time the fixup is called, we are back into user context. the
ldi/copy will write into whatever registers store __gu_val, __gu_err,
and then branch back to "2:", so essentially this code is
self-contained.  There is no real requirements that __gu_val/__gu_err be
in any special registers.

In the original code, we have to write to r8/r9 inside interruption
context, and have the values survive back to user context.

> > i need to do some experiments to verify this, but after thinking
> > about it more last night, it seems to me that we don't even need to put
> > the isr/ior into registers in the fault handler.  the fixup code could 
> > potentially just look at current->thread.regs.isr/ior directly.
> 
> Yes, that's very true, just fillin those values during the fixup phase.
> Then you don't need to use r8/r9 and the flags just become "Yes I care,
> please deposit the value" or "No I don't care."

nono, you don't fill them up in the fixup phase.

when you have a fault, we already store the ior/isr into the pt_regs
structure. so as long as we are not clobbering those in the interruption
exit path, it will still be accessible in the fixup code.

> I'm not sure what we would use the flag for, but it's nice to have it
> there. Perhaps we may in the future wish to have absolute and relative
> fixups based on the flag? This would reduce the kernel size bloat and
> produce faster code again. Technically only the pa_memcpy code is the
> only one that would have to enable "absolute" fixups?

why do you think absolute fixups take more space?  in fact, absolute
fixup is what might allow us to save space.

the bit that is taking up more space is that the logic that stores
-EFAULT/0 is now duplicated for each get_user/put_user call. For 64-bit
kernels, that's 5 insns per call. In the original implementation, this
logic is centralized in the fault handling code.

possibly, we can create a centralized fixup routine in
arch/parisc/lib/fixup.S that looks like:

    .section .fixup, "ax"
fixup_load_skip_1:
    ldi -14, %r8
    copy %r0, %r9
    mfctl %cr30, %r1
    LDREG 0(%r1), %r1
    LDREG TASK_PT_IOR(%r1), %r1
    ldo 4(%r1), %r1
    bv,n %r0(%r1)

and __get_user_asm() will become

#define __get_user_asm(ldx,ptr)                         \
        __asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
                "2:\n"                                  \
                "\t.section __ex_table,\"aw\"\n"        \
                 "\t.word\t1b,fixup_load_skip_1\n"      \
                 "\t.previous"                          \
                : "=r"(__gu_val), "=r"(__gu_err)        \
                : "r"(ptr), "1"(__gu_err));

similarly we will have fixup_store_skip_1, and for 32-bit we also need
fixup_load_skip_2 and fixup_store_skip_2 for the 64-bit
get_user/put_user calls.

this reintroduces the requirement that __gu_val and __gu_err be in fixed
registers, but the fixup regions don't need to be duplicated, so the
kernel size should become smaller again.

thoughts?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
