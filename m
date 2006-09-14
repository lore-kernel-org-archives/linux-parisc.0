From: David Woodhouse <dwmw2@infradead.org>
Subject: [parisc-linux] [PATCH] Fix 'make headers_check' for PARISC in 2.6.18
Date: Thu, 14 Sep 2006 11:47:54 +0100
Message-ID: <1158230874.4312.51.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: matthew@wil.cx
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

Running 'make headers_check' with the 2.6.18-rc7 kernel gives this error
on parisc:

  CHECK   include/asm/page.h
/tmp/khdr-parisc/include/asm/page.h requires asm-generic/memory_model.h,
which does not exist in exported headers

Fix attached. Please apply and forward to Linus before 2.6.18, if you
want parisc to be working in the linux-libc-headers which get released
based on the 2.6.18 exported headers. Having an empty asm/page.h is fine
-- it's one of the headers which is probably going to disappear entirely
in future. But for now, having it break the compile if it does happen to
be included is a bad thing.

The patch also removes some gratuitous and probably incorrect noise
within #ifndef __KERNEL__, and corrects a some comments. 

Signed-off-by: David Woodhouse <dwmw2@infradead.org>

diff --git a/include/asm-parisc/page.h b/include/asm-parisc/page.h
index 0695bc9..cb90065 100644
--- a/include/asm-parisc/page.h
+++ b/include/asm-parisc/page.h
@@ -1,22 +1,14 @@
 #ifndef _PARISC_PAGE_H
 #define _PARISC_PAGE_H
 
-#if !defined(__KERNEL__)
-/* this is for userspace applications (4k page size) */
-# define PAGE_SHIFT	12	/* 4k */
-# define PAGE_SIZE	(1UL << PAGE_SHIFT)
-# define PAGE_MASK	(~(PAGE_SIZE-1))
-#endif
-
-
 #ifdef __KERNEL__
 
 #if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
-# define PAGE_SHIFT	12	/* 4k */
+# define PAGE_SHIFT	12	/* 4KiB */
 #elif defined(CONFIG_PARISC_PAGE_SIZE_16KB)
-# define PAGE_SHIFT	14	/* 16k */
+# define PAGE_SHIFT	14	/* 16KiB */
 #elif defined(CONFIG_PARISC_PAGE_SIZE_64KB)
-# define PAGE_SHIFT	16	/* 64k */
+# define PAGE_SHIFT	16	/* 64KiB */
 #else
 # error "unknown default kernel page size"
 #endif
@@ -188,9 +180,8 @@ #define virt_to_page(kaddr)     pfn_to_p
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-#endif /* __KERNEL__ */
