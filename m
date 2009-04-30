From: Tim Abbott <tabbott@MIT.EDU>
Subject: [PATCH 5/5] parisc: convert to new generic read_mostly support.
Date: Thu, 30 Apr 2009 19:55:19 -0400
Message-ID: <1241135719-9286-6-git-send-email-tabbott@mit.edu>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu>
 <1241135719-9286-2-git-send-email-tabbott@mit.edu>
 <1241135719-9286-3-git-send-email-tabbott@mit.edu>
 <1241135719-9286-4-git-send-email-tabbott@mit.edu>
 <1241135719-9286-5-git-send-email-tabbott@mit.edu>
Cc: Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org, Tim Abbott <tabbott@mit.edu>
To: Sam Ravnborg <sam@ravnborg.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-5-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Tim Abbott <tabbott@mit.edu>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/Kconfig             |    3 +++
 arch/parisc/include/asm/cache.h |    2 --
 arch/parisc/kernel/head.S       |    3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 9038f39..cc113d0 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -101,6 +101,9 @@ config ARCH_MAY_HAVE_PC_FDC
 	depends on BROKEN
 	default y
 
+config HAVE_READ_MOSTLY_DATA
+	def_bool y
+
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 32c2cca..21e0865 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -28,8 +28,6 @@
 
 #define SMP_CACHE_BYTES L1_CACHE_BYTES
 
-#define __read_mostly __attribute__((__section__(".data.read_mostly")))
-
 void parisc_cache_init(void);	/* initializes cache-flushing */
 void disable_sr_hashing_asm(int); /* low level support for above */
 void disable_sr_hashing(void);   /* turns off space register hashing */
diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
index 0e3d9f9..712d29d 100644
--- a/arch/parisc/kernel/head.S
+++ b/arch/parisc/kernel/head.S
@@ -19,6 +19,7 @@
 #include <asm/assembly.h>
 #include <asm/pgtable.h>
 
+#include <linux/cache.h>
 #include <linux/linkage.h>
 #include <linux/init.h>
 
@@ -345,7 +346,7 @@ smp_slave_stext:
 ENDPROC(stext)
 
 #ifndef CONFIG_64BIT
-	.section .data.read_mostly
+	__READ_MOSTLY
 
 	.align	4
 	.export	$global$,data
-- 
1.6.2.1

