Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id D064D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Sep 2002 09:11:28 -0600 (MDT)
Date: Fri, 27 Sep 2002 17:11:23 +0200
Message-ID: <3D8F01140000163B@ocpmta2.be.tiscali.com>
In-Reply-To: <3D8F011400001618@ocpmta2.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] MM gurus help request
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Sorry it is bad :(
>
>Hi all,
>
>To manage put_user(x, ptr) with x a 64bits (long long), I found another
way
>to access the address of x and suggest following solution.
>
>--- uaccess.h.orig	2002-09-25 13:59:09.000000000 +0200
>+++ uaccess.h	2002-09-27 16:57:06.000000000 +0200
>@@ -35,10 +35,13 @@
> #define get_user __get_user
> 
> #if BITS_PER_LONG == 32
>+
> #define LDD_KERNEL(ptr)		BUG()
> #define LDD_USER(ptr)		BUG()
>-#define STD_KERNEL(x, ptr)	BUG()
>-#define STD_USER(x, ptr)	BUG()
>+#define STD_KERNEL(x, ptr)	__put_kernel_asm_64(x, ptr)
>+
>+#define STD_USER(x, ptr)	__put_user_asm_64(x, ptr)
>+
> #else
> #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
> #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
>@@ -137,6 +140,7 @@
> #define __put_user(x,ptr)                                       \
> ({								\
> 	register long __pu_err __asm__ ("r8") = 0;		\
>+	register long long * __tmp = 0;		\
> 								\
> 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
> 	    switch (sizeof(*(ptr))) {                           \
>@@ -200,6 +204,22 @@
> 		: "=r"(__pu_err)                            \
> 		: "r"(ptr), "r"(x), "0"(__pu_err))
> 
>+#define __put_kernel_asm_64(x, ptr)                    \
>+        __asm__ __volatile__ (                              \
>+                "\n\tldw\t0(%2),%3\n"           \
>+                "1:\tstw\t%3,0(%1)\n"                     \
>+                "\tldw\t4(%2),%3\n"             \
>+                "2:\tstw\t%3,4(%1)\n"                       \
>+                "3:\n"                                      \
>+                "\t.section __ex_table,\"a\"\n"             \
>+                 "\t.word\t1b\n"                            \
>+                 "\t.word\t(3b-1b)+1\n"                     \
>+                 "\t.word\t2b\n"                            \
>+                 "\t.word\t(3b-2b)+1\n"                     \
>+                 "\t.previous"                              \
>+                : "=r"(__pu_err)                            \
>+                : "r"(ptr), "r"(&x), "r"(__tmp),  "0"(__pu_err))
>+
> #define __put_user_asm(stx,x,ptr)                           \
> 	__asm__ __volatile__ (                              \
> 		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
>@@ -210,6 +230,23 @@
> 		 "\t.previous"                              \
> 		: "=r"(__pu_err)                            \
> 		: "r"(ptr), "r"(x), "0"(__pu_err))
>+
>+#define __put_user_asm_64(x, ptr)                      \
>+        __asm__ __volatile__ (                              \
>+                "\n\tldw\t0(%%sr3,%2),%3\n"           \
>+                "1:\tstw\t%3,0(%%sr3,%1)\n"               \
>+                "\tldw\t4(%%sr3,%2),%3\n"             \
>+                "2:\tstw\t%3,4(%%sr3,%1)\n"                 \
>+                "3:\n"                                      \
>+                "\t.section __ex_table,\"a\"\n"             \
>+                 "\t.word\t1b\n"                            \
>+                 "\t.word\t(3b-1b)+1\n"                     \
>+                 "\t.word\t2b\n"                            \
>+                 "\t.word\t(3b-2b)+1\n"                     \
>+                 "\t.previous"                              \
>+                : "=r"(__pu_err)                            \
>+                : "r"(ptr), "r"(&x), "r"(__tmp),  "0"(__pu_err))
>+
> #endif
>
(&x) works when it is a variable not with a symbolic constant as 0.

Sorry,
    Joel
