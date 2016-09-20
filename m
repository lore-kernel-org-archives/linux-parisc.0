From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop BROKEN_RODATA config option
Date: Tue, 20 Sep 2016 17:20:10 +0200
Message-ID: <20160920152010.GA5172@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

PARISC was the only architecture which selected the BROKEN_RODATA config
option. Drop it and remove the special handling from init.h as well.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index af12c2d..f8dc10d 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -15,7 +15,6 @@ config PARISC
 	select HAVE_PERF_EVENTS
 	select GENERIC_ATOMIC64 if !64BIT
 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
-	select BROKEN_RODATA
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PCI_IOMAP
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
diff --git a/include/linux/init.h b/include/linux/init.h
index 6935d02..5a3321a 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -41,22 +41,11 @@
    discard it in modules) */
 #define __init		__section(.init.text) __cold notrace
 #define __initdata	__section(.init.data)
-#define __initconst	__constsection(.init.rodata)
+#define __initconst	__section(.init.rodata)
 #define __exitdata	__section(.exit.data)
 #define __exit_call	__used __section(.exitcall.exit)
 
 /*
- * Some architecture have tool chains which do not handle rodata attributes
- * correctly. For those disable special sections for const, so that other
- * architectures can annotate correctly.
- */
-#ifdef CONFIG_BROKEN_RODATA
-#define __constsection(x)
-#else
-#define __constsection(x) __section(x)
-#endif
-
-/*
  * modpost check for section mismatches during the kernel build.
  * A section mismatch happens when there are references from a
  * code or data section to an init section (both code or data).
@@ -75,7 +64,7 @@
  */
 #define __ref            __section(.ref.text) noinline
 #define __refdata        __section(.ref.data)
-#define __refconst       __constsection(.ref.rodata)
+#define __refconst       __section(.ref.rodata)
 
 #ifdef MODULE
 #define __exitused
@@ -88,10 +77,10 @@
 /* Used for MEMORY_HOTPLUG */
 #define __meminit        __section(.meminit.text) __cold notrace
 #define __meminitdata    __section(.meminit.data)
-#define __meminitconst   __constsection(.meminit.rodata)
+#define __meminitconst   __section(.meminit.rodata)
 #define __memexit        __section(.memexit.text) __exitused __cold notrace
 #define __memexitdata    __section(.memexit.data)
-#define __memexitconst   __constsection(.memexit.rodata)
+#define __memexitconst   __section(.memexit.rodata)
 
 /* For assembly routines */
 #define __HEAD		.section	".head.text","ax"
diff --git a/init/Kconfig b/init/Kconfig
index cac3f09..cc20d7a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2108,12 +2108,6 @@ config PADATA
 	depends on SMP
 	bool
 
-# Can be selected by architectures with broken toolchains
-# that get confused by correct const<->read_only section
-# mappings
-config BROKEN_RODATA
-	bool
