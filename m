From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add build-time sanity checks for compat ipc struct
 sizes
Date: Wed, 28 Oct 2015 23:30:10 +0100
Message-ID: <20151028223010.GA27319@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Ensure that the size of various compat ipc structs are the same as of
the native kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index c229427..f2ee988 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -23,6 +23,7 @@
 #include <linux/unistd.h>
 #include <linux/nodemask.h>	/* for node_online_map */
 #include <linux/pagemap.h>	/* for release_pages and page_cache_release */
+#include <linux/compat.h>
 
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
@@ -30,6 +31,7 @@
 #include <asm/pdc_chassis.h>
 #include <asm/mmzone.h>
 #include <asm/sections.h>
+#include <asm/msgbuf.h>
 
 extern int  data_start;
 extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */
@@ -590,6 +592,14 @@ unsigned long pcxl_dma_start __read_mostly;
 
 void __init mem_init(void)
 {
+#ifdef CONFIG_COMPAT
+	/* Do sanity checks on compat structures */
+	BUILD_BUG_ON(sizeof(struct compat_ipc64_perm) != sizeof(struct ipc64_perm));
+	BUILD_BUG_ON(sizeof(struct compat_msqid64_ds) != sizeof(struct msqid64_ds));
+	BUILD_BUG_ON(sizeof(struct compat_semid64_ds) != sizeof(struct semid64_ds));
+	BUILD_BUG_ON(sizeof(struct compat_shmid64_ds) != sizeof(struct shmid64_ds));
+#endif
+
 	/* Do sanity checks on page table constants */
 	BUILD_BUG_ON(PTE_ENTRY_SIZE != sizeof(pte_t));
 	BUILD_BUG_ON(PMD_ENTRY_SIZE != sizeof(pmd_t));
