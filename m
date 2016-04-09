From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Simplify and speed up get_user() and put_user()
Date: Sat, 9 Apr 2016 08:26:14 +0200
Message-ID: <20160409062614.GA4203@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch simplifies the code for get_user() and put_user() a lot.

Instead of accessing kernel memory (%sr0) and userspace memory (%sr3)
hard-coded in the assembler instruction, we now preload %sr2 with either
%sr0 (for accessing KERNEL_DS) or with sr3 (to access USER_DS) and
use %sr2 in the load directly.

The generated code avoids a branch and speeds up execution by generating
less assembler instructions.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index fbd2e79..48070f2 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -40,14 +40,10 @@ static inline long access_ok(int type, const void __user * addr,
 #define get_user __get_user
 
 #if !defined(CONFIG_64BIT)
-#define LDD_KERNEL(ptr)		BUILD_BUG()
 #define LDD_USER(ptr)		BUILD_BUG()
-#define STD_KERNEL(x, ptr)	__put_kernel_asm64(x, ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x, ptr)
 #else
-#define LDD_KERNEL(ptr)		__get_kernel_asm("ldd", ptr)
 #define LDD_USER(ptr)		__get_user_asm("ldd", ptr)
-#define STD_KERNEL(x, ptr)	__put_kernel_asm("std", x, ptr)
 #define STD_USER(x, ptr)	__put_user_asm("std", x, ptr)
 #endif
 
@@ -79,43 +75,39 @@ struct exception_data {
 	unsigned long fault_addr;
 };
 
+/*
+ * load_sr2() preloads the space register %%sr2 - based on the value of
+ * get_fs() - with either a value of 0 to access kernel space (KERNEL_DS which
+ * is 0), or with the current value of %%sr3 to access user space (USER_DS)
+ * memory. The following __get_user_asm() and __put_user_asm() functions have
+ * %%sr2 hard-coded to access the requested memory.
+ */
+#define load_sr2() \
+	__asm__(" or,=  %0,%%r0,%%r0\n\t"	\
+		" mfsp %%sr3,%0\n\t"		\
+		" mtsp %0,%%sr2\n\t"		\
+		: : "r"(get_fs()) : )
+
 #define __get_user(x, ptr)                               \
 ({                                                       \
 	register long __gu_err __asm__ ("r8") = 0;       \
 	register long __gu_val __asm__ ("r9") = 0;       \
 							 \
-	if (segment_eq(get_fs(), KERNEL_DS)) {           \
-	    switch (sizeof(*(ptr))) {                    \
-	    case 1: __get_kernel_asm("ldb", ptr); break; \
-	    case 2: __get_kernel_asm("ldh", ptr); break; \
-	    case 4: __get_kernel_asm("ldw", ptr); break; \
-	    case 8: LDD_KERNEL(ptr); break;		 \
-	    default: BUILD_BUG(); break;		 \
-	    }                                            \
-	}                                                \
-	else {                                           \
-	    switch (sizeof(*(ptr))) {                    \
+	load_sr2();					 \
+	switch (sizeof(*(ptr))) {			 \
 	    case 1: __get_user_asm("ldb", ptr); break;   \
 	    case 2: __get_user_asm("ldh", ptr); break;   \
 	    case 4: __get_user_asm("ldw", ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		 \
 	    default: BUILD_BUG(); break;		 \
-	    }                                            \
 	}                                                \
 							 \
 	(x) = (__force __typeof__(*(ptr))) __gu_val;	 \
 	__gu_err;                                        \
 })
 
-#define __get_kernel_asm(ldx, ptr)                      \
-	__asm__("\n1:\t" ldx "\t0(%2),%0\n\t"		\
-		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_get_user_skip_1)\
-		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
-
 #define __get_user_asm(ldx, ptr)                        \
-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n\t"	\
+	__asm__("\n1:\t" ldx "\t0(%%sr2,%2),%0\n\t"	\
 		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_get_user_skip_1)\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err)		\
@@ -126,23 +118,13 @@ struct exception_data {
 	register long __pu_err __asm__ ("r8") = 0;      	\
         __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
 								\
-	if (segment_eq(get_fs(), KERNEL_DS)) {                  \
-	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_kernel_asm("stb", __x, ptr); break;   \
-	    case 2: __put_kernel_asm("sth", __x, ptr); break;   \
-	    case 4: __put_kernel_asm("stw", __x, ptr); break;   \
-	    case 8: STD_KERNEL(__x, ptr); break;		\
-	    default: BUILD_BUG(); break;			\
-	    }                                                   \
-	}                                                       \
-	else {                                                  \
-	    switch (sizeof(*(ptr))) {                           \
+	load_sr2();						\
+	switch (sizeof(*(ptr))) {				\
 	    case 1: __put_user_asm("stb", __x, ptr); break;     \
 	    case 2: __put_user_asm("sth", __x, ptr); break;     \
 	    case 4: __put_user_asm("stw", __x, ptr); break;     \
 	    case 8: STD_USER(__x, ptr); break;			\
 	    default: BUILD_BUG(); break;			\
-	    }                                                   \
 	}                                                       \
 								\
 	__pu_err;						\
@@ -158,17 +140,9 @@ struct exception_data {
  * r8/r9 are already listed as err/val.
  */
 
-#define __put_kernel_asm(stx, x, ptr)                       \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%1)\n\t"		    \
-		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_put_user_skip_1)\
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-	    	: "r1")
-
 #define __put_user_asm(stx, x, ptr)                         \
 	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n\t"	    \
+		"\n1:\t" stx "\t%2,0(%%sr2,%1)\n\t"	    \
 		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_put_user_skip_1)\
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
@@ -177,21 +151,10 @@ struct exception_data {
 
 #if !defined(CONFIG_64BIT)
 
-#define __put_kernel_asm64(__val, ptr) do {		    \
-	__asm__ __volatile__ (				    \
-		"\n1:\tstw %2,0(%1)"			    \
-		"\n2:\tstw %R2,4(%1)\n\t"		    \
-		ASM_EXCEPTIONTABLE_ENTRY(1b, fixup_put_user_skip_2)\
-		ASM_EXCEPTIONTABLE_ENTRY(2b, fixup_put_user_skip_1)\
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(__val), "0"(__pu_err) \
-		: "r1");				    \
-} while (0)
