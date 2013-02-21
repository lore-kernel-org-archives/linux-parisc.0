From: akpm@linux-foundation.org
Subject: [patch 1/1] mm: use vm_unmapped_area() on parisc architecture
Date: Thu, 21 Feb 2013 15:12:32 -0800
Message-ID: <20130221231233.1155D5A4174@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org,
	akpm@linux-foundation.org, walken@google.com, riel@redhat.com
To: jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Michel Lespinasse <walken@google.com>
Subject: mm: use vm_unmapped_area() on parisc architecture

Update the parisc arch_get_unmapped_area function to make use of
vm_unmapped_area() instead of implementing a brute force search.

Signed-off-by: Michel Lespinasse <walken@google.com>
Acked-by: Rik van Riel <riel@redhat.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/kernel/sys_parisc.c |   46 +++++++++++-------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff -puN arch/parisc/kernel/sys_parisc.c~mm-use-vm_unmapped_area-on-parisc-architecture arch/parisc/kernel/sys_parisc.c
--- a/arch/parisc/kernel/sys_parisc.c~mm-use-vm_unmapped_area-on-parisc-architecture
+++ a/arch/parisc/kernel/sys_parisc.c
@@ -35,18 +35,15 @@
 
 static unsigned long get_unshared_area(unsigned long addr, unsigned long len)
 {
-	struct vm_area_struct *vma;
+	struct vm_unmapped_area_info info;
 
-	addr = PAGE_ALIGN(addr);
-
-	for (vma = find_vma(current->mm, addr); ; vma = vma->vm_next) {
-		/* At this point:  (!vma || addr < vma->vm_end). */
-		if (TASK_SIZE - len < addr)
-			return -ENOMEM;
-		if (!vma || addr + len <= vma->vm_start)
-			return addr;
-		addr = vma->vm_end;
-	}
+	info.flags = 0;
+	info.length = len;
+	info.low_limit = PAGE_ALIGN(addr);
+	info.high_limit = TASK_SIZE;
+	info.align_mask = 0;
+	info.align_offset = 0;
+	return vm_unmapped_area(&info);
 }
 
 #define DCACHE_ALIGN(addr) (((addr) + (SHMLBA - 1)) &~ (SHMLBA - 1))
@@ -63,30 +60,21 @@ static unsigned long get_unshared_area(u
  */
 static int get_offset(struct address_space *mapping)
 {
-	int offset = (unsigned long) mapping << (PAGE_SHIFT - 8);
-	return offset & 0x3FF000;
+	return (unsigned long) mapping >> 8;
 }
 
 static unsigned long get_shared_area(struct address_space *mapping,
 		unsigned long addr, unsigned long len, unsigned long pgoff)
 {
-	struct vm_area_struct *vma;
-	int offset = mapping ? get_offset(mapping) : 0;
-
-	offset = (offset + (pgoff << PAGE_SHIFT)) & 0x3FF000;
+	struct vm_unmapped_area_info info;
 
-	addr = DCACHE_ALIGN(addr - offset) + offset;
