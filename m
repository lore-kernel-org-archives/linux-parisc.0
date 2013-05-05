From: Helge Deller <deller@gmx.de>
Subject: [PATCH] kernel/modsign_certificate.S: fix build on parisc
 architecture
Date: Sun, 5 May 2013 23:31:18 +0200
Message-ID: <20130505213118.GA1622@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Linux Kernel Development <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org,
	linux-security-module@vger.kernel.org, dhowells@redhat.com
Return-path: <linux-security-module-owner@vger.kernel.org>
List-ID: <linux-security-module.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Module signing functionality breaks the kernel build on parisc with the
following error: 

kernel/built-in.o: In function `load_module_signing_keys':
kernel/modsign_pubkey.c:67: undefined reference to `modsign_certificate_list_end'
kernel/modsign_pubkey.c:66: undefined reference to `modsign_certificate_list'
make[3]: *** [vmlinux] Error 1

The reason why the build fails is because on parisc assembly syntax is
different than on other architectures. Most importantly, a semicolon
marks the start of a comment, while exclamation marks separates
statements.

Currently the GLOBAL(name) macro uses a semicolon to separate the .globl
and the ASM_SYMBOL() statements. On PA-RISC the semicolon will now just
strip the ASM_SYMBOL() statements since it thinks it is a comment and as
such the modsign_certificate_list/modsign_certificate_list_end symbols
will not get defined and will not be in the vmlinux binary.

Fix this problem by adding an own implementation for GLOBAL() on the
PARISC architecture.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/kernel/modsign_certificate.S b/kernel/modsign_certificate.S
index 246b4c6..9b9c2ab 100644
--- a/kernel/modsign_certificate.S
+++ b/kernel/modsign_certificate.S
@@ -7,9 +7,17 @@
 #define ASM_SYMBOL(sym) PASTE(SYMBOL_PREFIX, sym)
 #endif
 
-#define GLOBAL(name)	\
-	.globl ASM_SYMBOL(name);	\
+#if defined(__hppa__)
+ /* HPPA/PA-RISC assembly is special: comments start with semicolon
+  * and exclamation marks separates statements. */
+ #define GLOBAL(name)	\
+	.globl ASM_SYMBOL(name) ! \
 	ASM_SYMBOL(name):
+#else
+ #define GLOBAL(name)	\
+	.globl ASM_SYMBOL(name) ; \
+	ASM_SYMBOL(name):
+#endif
 
 	.section ".init.data","aw"
 
