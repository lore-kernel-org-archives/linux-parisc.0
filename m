From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] kernel BUG at mm/mmap.c:1990  [PATCH attached]
Date: Wed, 13 Dec 2006 22:50:43 +0100
Message-ID: <200612132250.43504.deller__49289.704350713$1416624231$gmane$org@gmx.de>
References: <200612112338.13980.deller@gmx.de>
	<20061212011409.GD4044@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061212011409.GD4044@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 12 December 2006 02:14, Kyle McMartin wrote:
> On Mon, Dec 11, 2006 at 11:38:13PM +0100, Helge Deller wrote:
> > Maybe someone has an idea ?
> > 
> > The "adjtimex02" test from the Linux Test Project (http://ltp.sf.net) seems to pass all test, but triggers a kernel BUG in mm/mmap.c:1990 when exiting.
> > strace is attached below.
> 
> iirc this only bites on 32bit kernels.
> 
> This is what Jeff is referring to:
> /*
>  * Testcase reduced from ltp, adjtimex02
>  *
>  * 1) adjtimex(2) fails with errno set to EFAULT if buf does
>  *	   not point to writable memory
>  */
> [...]

The following patch is a first draft which fixes the LTP crashes. It still includes debugging info...
I assume the main problem is, that get_user() and put_user() does not do any memory region checking at all.
I think this is wrong (although the fault handler may have catched most of the wrong ones).

I know my implementation of the function access_ok() is wrong.
I tried and looked at the other arch implementations, but I didn't found an easy one. But I'm sure there is one, and hopefully someone here can point me to a better/correct implementation...?

Comments ?

Helge

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 5575e41..cd8b657 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -488,20 +488,30 @@ handle_store_error:
 #ifdef __KERNEL__
 unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len)
 {
-	mtsp(get_kernel_space(), 1);
-	mtsp(get_user_space(), 2);
-	return pa_memcpy((void __force *)dst, src, len);
+	BUG_ON((long) len < 0);
+	if (access_ok(VERIFY_WRITE, dst, len)) {
+		mtsp(get_kernel_space(), 1);
+		mtsp(get_user_space(), 2);
+		len = pa_memcpy((void __force *)dst, src, len);
+	};
+	return len;
 }
 
 unsigned long copy_from_user(void *dst, const void __user *src, unsigned long len)
 {
-	mtsp(get_user_space(), 1);
-	mtsp(get_kernel_space(), 2);
-	return pa_memcpy(dst, (void __force *)src, len);
+	BUG_ON((long) len < 0);
+	if (access_ok(VERIFY_READ, src, len)) {
+		mtsp(get_user_space(), 1);
+		mtsp(get_kernel_space(), 2);
+		len = pa_memcpy(dst, (void __force *)src, len);
+	} else
+		memset(dst, 0, len);
+	return len;
 }
 
 unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len)
 {
+	BUG_ON((long) len < 0);
 	mtsp(get_user_space(), 1);
 	mtsp(get_user_space(), 2);
 	return pa_memcpy((void __force *)dst, (void __force *)src, len);
diff --git a/include/asm-parisc/uaccess.h b/include/asm-parisc/uaccess.h
index d973e8b..b265d2b 100644
--- a/include/asm-parisc/uaccess.h
+++ b/include/asm-parisc/uaccess.h
@@ -8,6 +8,7 @@
 #include <asm/page.h>
 #include <asm/system.h>
 #include <asm/cache.h>
+#include <asm/io.h>
 #include <asm-generic/uaccess.h>
 
 #define VERIFY_READ 0
@@ -37,23 +38,30 @@ extern int __put_user_bad(void);
 static inline long access_ok(int type, const void __user * addr,
 		unsigned long size)
 {
-	return 1;
+	unsigned long a = (unsigned long __force) addr;
+	long ok;
+	ok = (a < F_EXTEND(0xfff00000));
+	if (unlikely(!ok)) {
+		printk(KERN_ERR "%s: addr=%p len=%lx \n", __FUNCTION__, addr, size);
+		show_stack(NULL,NULL);
+	}
+	return (ok);
 }
 
-#define put_user __put_user
-#define get_user __get_user
 
-#if BITS_PER_LONG == 32
+#if !defined(__LP64__)
 #define LDD_KERNEL(ptr)		__get_kernel_bad();
 #define LDD_USER(ptr)		__get_user_bad();
 #define STD_KERNEL(x, ptr)	__put_kernel_asm64(x,ptr)
 #define STD_USER(x, ptr)	__put_user_asm64(x,ptr)
+#define WORD_DWORD		" .word "
 #else
-#define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
-#define LDD_USER(ptr) __get_user_asm("ldd",ptr)
-#define STD_KERNEL(x, ptr) __put_kernel_asm("std",x,ptr)
-#define STD_USER(x, ptr) __put_user_asm("std",x,ptr)
-#endif
+#define LDD_KERNEL(ptr)		__get_kernel_asm("ldd",ptr)
+#define LDD_USER(ptr)		__get_user_asm("ldd",ptr)
+#define STD_KERNEL(x, ptr)	__put_kernel_asm("std",x,ptr)
+#define STD_USER(x, ptr)	__put_user_asm("std",x,ptr)
+#define WORD_DWORD		" .dword "
+#endif /* !__LP64__ */
 
 /*
  * The exception table contains two values: the first is an address
@@ -104,11 +112,10 @@ struct exception_data {
 	__gu_err;                                       \
 })
 
-#ifdef __LP64__
 #define __get_kernel_asm(ldx,ptr)                       \
 	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
 		"\t.section __ex_table,\"aw\"\n"        \
-		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
+		"\t" WORD_DWORD "\t1b,fixup_get_user_skip_1\n"	\
 		"\t.previous"                          	\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err)		\
@@ -117,30 +124,12 @@ struct exception_data {
 #define __get_user_asm(ldx,ptr)                         \
 	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
 		"\t.section __ex_table,\"aw\"\n"	\
-		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
+		"\t" WORD_DWORD "\t1b,fixup_get_user_skip_1\n"	\
 		"\t.previous"				\
 		: "=r"(__gu_val), "=r"(__gu_err)        \
 		: "r"(ptr), "1"(__gu_err)		\
 		: "r1");
-#else
-#define __get_kernel_asm(ldx,ptr)                       \
-	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
-		"\t.section __ex_table,\"aw\"\n"        \
-		"\t.word\t1b,fixup_get_user_skip_1\n"	\
-		"\t.previous"                          	\
-		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
 
-#define __get_user_asm(ldx,ptr)                         \
-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
-		"\t.section __ex_table,\"aw\"\n"	\
-		 "\t.word\t1b,fixup_get_user_skip_1\n"	\
-		 "\t.previous"                          \
-		: "=r"(__gu_val), "=r"(__gu_err)        \
-		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
-#endif /* !__LP64__ */
 
 #define __put_user(x,ptr)                                       \
 ({								\
@@ -179,12 +168,11 @@ struct exception_data {
  * r8/r9 are already listed as err/val.
  */
 
-#ifdef __LP64__
 #define __put_kernel_asm(stx,x,ptr)                         \
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%1)\n"                 \
 		"\t.section __ex_table,\"aw\"\n"            \
-		"\t.dword\t1b,fixup_put_user_skip_1\n"	    \
+		"\t" WORD_DWORD "\t1b,fixup_put_user_skip_1\n"	    \
 		"\t.previous"                               \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
@@ -194,36 +182,18 @@ struct exception_data {
 	__asm__ __volatile__ (                              \
 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
 		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.dword\t1b,fixup_put_user_skip_1\n"	    \
-		 "\t.previous"                              \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-		: "r1")
-#else
-#define __put_kernel_asm(stx,x,ptr)                         \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%1)\n"                 \
-		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.word\t1b,fixup_put_user_skip_1\n"	    \
+		 "\t" WORD_DWORD "\t1b,fixup_put_user_skip_1\n"	    \
 		 "\t.previous"                              \
 		: "=r"(__pu_err)                            \
 		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
 		: "r1")
 
-#define __put_user_asm(stx,x,ptr)                           \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
-		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.word\t1b,fixup_put_user_skip_1\n"      \
-		 "\t.previous"                              \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-		: "r1")
+#if !defined(__LP64__)
 
-#define __put_kernel_asm64(__val,ptr) do {		    	    \
-	u64 __val64 = (u64)(__val);				    \
-	u32 hi = (__val64) >> 32;					    \
-	u32 lo = (__val64) & 0xffffffff;				    \
+#define __put_kernel_asm64(__val,ptr) do {	    	    \
+	u64 __val64 = (u64)(__val);			    \
+	u32 hi = (__val64) >> 32;			    \
+	u32 lo = (__val64) & 0xffffffff;		    \
 	__asm__ __volatile__ (				    \
 		"\n1:\tstw %2,0(%1)\n"			    \
 		"\n2:\tstw %3,4(%1)\n"			    \
@@ -255,6 +225,26 @@ struct exception_data {
 #endif /* !__LP64__ */
 
 
+/* Uh, these should become the main single-value transfer routines..
+ * They automatically use the right size if we just have the right
+ * pointer type..
+ *
+ * This gets kind of ugly. We want to return _two_ values in "get_user()"
+ * and yet we don't want to do any pointers, because that is too much
+ * of a performance impact. Thus we have a few rather ugly macros here,
+ * and hide all the ugliness from the user.
+ */
+#define put_user(x,ptr) ({				\
+	__chk_user_ptr(ptr);				\
+	likely(access_ok(0,ptr,sizeof(*(ptr)))) ?	\
+	__put_user(x,ptr) : -EFAULT; })
+
+#define get_user(x,ptr) ({				\
+	__chk_user_ptr(ptr);				\
+	likely(access_ok(0,ptr,sizeof(*(ptr)))) ?	\
+	__get_user(x,ptr) : ({ x=0; -EFAULT;});  })
+
+
 /*
  * Complex access routines -- external declarations
  */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
