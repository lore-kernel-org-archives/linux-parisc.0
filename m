From: akpm@linux-foundation.org
Subject: [patch 2/5] parisc: replace remaining __FUNCTION__ occurrences
Date: Fri, 02 May 2008 13:43:31 -0700
Message-ID: <200805022043.m42KhVpr013899@imap1.linux-foundation.org>
Cc: linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	harvey.harrison@gmail.com, grundler@parisc-linux.org,
	willy@debian.org
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Harvey Harrison <harvey.harrison@gmail.com>

__FUNCTION__ is gcc-specific, use __func__

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@parisc-linux.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/kernel/inventory.c |    2 +-
 arch/parisc/kernel/traps.c     |    2 +-
 arch/parisc/kernel/unaligned.c |    2 +-
 arch/parisc/lib/memcpy.c       |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff -puN arch/parisc/kernel/inventory.c~parisc-replace-remaining-__function__-occurences arch/parisc/kernel/inventory.c
--- a/arch/parisc/kernel/inventory.c~parisc-replace-remaining-__function__-occurences
+++ a/arch/parisc/kernel/inventory.c
@@ -499,7 +499,7 @@ add_system_map_addresses(struct parisc_d
 	dev->addr = kmalloc(num_addrs * sizeof(unsigned long), GFP_KERNEL);
 	if(!dev->addr) {
 		printk(KERN_ERR "%s %s(): memory allocation failure\n",
-		       __FILE__, __FUNCTION__);
+		       __FILE__, __func__);
 		return;
 	}
 
diff -puN arch/parisc/kernel/traps.c~parisc-replace-remaining-__function__-occurences arch/parisc/kernel/traps.c
--- a/arch/parisc/kernel/traps.c~parisc-replace-remaining-__function__-occurences
+++ a/arch/parisc/kernel/traps.c
@@ -275,7 +275,7 @@ KERN_CRIT "                     ||     |
 
 	/* Wot's wrong wif bein' racy? */
 	if (current->thread.flags & PARISC_KERNEL_DEATH) {
-		printk(KERN_CRIT "%s() recursion detected.\n", __FUNCTION__);
+		printk(KERN_CRIT "%s() recursion detected.\n", __func__);
 		local_irq_enable();
 		while (1);
 	}
diff -puN arch/parisc/kernel/unaligned.c~parisc-replace-remaining-__function__-occurences arch/parisc/kernel/unaligned.c
--- a/arch/parisc/kernel/unaligned.c~parisc-replace-remaining-__function__-occurences
+++ a/arch/parisc/kernel/unaligned.c
@@ -30,7 +30,7 @@
 /* #define DEBUG_UNALIGNED 1 */
 
 #ifdef DEBUG_UNALIGNED
-#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __FUNCTION__ ); printk(KERN_DEBUG fmt, ##args ); } while (0)
+#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __func__ ); printk(KERN_DEBUG fmt, ##args ); } while (0)
 #else
 #define DPRINTF(fmt, args...)
 #endif
diff -puN arch/parisc/lib/memcpy.c~parisc-replace-remaining-__function__-occurences arch/parisc/lib/memcpy.c
--- a/arch/parisc/lib/memcpy.c~parisc-replace-remaining-__function__-occurences
+++ a/arch/parisc/lib/memcpy.c
@@ -91,7 +91,7 @@ DECLARE_PER_CPU(struct exception_data, e
 #define THRESHOLD	16
 
 #ifdef DEBUG_MEMCPY
-#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __FUNCTION__ ); printk(KERN_DEBUG fmt, ##args ); } while (0)
+#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __func__ ); printk(KERN_DEBUG fmt, ##args ); } while (0)
 #else
 #define DPRINTF(fmt, args...)
 #endif
_
