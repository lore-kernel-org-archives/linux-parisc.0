From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] limit thread stack size with >4K pages
Date: Sat, 17 Mar 2007 13:23:05 +0100
Message-ID: <200703171323.06002.deller__27255.2623333924$1416624327$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Kyle McMartin <kyle@mcmartin.ca>
To: parisc-linux@lists.parisc-linux.org
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

This patch limits the thread stack size when pages >4 K were selected.
i.e. THREAD_SIZE is calculated to "MAX(16K, PAGE_SIZE)"

diff-tree 6033080df2431638223580559ebea54efb22bc42 (from cd54f53359c3e0deb898a5dbb199b70c5cb6ef0f)
Author: Helge Deller <deller@gmx.de>
Date:   Sat Mar 17 13:19:01 2007 +0100

    [PARISC] limit thread stack size with >4K pages
    
    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/asm-parisc/thread_info.h b/include/asm-parisc/thread_info.h
index 949314c..ec92d66 100644
--- a/include/asm-parisc/thread_info.h
+++ b/include/asm-parisc/thread_info.h
@@ -34,11 +34,16 @@ struct thread_info {
 
 /* thread information allocation */
 
-#define THREAD_ORDER            2
+#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
+# define THREAD_ORDER	2
+#elif defined(CONFIG_PARISC_PAGE_SIZE_16KB)
+# define THREAD_ORDER	0
+#elif defined(CONFIG_PARISC_PAGE_SIZE_64KB)
+# define THREAD_ORDER	0
+#endif
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
 #define THREAD_SIZE             (PAGE_SIZE << THREAD_ORDER)
-#define THREAD_SHIFT            (PAGE_SHIFT + THREAD_ORDER)
 
 #define alloc_thread_info(tsk) ((struct thread_info *) \
 			__get_free_pages(GFP_KERNEL, THREAD_ORDER))
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
