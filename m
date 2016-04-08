From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Update comment regarding relative addresses in
 exception table
Date: Fri, 8 Apr 2016 21:30:58 +0200
Message-ID: <20160408193058.GE4225@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Update the comment reflecting the last commit to store relative
addresses in the exception table.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 6f893d2..7955e43 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -44,20 +44,18 @@ static inline long access_ok(int type, const void __user * addr,
 #define LDD_USER(ptr)		BUILD_BUG()
 #define STD_KERNEL(x, ptr)	__put_kernel_asm64(x, ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x, ptr)
-#define ASM_WORD_INSN		".word\t"
 #else
 #define LDD_KERNEL(ptr)		__get_kernel_asm("ldd", ptr)
 #define LDD_USER(ptr)		__get_user_asm("ldd", ptr)
 #define STD_KERNEL(x, ptr)	__put_kernel_asm("std", x, ptr)
 #define STD_USER(x, ptr)	__put_user_asm("std", x, ptr)
-#define ASM_WORD_INSN		".dword\t"
 #endif
 
 /*
- * The exception table contains two values: the first is an address
- * for an instruction that is allowed to fault, and the second is
- * the address to the fixup routine. Even on a 64bit kernel we could
- * use a 32bit (unsigned int) address here.
+ * The exception table contains two values: the first is the relative offset to
+ * the address of the instruction that is allowed to fault, and the second is
+ * the relative offset to the address of the fixup routine. Since relative
+ * addresses are used, 32bit values are sufficient even on 64bit kernel.
  */
 
 #define ARCH_HAS_RELATIVE_EXTABLE
