From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use sort() instead of home-made implementation
Date: Thu, 29 Oct 2009 22:59:01 +0100
Message-ID: <20091029215901.GA30311@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>


diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
index 69dad5a..e5a4390 100644
--- a/arch/parisc/kernel/unwind.c
+++ b/arch/parisc/kernel/unwind.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/kallsyms.h>
+#include <linux/sort.h>
 
 #include <asm/uaccess.h>
 #include <asm/assembly.h>
@@ -115,24 +116,21 @@ unwind_table_init(struct unwind_table *table, const char *name,
 	}
 }
 
+static int cmp_unwind_table_entry(const void *a, const void *b)
+{
+	return ((const struct unwind_table_entry *)a)->region_start
+	     - ((const struct unwind_table_entry *)b)->region_start;
+}
+
 static void
 unwind_table_sort(struct unwind_table_entry *start,
 		  struct unwind_table_entry *finish)
 {
-	struct unwind_table_entry el, *p, *q;
