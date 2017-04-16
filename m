From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix get_user() for 64-bit value on 32-bit kernel
Date: Sun, 16 Apr 2017 10:00:14 +0200
Message-ID: <20170416080014.GA7681@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This fixes a bug in which the upper 32-bits of a 64-bit value which is read by
get_user() was lost.
While touching this code, split out pre-loading of %sr2 space register and
clean up code indent.

Cc: <stable@vger.kernel.org> # v4.9+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 8442727..cbd4f4a 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -39,10 +39,10 @@
 #define get_user __get_user
 
 #if !defined(CONFIG_64BIT)
-#define LDD_USER(ptr)		__get_user_asm64(ptr)
+#define LDD_USER(val, ptr)	__get_user_asm64(val, ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x, ptr)
 #else
-#define LDD_USER(ptr)		__get_user_asm("ldd", ptr)
+#define LDD_USER(val, ptr)	__get_user_asm(val, "ldd", ptr)
 #define STD_USER(x, ptr)	__put_user_asm("std", x, ptr)
 #endif
 
@@ -97,63 +97,87 @@ struct exception_data {
 		" mtsp %0,%%sr2\n\t"		\
 		: : "r"(get_fs()) : )
 
-#define __get_user(x, ptr)                               \
-({                                                       \
-	register long __gu_err __asm__ ("r8") = 0;       \
-	register long __gu_val;				 \
-							 \
-	load_sr2();					 \
-	switch (sizeof(*(ptr))) {			 \
-	    case 1: __get_user_asm("ldb", ptr); break;   \
-	    case 2: __get_user_asm("ldh", ptr); break;   \
-	    case 4: __get_user_asm("ldw", ptr); break;   \
-	    case 8: LDD_USER(ptr);  break;		 \
-	    default: BUILD_BUG(); break;		 \
-	}                                                \
-							 \
-	(x) = (__force __typeof__(*(ptr))) __gu_val;	 \
-	__gu_err;                                        \
+#define __get_user_internal(val, ptr)			\
+({							\
+	register long __gu_err __asm__ ("r8") = 0;	\
+							\
+	switch (sizeof(*(ptr))) {			\
+	case 1: __get_user_asm(val, "ldb", ptr); break;	\
+	case 2: __get_user_asm(val, "ldh", ptr); break; \
+	case 4: __get_user_asm(val, "ldw", ptr); break; \
+	case 8: LDD_USER(val, ptr); break;		\
+	default: BUILD_BUG();				\
+	}						\
+							\
+	__gu_err;					\
 })
 
-#define __get_user_asm(ldx, ptr)                        \
+#define __get_user(val, ptr)				\
+({							\
+	load_sr2();					\
+	__get_user_internal(val, ptr);			\
+})
+
+#define __get_user_asm(val, ldx, ptr)			\
+{							\
+	register long __gu_val;				\
+							\
 	__asm__("1: " ldx " 0(%%sr2,%2),%0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err));
+		: "r"(ptr), "1"(__gu_err));		\
+							\
+	(val) = (__force __typeof__(*(ptr))) __gu_val;	\
+}
 
 #if !defined(CONFIG_64BIT)
 
-#define __get_user_asm64(ptr) 				\
+#define __get_user_asm64(val, ptr)			\
+{							\
+	union {						\
+		unsigned long long	l;		\
+		__typeof__(*(ptr))	t;		\
+	} __gu_tmp;					\
+							\
 	__asm__("   copy %%r0,%R0\n"			\
 		"1: ldw 0(%%sr2,%2),%0\n"		\
 		"2: ldw 4(%%sr2,%2),%R0\n"		\
 		"9:\n"					\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(1b, 9b)	\
 		ASM_EXCEPTIONTABLE_ENTRY_EFAULT(2b, 9b)	\
-		: "=r"(__gu_val), "=r"(__gu_err)	\
-		: "r"(ptr), "1"(__gu_err));
+		: "=&r"(__gu_tmp.l), "=r"(__gu_err)	\
+		: "r"(ptr), "1"(__gu_err));		\
+							\
+	(val) = __gu_tmp.t;				\
+}
 
 #endif /* !defined(CONFIG_64BIT) */
 
 
-#define __put_user(x, ptr)                                      \
+#define __put_user_internal(x, ptr)				\
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;      	\
         __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
 								\
-	load_sr2();						\
 	switch (sizeof(*(ptr))) {				\
-	    case 1: __put_user_asm("stb", __x, ptr); break;     \
-	    case 2: __put_user_asm("sth", __x, ptr); break;     \
-	    case 4: __put_user_asm("stw", __x, ptr); break;     \
-	    case 8: STD_USER(__x, ptr); break;			\
-	    default: BUILD_BUG(); break;			\
-	}                                                       \
+	case 1: __put_user_asm("stb", __x, ptr); break;		\
+	case 2: __put_user_asm("sth", __x, ptr); break;		\
+	case 4: __put_user_asm("stw", __x, ptr); break;		\
+	case 8: STD_USER(__x, ptr); break;			\
+	default: BUILD_BUG();					\
+	}							\
 								\
 	__pu_err;						\
 })
 
+#define __put_user(x, ptr)					\
+({								\
+	load_sr2();						\
+	__put_user_internal(x, ptr);				\
+})
+
+
 /*
  * The "__put_user/kernel_asm()" macros tell gcc they read from memory
  * instead of writing. This is because they do not write to any memory
