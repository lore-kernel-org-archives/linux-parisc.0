From: Helge Deller <deller@gmx.de>
Subject: [PATCH 5/9] parisc: Initialize the fault vector earlier in the boot process.
Date: Fri, 20 Nov 2015 22:38:38 +0100
Message-ID: <1448055522-11594-6-git-send-email-deller@gmx.de>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1448055522-11594-1-git-send-email-deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

A fault vector on parisc needs to be 2K aligned.  Furthermore the
checksum of the fault vector needs to sum up to 0 which is being
calculated and written at runtime.

Up to now we aligned both PA20 and PA11 fault vectors on the same 4K
page in order to easily write the checksum after having mapped the
kernel read-only (by mapping this page only as read-write).
But when we want to map the kernel text and data on huge pages this
makes things harder.
So, simplify it by aligning both fault vectors on 2K boundries and write
the checksum before we map the page read-only.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/entry.S | 11 +++--------
 arch/parisc/kernel/setup.c |  3 +++
 arch/parisc/kernel/traps.c | 35 +++++++++++++++--------------------
 3 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index c5ef408..b2fdc44 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -646,17 +646,12 @@
 
 
 	/*
-	 * Align fault_vector_20 on 4K boundary so that both
-	 * fault_vector_11 and fault_vector_20 are on the
-	 * same page. This is only necessary as long as we
-	 * write protect the kernel text, which we may stop
-	 * doing once we use large page translations to cover
-	 * the static part of the kernel address space.
+	 * Fault_vectors are architecturally required to be aligned on a 2K
+	 * boundary
 	 */
 
 	.text
-
-	.align 4096
+	.align 2048
 
 ENTRY(fault_vector_20)
 	/* First vector is invalid (0) */
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 72a3c65..f097762 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -377,6 +377,7 @@ arch_initcall(parisc_init);
 void start_parisc(void)
 {
 	extern void start_kernel(void);
+	extern void early_trap_init(void);
 
 	int ret, cpunum;
 	struct pdc_coproc_cfg coproc_cfg;
@@ -397,6 +398,8 @@ void start_parisc(void)
 		panic("must have an fpu to boot linux");
 	}
 
+	early_trap_init(); /* initialize checksum of fault_vector */
+
 	start_kernel();
 	// not reached
 }
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index b99b39f..553b098 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -807,7 +807,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 }
 
 
-int __init check_ivt(void *iva)
+void __init initialize_ivt(const void *iva)
 {
 	extern u32 os_hpmc_size;
 	extern const u32 os_hpmc[];
@@ -818,8 +818,8 @@ int __init check_ivt(void *iva)
 	u32 *hpmcp;
 	u32 length;
 
-	if (strcmp((char *)iva, "cows can fly"))
-		return -1;
+	if (strcmp((const char *)iva, "cows can fly"))
+		panic("IVT invalid");
 
 	ivap = (u32 *)iva;
 
@@ -839,28 +839,23 @@ int __init check_ivt(void *iva)
 	    check += ivap[i];
 
 	ivap[5] = -check;
-
-	return 0;
 }
 	
-#ifndef CONFIG_64BIT
-extern const void fault_vector_11;
-#endif
-extern const void fault_vector_20;
 
-void __init trap_init(void)
+/* early_trap_init() is called before we set up kernel mappings and
+ * write-protect the kernel */
+void  __init early_trap_init(void)
 {
-	void *iva;
+	extern const void fault_vector_20;
 
-	if (boot_cpu_data.cpu_type >= pcxu)
-		iva = (void *) &fault_vector_20;
-	else
-#ifdef CONFIG_64BIT
-		panic("Can't boot 64-bit OS on PA1.1 processor!");
-#else
-		iva = (void *) &fault_vector_11;
+#ifndef CONFIG_64BIT
+	extern const void fault_vector_11;
+	initialize_ivt(&fault_vector_11);
 #endif
 
-	if (check_ivt(iva))
-		panic("IVT invalid");
+	initialize_ivt(&fault_vector_20);
+}
+
+void __init trap_init(void)
+{
 }
-- 
2.1.0

