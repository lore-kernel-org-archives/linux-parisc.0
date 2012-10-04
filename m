From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 04 Oct 2012 11:02:16 +0100
Message-ID: <1349344936.2706.10.camel@dabdike.int.hansenpartnership.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	 <20121004051359.GA24664@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121004051359.GA24664@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[cc: parisc list]
On Thu, 2012-10-04 at 06:13 +0100, Al Viro wrote:
> On Thu, Oct 04, 2012 at 05:51:50AM +0100, Al Viro wrote:
> > I'm really confused by that one:
> >         /* If exec succeeded we need to load the args */
> > 
> >         ldo -1024(%r0),%r1
> >         cmpb,>>= %r28,%r1,error_\execve
> >         copy %r2,%r19
> > 
> > error_\execve:
> >         bv %r0(%r19)
> > 
> > Just what is going on there?  That cmpb is non-nullifying, right?  So this
> > assignment to %r2 happens whether condition is true or false.  And AFAICS
> > IAOQ_Next is set to error_\execve in both cases.  So what the hell
> > is that comparison for (and the comment about)?  Why not simply return
> > via bv %r0(%r2) and be done with that?  It had been done that way since
> > the initial parisc merge circa 2.4.0-test*...
> 
> FWIW, I suspect that hpux_execve_wrapper might have something to do with it -
> there we have
>         comb,>>= %r28,%r1,exec_error
>         copy %r2,%r19
>         ldo     -TASK_SZ_ALGN-64(%r30),%r1         ;! get task ptr
>         LDREG   TASK_PT_GR26(%r1),%r26
>         LDREG   TASK_PT_GR25(%r1),%r25
>         LDREG   TASK_PT_GR24(%r1),%r24
>         LDREG   TASK_PT_GR23(%r1),%r23
>         copy %r0,%r2    /* Flag to syscall_exit not to clear args */
> 
> exec_error:
> instead and that at least makes some sense (even though I don't see
> why syscall_exit would fail to restore them or would check %r2).  Is
> the execve_wrapper a rudiment of something similar?  It's beyond the
> history observable in the mainline, unfortunately... ;-/

It's plausible.  I just verified the theory that the branch is redundant
by successfully booting with this patch applied.

James

---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 18670a0..d1da93f 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1893,15 +1893,7 @@ ENDPROC(sys_vfork_wrapper)
 
 	ldo -FRAME_SIZE(%r30),%r30
 	LDREG -RP_OFFSET(%r30),%r2
-
-	/* If exec succeeded we need to load the args */
-
-	ldo -1024(%r0),%r1
-	cmpb,>>= %r28,%r1,error_\execve
-	copy %r2,%r19
