From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Check if secondary CPUs want own PDC calls
Date: Fri, 12 Jan 2018 22:51:22 +0100
Message-ID: <20180112215121.GA5700@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The architecture specification says (for 64-bit systems): PDC is a per
processor resource, and operating system software must be prepared to
manage separate pointers to PDCE_PROC for each processor.  The address
of PDCE_PROC for the monarch processor is stored in the Page Zero
location MEM_PDC. The address of PDCE_PROC for each non-monarch
processor is passed in gr26 when PDCE_RESET invokes OS_RENDEZ.

Currently we still use one PDC for all CPUs, but in case we face a
machine which is following the specification let's warn about it.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index bbbe360b458f..fbb4e43fda05 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -138,6 +138,16 @@ $pgt_fill_loop:
 	std		%dp,0x18(%r10)
 #endif
 
+#ifdef CONFIG_64BIT
+	/* Get PDCE_PROC for monarch CPU. */
+#define MEM_PDC_LO 0x388
+#define MEM_PDC_HI 0x35C
+	ldw             MEM_PDC_LO(%r0),%r3
+	ldw             MEM_PDC_HI(%r0),%r10
+	depd            %r10, 31, 32, %r3        /* move to upper word */
+#endif
+
+
 #ifdef CONFIG_SMP
 	/* Set the smp rendezvous address into page zero.
 	** It would be safer to do this in init_smp_config() but
@@ -196,12 +206,6 @@ common_stext:
         ** Someday, palo might not do this for the Monarch either.
         */
 2:
-#define MEM_PDC_LO 0x388
-#define MEM_PDC_HI 0x35C
-	ldw             MEM_PDC_LO(%r0),%r3
-	ldw             MEM_PDC_HI(%r0),%r6
-	depd            %r6, 31, 32, %r3        /* move to upper word */
-
 	mfctl		%cr30,%r6		/* PCX-W2 firmware bug */
 
 	ldo             PDC_PSW(%r0),%arg0              /* 21 */
@@ -268,6 +272,8 @@ $install_iva:
 aligned_rfi:
 	pcxt_ssm_bug
 
+	copy		%r3, %arg0	/* PDCE_PROC for smp_callin() */
+
 	rsm		PSW_SM_QUIET,%r0	/* off troublesome PSW bits */
 	/* Don't need NOPs, have 8 compliant insn before rfi */
 
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 30c28ab14540..4065b5e48c9d 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -292,10 +292,15 @@ smp_cpu_init(int cpunum)
  * Slaves start using C here. Indirectly called from smp_slave_stext.
  * Do what start_kernel() and main() do for boot strap processor (aka monarch)
  */
-void __init smp_callin(void)
+void __init smp_callin(unsigned long pdce_proc)
 {
 	int slave_id = cpu_now_booting;
 
+#ifdef CONFIG_64BIT
+	WARN_ON(((unsigned long)(PAGE0->mem_pdc_hi) << 32
+			| PAGE0->mem_pdc) != pdce_proc);
+#endif
+
 	smp_cpu_init(slave_id);
 	preempt_disable();
 
