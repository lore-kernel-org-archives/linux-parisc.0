From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 12 Mar 2005 17:19:21 -0800
Message-ID: <20050313011921.GB28289@tausq.org>
References: <200503052033.j25KXK8x007561@hiauly1.hia.nrc.ca>
	<200503122337.j2CNbF3p026289@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503122337.j2CNbF3p026289@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > hiauly6 4.0.0:
> > FAIL: 27_io/basic_filebuf/sgetn/char/1-in.cc execution test
> 
> This fail is caused by a bug in ioctl when using a 32-bit kernel.
> I've attached a little test program below that demonstrates the problem.
> sgetn.txt can be found in libstdc++-v3/testsuite/data/sgetn.txt but
> I think any file will do.  num is still 0 after the ioctl call.

I think the attached patch is what we should do; the problem is that we
are trying to put a 64-bit quantity (loff_t) into an int *, and we end
up only storing the top bits. (see fs/ioctl.c for details)

Is this the right thing to do? Do we need something similar for
get_user()?

Tested on 32-bit and 64-bit (thanks Kyle!)

randolph

Index: include/asm-parisc/uaccess.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/uaccess.h,v
retrieving revision 1.18
diff -u -p -r1.18 uaccess.h
--- include/asm-parisc/uaccess.h	21 Feb 2005 16:40:53 -0000	1.18
+++ include/asm-parisc/uaccess.h	13 Mar 2005 00:50:41 -0000
@@ -147,22 +147,23 @@ struct exception_data {
 #define __put_user(x,ptr)                                       \
 ({								\
 	register long __pu_err __asm__ ("r8") = 0;      	\
+        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
 								\
 	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_kernel_asm("stb",x,ptr); break;       \
-	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
-	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
-	    case 8: STD_KERNEL(x,ptr); break;			\
+	    case 1: __put_kernel_asm("stb",__x,ptr); break;     \
+	    case 2: __put_kernel_asm("sth",__x,ptr); break;     \
+	    case 4: __put_kernel_asm("stw",__x,ptr); break;     \
+	    case 8: STD_KERNEL(__x,ptr); break;			\
 	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
 	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_user_asm("stb",x,ptr); break;         \
-	    case 2: __put_user_asm("sth",x,ptr); break;         \
-	    case 4: __put_user_asm("stw",x,ptr); break;         \
-	    case 8: STD_USER(x,ptr); break;			\
+	    case 1: __put_user_asm("stb",__x,ptr); break;       \
+	    case 2: __put_user_asm("sth",__x,ptr); break;       \
+	    case 4: __put_user_asm("stw",__x,ptr); break;       \
+	    case 8: STD_USER(__x,ptr); break;			\
 	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
