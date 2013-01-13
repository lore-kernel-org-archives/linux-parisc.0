From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove compat_rt_sigframe.h
Date: Sun, 13 Jan 2013 17:09:51 -0500
Message-ID: <BLU0-SMTP3894BB0B7A310D6B2EF632972F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-44--296814422"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-44--296814422
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Someone mentioned several months ago that compat_rt_sigframe.h was not  
used anywhere.
Removing it works for me.

Signed-off-by: John David Anglin <dave.anglin@bell.net>



--Apple-Mail-44--296814422
Content-Disposition: attachment; filename="compat_rt_sigframe.h.d.txt"
Content-Type: text/plain; x-unix-mode=0644;
	name="compat_rt_sigframe.h.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/compat_rt_sigframe.h b/arch/parisc/include/asm/compat_rt_sigframe.h
deleted file mode 100644
index b3f95a7..0000000
--- a/arch/parisc/include/asm/compat_rt_sigframe.h
+++ /dev/null
@@ -1,50 +0,0 @@
-#include <linux/compat.h>
-#include <linux/compat_siginfo.h>
-#include <asm/compat_ucontext.h>
-
-#ifndef _ASM_PARISC_COMPAT_RT_SIGFRAME_H
-#define _ASM_PARISC_COMPAT_RT_SIGFRAME_H
-
-/* In a deft move of uber-hackery, we decide to carry the top half of all
- * 64-bit registers in a non-portable, non-ABI, hidden structure.
- * Userspace can read the hidden structure if it *wants* but is never
- * guaranteed to be in the same place. Infact the uc_sigmask from the 
- * ucontext_t structure may push the hidden register file downards
- */
-struct compat_regfile {
-	/* Upper half of all the 64-bit registers that were truncated
-	   on a copy to a 32-bit userspace */
-	compat_int_t rf_gr[32];
-	compat_int_t rf_iasq[2];
-	compat_int_t rf_iaoq[2];
-	compat_int_t rf_sar;
-};
-
-#define COMPAT_SIGRETURN_TRAMP 4
-#define COMPAT_SIGRESTARTBLOCK_TRAMP 5 
-#define COMPAT_TRAMP_SIZE (COMPAT_SIGRETURN_TRAMP + COMPAT_SIGRESTARTBLOCK_TRAMP)
-
-struct compat_rt_sigframe {
-	/* XXX: Must match trampoline size in arch/parisc/kernel/signal.c 
-	        Secondary to that it must protect the ERESTART_RESTARTBLOCK
-		trampoline we left on the stack (we were bad and didn't 
-		change sp so we could run really fast.) */
-	compat_uint_t tramp[COMPAT_TRAMP_SIZE];
-	compat_siginfo_t info;
-	struct compat_ucontext uc;
-	/* Hidden location of truncated registers, *must* be last. */
-	struct compat_regfile regs; 
-};
-
-/*
- * The 32-bit ABI wants at least 48 bytes for a function call frame:
- * 16 bytes for arg0-arg3, and 32 bytes for magic (the only part of
- * which Linux/parisc uses is sp-20 for the saved return pointer...)
- * Then, the stack pointer must be rounded to a cache line (64 bytes).
- */
-#define SIGFRAME32		64
-#define FUNCTIONCALLFRAME32	48
-#define PARISC_RT_SIGFRAME_SIZE32					\
-	(((sizeof(struct compat_rt_sigframe) + FUNCTIONCALLFRAME32) + SIGFRAME32) & -SIGFRAME32)
--Apple-Mail-44--296814422--
