From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Sun, 14 Mar 2010 21:10:25 -0400
Message-ID: <20100315011024.GA7309@hiauly1.hia.nrc.ca>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca> <20100307203230.CAC964E77@hiauly1.hia.nrc.ca> <20100311032049.GA14312@hiauly1.hia.nrc.ca> <20100311135418.GA22698@bombadil.infradead.org> <20100311224044.GA18789@hiauly1.hia.nrc.ca> <20100313020647.GA26384@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>, deller@gmx.de,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100313020647.GA26384@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 12 Mar 2010, John David Anglin wrote:

> The other issue is r16.  I'm thinking we may need to reload r16 as the
> context may change if we schedule, etc.  If this checking is broken, it
> would break the LWS assumptions.

This theory is shotdown.  The patch below possibly helps a bit but it
doesn't resolve the minifail bug.  The intention of the last couple of
hunks is to return to the right place if cr30 changes as a result of
scheduling.

With more debugging, it seems that this is a clone mmap copy issue.
Normally, the forked child doesn't see any non-zero data in the
stack region allocated by pthread_create.  However, if it does, 
the thread invariably dies and the stack region is corrupt after
the fork.

I guess I said this before ;(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 3a44f7f..820d6ca 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -758,6 +758,10 @@ ENTRY(__kernel_thread)
 
 	STREG	%r22, PT_GR22(%r1)	/* save r22 (arg5) */
 	copy	%r0, %r22		/* user_tid */
+	copy	%r0, %r21		/* child_tid */
+#else
+	stw	%r0, -52(%r30)	     	/* user_tid */
+	stw	%r0, -56(%r30)	     	/* child_tid */
 #endif
 	STREG	%r26, PT_GR26(%r1)  /* Store function & argument for child */
 	STREG	%r25, PT_GR25(%r1)
@@ -765,7 +769,7 @@ ENTRY(__kernel_thread)
 	ldo	CLONE_VM(%r26), %r26   /* Force CLONE_VM since only init_mm */
 	or	%r26, %r24, %r26      /* will have kernel mappings.	 */
 	ldi	1, %r25			/* stack_start, signals kernel thread */
-	stw	%r0, -52(%r30)	     	/* user_tid */
+	ldi	0, %r23			/* child_stack_size */
 #ifdef CONFIG_64BIT
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
@@ -972,7 +976,10 @@ intr_check_sig:
 	BL	do_notify_resume,%r2
 	copy	%r16, %r26			/* struct pt_regs *regs */
 
-	b,n	intr_check_sig
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 intr_restore:
 	copy            %r16,%r29
@@ -1026,14 +1033,12 @@ intr_do_resched:
 	ldo	-16(%r30),%r29		/* Reference param save area */
 #endif
 
-	ldil	L%intr_check_sig, %r2
-#ifndef CONFIG_64BIT
-	b	schedule
-#else
-	load32	schedule, %r20
-	bv	%r0(%r20)
-#endif
-	ldo	R%intr_check_sig(%r2), %r2
+	BL	schedule,%r2
+	nop
+	mfctl   %cr30,%r16		/* Reload */
+	LDREG	TI_TASK(%r16), %r16	/* thread_info -> task_struct */
+	b	intr_check_sig
+	ldo	TASK_REGS(%r16),%r16
 
 	/* preempt the current task on returning to kernel
 	 * mode from an interrupt, iff need_resched is set,
