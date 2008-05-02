From: akpm@linux-foundation.org
Subject: [patch 4/5] parisc: remove redundant display of free swap space in show_mem()
Date: Fri, 02 May 2008 13:43:33 -0700
Message-ID: <200805022043.m42KhXQC013905@imap1.linux-foundation.org>
Cc: linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	hannes@saeurebad.de, grundler@parisc-linux.org, matthew@wil.cx
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Johannes Weiner <hannes@saeurebad.de>

show_mem() has no need to print the amount of free swap space manually because
show_free_areas() does this already and is called by the former.

The two outputs only differ in text formatting:

  printk("Free swap  = %lukB\n", ...);
  printk("Free swap:       %6ldkB\n", ...);

Signed-off-by: Johannes Weiner <hannes@saeurebad.de>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@parisc-linux.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/mm/init.c |    2 --
 1 file changed, 2 deletions(-)

diff -puN arch/parisc/mm/init.c~parisc-remove-redundant-display-of-free-swap-space-in-show_mem arch/parisc/mm/init.c
--- a/arch/parisc/mm/init.c~parisc-remove-redundant-display-of-free-swap-space-in-show_mem
+++ a/arch/parisc/mm/init.c
@@ -555,8 +555,6 @@ void show_mem(void)
 
 	printk(KERN_INFO "Mem-info:\n");
 	show_free_areas();
-	printk(KERN_INFO "Free swap:	 %6ldkB\n",
-				nr_swap_pages<<(PAGE_SHIFT-10));
 #ifndef CONFIG_DISCONTIGMEM
 	i = max_mapnr;
 	while (i-- > 0) {
_
