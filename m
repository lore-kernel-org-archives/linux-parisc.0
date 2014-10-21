From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: use BUILD_BUG() instead of undefined functions
Date: Tue, 21 Oct 2014 21:29:09 +0200
Message-ID: <20141021192909.GA14247@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 4006964..a5cb070 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -9,6 +9,8 @@
 #include <asm/errno.h>
 #include <asm-generic/uaccess-unaligned.h>
 
+#include <linux/bug.h>
+
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1
 
@@ -28,11 +30,6 @@
  * that put_user is the same as __put_user, etc.
  */
 
-extern int __get_kernel_bad(void);
-extern int __get_user_bad(void);
-extern int __put_kernel_bad(void);
-extern int __put_user_bad(void);
-
 static inline long access_ok(int type, const void __user * addr,
 		unsigned long size)
 {
@@ -43,8 +40,8 @@ static inline long access_ok(int type, const void __user * addr,
 #define get_user __get_user
 
 #if !defined(CONFIG_64BIT)
-#define LDD_KERNEL(ptr)		__get_kernel_bad();
-#define LDD_USER(ptr)		__get_user_bad();
+#define LDD_KERNEL(ptr)		BUILD_BUG()
+#define LDD_USER(ptr)		BUILD_BUG()
 #define STD_KERNEL(x, ptr)	__put_kernel_asm64(x,ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x,ptr)
 #define ASM_WORD_INSN		".word\t"
@@ -94,7 +91,7 @@ struct exception_data {
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: __get_kernel_bad(); break;         \
+	    default: BUILD_BUG(); break;		\
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -103,7 +100,7 @@ struct exception_data {
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: __get_user_bad(); break;           \
+	    default: BUILD_BUG(); break;		\
 	    }                                           \
 	}                                               \
 							\
@@ -136,7 +133,7 @@ struct exception_data {
 	    case 2: __put_kernel_asm("sth",__x,ptr); break;     \
 	    case 4: __put_kernel_asm("stw",__x,ptr); break;     \
 	    case 8: STD_KERNEL(__x,ptr); break;			\
-	    default: __put_kernel_bad(); break;			\
+	    default: BUILD_BUG(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -145,7 +142,7 @@ struct exception_data {
 	    case 2: __put_user_asm("sth",__x,ptr); break;       \
 	    case 4: __put_user_asm("stw",__x,ptr); break;       \
 	    case 8: STD_USER(__x,ptr); break;			\
-	    default: __put_user_bad(); break;			\
+	    default: BUILD_BUG(); break;			\
 	    }                                                   \
 	}                                                       \
 								\
