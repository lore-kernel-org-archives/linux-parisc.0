Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 4 Aug 2003 23:18:52 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030805051852.GA20450@dsl2.external.hp.com>
References: <20030805051538.E7AD6494004@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030805051538.E7AD6494004@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 grundler
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

On Mon, Aug 04, 2003 at 11:15:38PM -0600, Grant Grundler wrote:
> Log message:
> 2.6.0-test2-pa6  Forward port 2.4.21 fixes
> 
> o add probe_irq_mask() (Arnaldo Del Melo)
> o add __canonicalize_funcptr_for_compare() (me)
> o add hppa to list of arches for "MMAPIO" in aic7xxx (me)
> o break build if get/put_user/kernel are abused (Joel Soete)

Trying to keep willy happy :^)
Thanks to Arnaldo/Joel for patches.

grant


Index: Makefile
===================================================================
RCS file: /var/cvs/linux-2.5/Makefile,v
retrieving revision 1.144
diff -u -p -r1.144 Makefile
--- Makefile	2 Aug 2003 21:50:59 -0000	1.144
+++ Makefile	5 Aug 2003 05:10:27 -0000
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 0
-EXTRAVERSION = -test2-pa5
+EXTRAVERSION = -test2-pa6
 
 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"
Index: arch/parisc/Kconfig
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/Kconfig,v
retrieving revision 1.23
diff -u -p -r1.23 Kconfig
--- arch/parisc/Kconfig	14 Jul 2003 12:32:20 -0000	1.23
+++ arch/parisc/Kconfig	5 Aug 2003 05:10:27 -0000
@@ -186,7 +186,7 @@ source "drivers/scsi/Kconfig"
 
 source "drivers/md/Kconfig"
 
-#source drivers/message/fusion/Kconfig
+source drivers/message/fusion/Kconfig
 
 #source drivers/ieee1394/Kconfig
 
Index: arch/parisc/kernel/irq.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/irq.c,v
retrieving revision 1.19
diff -u -p -r1.19 irq.c
--- arch/parisc/kernel/irq.c	5 May 2003 21:34:24 -0000	1.19
+++ arch/parisc/kernel/irq.c	5 Aug 2003 05:10:27 -0000
@@ -842,6 +842,10 @@ int probe_irq_off(unsigned long val)
 	return irq_found;
 }
 
+unsigned int probe_irq_mask(unsigned long irqs)
+{
+	return 0;
+}
 
 void __init init_IRQ(void)
 {
Index: arch/parisc/kernel/parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.21
diff -u -p -r1.21 parisc_ksyms.c
--- arch/parisc/kernel/parisc_ksyms.c	9 Jun 2003 02:24:25 -0000	1.21
+++ arch/parisc/kernel/parisc_ksyms.c	5 Aug 2003 05:10:27 -0000
@@ -37,6 +37,7 @@ EXPORT_SYMBOL(get_pci_node_path);
 #include <asm/irq.h>
 EXPORT_SYMBOL(enable_irq);
 EXPORT_SYMBOL(disable_irq);
+EXPORT_SYMBOL(probe_irq_mask);
 
 #include <asm/processor.h>
 EXPORT_SYMBOL(kernel_thread);
@@ -200,6 +201,9 @@ EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__ashldi3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
+
+asmlinkage void * __canonicalize_funcptr_for_compare(void *);
+EXPORT_SYMBOL_NOVERS(__canonicalize_funcptr_for_compare);
 
 #ifdef __LP64__
 extern void __divdi3(void);
Index: arch/parisc/kernel/real2.S
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/kernel/real2.S,v
retrieving revision 1.4
diff -u -p -r1.4 real2.S
--- arch/parisc/kernel/real2.S	14 Jul 2003 15:21:07 -0000	1.4
+++ arch/parisc/kernel/real2.S	5 Aug 2003 05:10:27 -0000
@@ -275,6 +275,7 @@ r64_ret:
 	nop
 
 #endif
+
 	.export pc_in_user_space
 	.text
 	/* Doesn't belong here but I couldn't find a nicer spot. */
@@ -283,3 +284,17 @@ pc_in_user_space:
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
Index: drivers/scsi/aic7xxx/aic79xx_osm.h
===================================================================
RCS file: /var/cvs/linux-2.5/drivers/scsi/aic7xxx/aic79xx_osm.h,v
retrieving revision 1.9
diff -u -p -r1.9 aic79xx_osm.h
--- drivers/scsi/aic7xxx/aic79xx_osm.h	27 Jul 2003 19:55:52 -0000	1.9
+++ drivers/scsi/aic7xxx/aic79xx_osm.h	5 Aug 2003 05:10:28 -0000
@@ -590,7 +590,8 @@ ahd_delay(long usec)
 
 
 /***************************** Low Level I/O **********************************/
-#if defined(__powerpc__) || defined(__i386__) || defined(__ia64__)
+#if defined(__powerpc__) || defined(__i386__) || defined(__ia64__) \
+	|| defined(__hppa__)
 #define MMAPIO
 #endif
 
Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.5/include/asm-parisc/uaccess.h,v
retrieving revision 1.7
diff -u -p -r1.7 uaccess.h
--- include/asm-parisc/uaccess.h	12 Jan 2003 08:24:26 -0000	1.7
+++ include/asm-parisc/uaccess.h	5 Aug 2003 05:10:29 -0000
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
@@ -72,7 +77,7 @@ struct exception_table_entry {
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: BUG(); break;                      \
+	    default: __get_kernel_bad(); break;         \
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -81,7 +86,7 @@ struct exception_table_entry {
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: BUG(); break;                      \
+	    default: __get_user_bad(); break;           \
 	    }                                           \
 	}                                               \
 							\
@@ -141,7 +146,7 @@ struct exception_table_entry {
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
 	    case 8: STD_KERNEL(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -150,7 +155,7 @@ struct exception_table_entry {
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
 	    case 8: STD_USER(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 								\
