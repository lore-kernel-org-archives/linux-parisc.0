Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30D34482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jul 2003 08:30:18 -0600 (MDT)
Date: Mon, 28 Jul 2003 16:30:14 +0200
Message-ID: <3F056E95000057BB@ocpmta4.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] k-2.6.0-test2-pa0: __canonicalize_f_f_c patch
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

Hi Grant,

Here is your patch forward-port to 2.6.0-test2-pa0:
diff -NaurX dontdiff linux-2.6.0-test2-pa0/arch/parisc/kernel/parisc_ksyms.c
linux-2.6.0-test2-pax/arch/parisc/kernel/parisc_ksyms.c
--- linux-2.6.0-test2-pa0/arch/parisc/kernel/parisc_ksyms.c	2003-06-10 07:34:05.000000000
+0200
+++ linux-2.6.0-test2-pax/arch/parisc/kernel/parisc_ksyms.c	2003-07-28 13:22:48.000000000
+0200
@@ -122,10 +122,12 @@
 extern off_t sys_lseek(int, off_t, int);
 extern int sys_read(int, char *, int);
 extern int sys_write(int, const char *, int);
+asmlinkage long sys_wait4(pid_t ,unsigned int *, int, struct rusage *);
 EXPORT_SYMBOL(sys_open);
 EXPORT_SYMBOL(sys_lseek);
 EXPORT_SYMBOL(sys_read);
 EXPORT_SYMBOL(sys_write);
+EXPORT_SYMBOL(sys_wait4);
 
 #include <asm/semaphore.h>
 EXPORT_SYMBOL(__up);
@@ -201,6 +203,9 @@
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
 
+asmlinkage void * __canonicalize_funcptr_for_compare(void *);
+EXPORT_SYMBOL_NOVERS(__canonicalize_funcptr_for_compare);
+
 #ifdef __LP64__
 extern void __divdi3(void);
 extern void __udivdi3(void);
diff -NaurX dontdiff linux-2.6.0-test2-pa0/arch/parisc/kernel/real2.S linux-2.6.0-test2-pax/arch/parisc/kernel/real2.S
--- linux-2.6.0-test2-pa0/arch/parisc/kernel/real2.S	2003-07-14 19:36:03.000000000
+0200
+++ linux-2.6.0-test2-pax/arch/parisc/kernel/real2.S	2003-07-28 13:18:41.000000000
+0200
@@ -275,6 +275,7 @@
 	nop
 
 #endif
+
 	.export pc_in_user_space
 	.text
 	/* Doesn't belong here but I couldn't find a nicer spot. */
@@ -283,3 +284,17 @@
 	bv,n	0(%rp)
 	nop
 
+
+	.export __canonicalize_funcptr_for_compare
+	.text
+	/* http://lists.parisc-linux.org/hypermail/parisc-linux/10916.html
+	**	GCC 3.3 and later has a new function in libgcc.a for
+	**	comparing function pointers.
+	*/
+__canonicalize_funcptr_for_compare:
+#ifdef __LP64__
+	bve (%r2)
+#else
+	bv %r0(%r2)
+#endif
+	copy %r26,%r28

And also uaccess patch to avoid to obtain a wronb executable k (as for other
platform):
diff -NaurX dontdiff linux-2.6.0-test2-pa0/include/asm-parisc/uaccess.h linux-2.6.0-test2-pax/include/asm-parisc/uaccess.h
--- linux-2.6.0-test2-pa0/include/asm-parisc/uaccess.h	2003-01-13 08:42:40.000000000
+0100
+++ linux-2.6.0-test2-pax/include/asm-parisc/uaccess.h	2003-07-28 15:18:12.000000000
+0200
@@ -28,6 +28,11 @@
  * that put_user is the same as __put_user, etc.
  */
 
+extern int __get_kernel_bad(void);
+extern int __get_user_bad(void);
+extern int __put_kernel_bad(void);
+extern int __put_user_bad(void);
+
 #define access_ok(type,addr,size)   (1)
 #define verify_area(type,addr,size) (0)
 
@@ -35,8 +40,8 @@
 #define get_user __get_user
 
 #if BITS_PER_LONG == 32
-#define LDD_KERNEL(ptr)		BUG()
-#define LDD_USER(ptr)		BUG()
+#define LDD_KERNEL(ptr) __get_kernel_bad();
+#define LDD_USER(ptr) __get_user_bad();
 #define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
 #define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
 #else
@@ -72,7 +77,7 @@
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: BUG(); break;                      \
+	    default: __get_kernel_bad(); break;         \
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -81,7 +86,7 @@
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: BUG(); break;                      \
+	    default: __get_user_bad(); break;           \
 	    }                                           \
 	}                                               \
 							\
@@ -141,7 +146,7 @@
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
 	    case 8: STD_KERNEL(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -150,7 +155,7 @@
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
 	    case 8: STD_USER(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 								\

Thanks in advance to ci,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
