From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid function pointers for kernel exception routines
Date: Fri, 8 Apr 2016 21:27:31 +0200
Message-ID: <20160408192731.GB4225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We want to avoid the kernel module loader to create function pointers
for the kernel fixup routines of get_user() and put_user(). Changing
the external reference from function type to int type fixes this.

This unbreaks exception handling for get_user() and put_user() when
called from a kernel module.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 568b2c6..3cad8aa 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -47,11 +47,11 @@ EXPORT_SYMBOL(__cmpxchg_u64);
 EXPORT_SYMBOL(lclear_user);
 EXPORT_SYMBOL(lstrnlen_user);
 
-/* Global fixups */
-extern void fixup_get_user_skip_1(void);
-extern void fixup_get_user_skip_2(void);
-extern void fixup_put_user_skip_1(void);
-extern void fixup_put_user_skip_2(void);
+/* Global fixups - defined as int to avoid creation of function pointers */
+extern int fixup_get_user_skip_1;
+extern int fixup_get_user_skip_2;
+extern int fixup_put_user_skip_1;
+extern int fixup_put_user_skip_2;
 EXPORT_SYMBOL(fixup_get_user_skip_1);
 EXPORT_SYMBOL(fixup_get_user_skip_2);
 EXPORT_SYMBOL(fixup_put_user_skip_1);
