From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Add 64bit get_user() and put_user() for 32bit kernel
Date: Sat, 9 Apr 2016 08:27:08 +0200
Message-ID: <20160409062708.GB4203@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add functionality to access 64-bit values in userspace on a 32-bit
kernel.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 48070f2..efe6c5d 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -40,7 +40,7 @@ static inline long access_ok(int type, const void __user * addr,
 #define get_user __get_user
 
 #if !defined(CONFIG_64BIT)
-#define LDD_USER(ptr)		BUILD_BUG()
+#define LDD_USER(ptr)		__get_user_asm64(ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x, ptr)
 #else
 #define LDD_USER(ptr)		__get_user_asm("ldd", ptr)
@@ -113,6 +113,20 @@ struct exception_data {
 		: "r"(ptr), "1"(__gu_err)		\
 		: "r1");
 
+#if !defined(CONFIG_64BIT)
+
+#define __get_user_asm64(ptr) 				\
+	__asm__("\n1:\tldw 0(%%sr2,%2),%0"		\
+		"\n2:\tldw 4(%%sr2,%2),%R0\n\t"		\
+		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_get_user_skip_2)\
+		ASM_EXCEPTIONTABLE_ENTRY(2b, fixup_get_user_skip_1)\
+		: "=r"(__gu_val), "=r"(__gu_err)	\
+		: "r"(ptr), "1"(__gu_err)		\
+		: "r1");
+
+#endif /* !defined(CONFIG_64BIT) */
+
+
 #define __put_user(x, ptr)                                      \
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;      	\
