From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] parisc: report inequivalent aliases only for writeable
 mappings
Date: Wed, 22 Jan 2014 14:11:40 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401221402190.12739@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

Here I'm sending a fix for parisc for Debian 5 userspace.

I'm just curious - why are those kmap_atomic and kunmap_atomic overrides 
needed while other architectures with virtually indexed caches (such as 
sparc) don't override these functions? It is that the other architectures 
flush cache at differnet points where parisc doesn't flush it?

Mikulas


From: Mikulas Patocka <mpatocka@redhat.com>

The patch f8dae00684d678afa13041ef170cecfd1297ed40 breaks Debian 5
userspace. After application of the patch, you get a lot of INEQUIVALENT
ALIASES messages on various dynamic libraries - so many that the system is
unbootable.

This patch changes it so that INEQUIVALENT ALIASES are only reported for
writeable mappings. PA-RISC specification allows inequivalent aliases for
read-only mappings, so there's no need to report them as an error.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/parisc/kernel/cache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-3.13/arch/parisc/kernel/cache.c
===================================================================
--- linux-3.13.orig/arch/parisc/kernel/cache.c	2014-01-20 21:40:18.000000000 +0100
+++ linux-3.13/arch/parisc/kernel/cache.c	2014-01-20 21:43:23.000000000 +0100
@@ -325,7 +325,7 @@ void flush_dcache_page(struct page *page
 		flush_tlb_page(mpnt, addr);
 		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
-			if (old_addr)
+			if (old_addr && unlikely(mapping->i_mmap_writable != 0))
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
 			old_addr = addr;
 		}
