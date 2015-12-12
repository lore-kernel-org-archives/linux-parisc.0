From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Reduce overhead of parisc_requires_coherency()
Date: Sat, 12 Dec 2015 18:22:03 +0100
Message-ID: <20151212172203.GA1118@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index 7e759ec..2e674e1 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -311,18 +311,17 @@ extern unsigned long get_wchan(struct task_struct *p);
 #define cpu_relax()	barrier()
 #define cpu_relax_lowlatency() cpu_relax()
 
-/* Used as a macro to identify the combined VIPT/PIPT cached
- * CPUs which require a guarantee of coherency (no inequivalent
- * aliases with different data, whether clean or not) to operate */
-static inline int parisc_requires_coherency(void)
-{
+/*
+ * parisc_requires_coherency() is used to identify the combined VIPT/PIPT
+ * cached CPUs which require a guarantee of coherency (no inequivalent aliases
+ * with different data, whether clean or not) to operate
+ */
 #ifdef CONFIG_PA8X00
-	return (boot_cpu_data.cpu_type == mako) ||
-		(boot_cpu_data.cpu_type == mako2);
+extern int _parisc_requires_coherency;
+#define parisc_requires_coherency()	_parisc_requires_coherency
 #else
-	return 0;
+#define parisc_requires_coherency()	(0)
 #endif
-}
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index b68d977..e81ccf1 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -44,6 +44,10 @@
 
 struct system_cpuinfo_parisc boot_cpu_data __read_mostly;
 EXPORT_SYMBOL(boot_cpu_data);
+#ifdef CONFIG_PA8X00
+int _parisc_requires_coherency __read_mostly;
+EXPORT_SYMBOL(_parisc_requires_coherency);
+#endif
 
 DEFINE_PER_CPU(struct cpuinfo_parisc, cpu_data);
 
@@ -277,8 +281,12 @@ void __init collect_boot_cpu_data(void)
 	boot_cpu_data.cpu_type = parisc_get_cpu_type(boot_cpu_data.hversion);
 	boot_cpu_data.cpu_name = cpu_name_version[boot_cpu_data.cpu_type][0];
 	boot_cpu_data.family_name = cpu_name_version[boot_cpu_data.cpu_type][1];
-}
 
+#ifdef CONFIG_PA8X00
+	_parisc_requires_coherency = (boot_cpu_data.cpu_type == mako) ||
+				(boot_cpu_data.cpu_type == mako2);
+#endif
+}
 
 
 /**
