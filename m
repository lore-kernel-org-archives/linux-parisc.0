From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Fix alpha, mips, parisc <asm/mman.h>
Date: Tue, 29 Aug 2006 12:33:01 -0400
Message-ID: <20060829163301.GA20357__30378.0158552856$1416624163$gmane$org@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 ralf@linux-mips.org,
 debian-kernel@lists.debian.org
To: stable@kernel.org
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

Fix <asm/mman.h> on arches which do not include the asm-generic
mman.h header. Guard the define of arch_mmap_check() in an
#ifndef __ASSEMBLY__ in case mman.h ends up included in assembly
code as on ia64.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---
diff --git a/include/asm-alpha/mman.h b/include/asm-alpha/mman.h
index 5f24c75..97ebc74 100644
--- a/include/asm-alpha/mman.h
+++ b/include/asm-alpha/mman.h
@@ -52,4 +52,8 @@ #define MADV_DOFORK	11		/* do inherit ac
 #define MAP_ANON	MAP_ANONYMOUS
 #define MAP_FILE	0
 
+#if defined(__KERNEL__) && !defined(__ASSEMBLY__)
+#define arch_mmap_check(addr, len, flags)	(0)
+#endif
+
 #endif /* __ALPHA_MMAN_H__ */
diff --git a/include/asm-mips/mman.h b/include/asm-mips/mman.h
index 046cf68..07b7cce 100644
--- a/include/asm-mips/mman.h
+++ b/include/asm-mips/mman.h
@@ -75,4 +75,8 @@ #define MADV_DOFORK	11		/* do inherit ac
 #define MAP_ANON	MAP_ANONYMOUS
 #define MAP_FILE	0
 
+#if defined(__KERNEL__) && !defined(__ASSEMBLY__)
+#define arch_mmap_check(addr, len, flags)	(0)
+#endif
+
 #endif /* _ASM_MMAN_H */
diff --git a/include/asm-parisc/mman.h b/include/asm-parisc/mman.h
index 0ef15ee..d015a4e 100644
--- a/include/asm-parisc/mman.h
+++ b/include/asm-parisc/mman.h
@@ -59,4 +59,8 @@ #define MAP_ANON	MAP_ANONYMOUS
 #define MAP_FILE	0
 #define MAP_VARIABLE	0
 
+#if defined(__KERNEL__) && !defined(__ASSEMBLY__)
+#define arch_mmap_check(addr, len, flags)	(0)
+#endif
+
 #endif /* __PARISC_MMAN_H__ */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
