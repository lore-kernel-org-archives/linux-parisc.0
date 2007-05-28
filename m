From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] PATCH remove remnants of softirq
Date: Mon, 28 May 2007 16:31:59 -0600
Message-ID: <20070528223159.GC16928__1319.8223583915$1416624377$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle,

This patch removes remnants of softirq support that we no longer need.
I suspect this was just overlooked when willy convert parisc to generic
IRQ support.

Tested on c3600 32-bit UP.

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 8474f9e..98ae563 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -954,21 +954,6 @@ intr_return:
 	/* NOTE: Need to enable interrupts incase we schedule. */
 	ssm     PSW_SM_I, %r0
 
-	/* Check for software interrupts */
-
-	.import irq_stat,data
-
-	load32	irq_stat,%r19
-#ifdef CONFIG_SMP
-	mfctl   %cr30,%r1
-	ldw	TI_CPU(%r1),%r1 /* get cpu # - int */
-	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) amount
-	** irq_stat[] is defined using ____cacheline_aligned.
-	*/
-	SHLREG	%r1,L1_CACHE_SHIFT,%r20
-	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
-#endif /* CONFIG_SMP */
-
 intr_check_resched:
 
 	/* check for reschedule */
@@ -2055,24 +2040,6 @@ ENTRY(syscall_exit)
 	 */
 	loadgp
 
-syscall_check_bh:
-
-	/* Check for software interrupts */
-
-	.import irq_stat,data
-
-	load32	irq_stat,%r19
-
-#ifdef CONFIG_SMP
-	/* sched.h: int processor */
-	/* %r26 is used as scratch register to index into irq_stat[] */
-	ldw     TI_CPU-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r26 /* cpu # */
-
-	/* shift left ____cacheline_aligned (aka L1_CACHE_BYTES) bits */
-	SHLREG	%r26,L1_CACHE_SHIFT,%r20
-	add     %r19,%r20,%r19	/* now have &irq_stat[smp_processor_id()] */
-#endif /* CONFIG_SMP */
