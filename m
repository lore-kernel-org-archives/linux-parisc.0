From: Randolph Chung <randolph@tausq.org>
Subject: [patch] clean up include/asm-parisc/elf.h
Date: Sun, 24 Feb 2008 10:44:21 -0800
Message-ID: <20080224184421.GE30060@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Cleanup some cruft. No functionality changes.

Signed-off-by: Randolph Chung <tausq@parisc-linux.org>

diff --git a/include/asm-parisc/elf.h b/include/asm-parisc/elf.h
index ce0c0d8..a5f79d3 100644
--- a/include/asm-parisc/elf.h
+++ b/include/asm-parisc/elf.h
@@ -204,7 +204,7 @@ typedef struct elf64_fdesc {
 /*
  * The following definitions are those for 32-bit ELF binaries on a 32-bit
  * kernel and for 64-bit binaries on a 64-bit kernel.  To run 32-bit binaries
- * on a 64-bit kernel, arch/parisc64/kernel/binfmt_elf32.c defines these
+ * on a 64-bit kernel, arch/parisc/kernel/binfmt_elf32.c defines these
  * macros appropriately and then #includes binfmt_elf.c, which then includes
  * this file.
  */
@@ -216,26 +216,25 @@ typedef struct elf64_fdesc {
  * Note that this header file is used by default in fs/binfmt_elf.c. So
  * the following macros are for the default case. However, for the 64
  * bit kernel we also support 32 bit parisc binaries. To do that
- * arch/parisc64/kernel/binfmt_elf32.c defines its own set of these
+ * arch/parisc/kernel/binfmt_elf32.c defines its own set of these
  * macros, and then it includes fs/binfmt_elf.c to provide an alternate
  * elf binary handler for 32 bit binaries (on the 64 bit kernel).
  */
 #ifdef CONFIG_64BIT
-#define ELF_CLASS       ELFCLASS64
+#define ELF_CLASS   ELFCLASS64
 #else
 #define ELF_CLASS	ELFCLASS32
 #endif
 
 typedef unsigned long elf_greg_t;
 
-/* This yields a string that ld.so will use to load implementation
-   specific libraries for optimization.  This is more specific in
-   intent than poking at uname or /proc/cpuinfo.
-
-   For the moment, we have only optimizations for the Intel generations,
-   but that could change... */
+/* 
+ * This yields a string that ld.so will use to load implementation
+ * specific libraries for optimization.  This is more specific in
+ * intent than poking at uname or /proc/cpuinfo.
+ */
 
-#define ELF_PLATFORM  ("PARISC\0" /*+((boot_cpu_data.x86-3)*5) */)
+#define ELF_PLATFORM  ("PARISC\0")
 
 #define SET_PERSONALITY(ex, ibcs2) \
 	current->personality = PER_LINUX; \
@@ -310,7 +309,7 @@ struct pt_regs;	/* forward declaration... */
 #define ELF_OSABI 	ELFOSABI_LINUX
 
 /* %r23 is set by ld.so to a pointer to a function which might be 
-   registered using atexit.  This provides a mean for the dynamic
+   registered using atexit.  This provides a means for the dynamic
    linker to call DT_FINI functions for shared libraries that have
    been loaded before the code runs.
 
@@ -339,6 +338,5 @@ struct pt_regs;	/* forward declaration... */
    but it's not easy, and we've already done it here.  */
 
 #define ELF_HWCAP	0
-/* (boot_cpu_data.x86_capability) */
 
 #endif
