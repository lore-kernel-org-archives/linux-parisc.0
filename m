From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH] libaio parisc partial support
Date: Mon, 2 Jan 2006 22:56:36 -0500
Message-ID: <20060103035636.GB8130@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: lamont@debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Got this mostly together, but I'm too lazy/etc to test...

Anyone want to check that,
	1 - I'm correctly doing the ldi with the right arg #. I suppose
	    this would be easier if I just used a named input.
	2 - What to do about errno setting in the syscall return.

syscall-arch.h on most other ports includes the syscall numbers, but
it seems ours already includes them, so I haven't. For reference they're
215->219 iirc.

I glanced at the glibc src to derive the needed macros, but it wasn't
cribbed from there, so I don't think there's any licensing issues.

Oh, I just objdump'd it, and the delay slot of __io_get_events has
ldi d9, %r20 in it, which looks to be the right syscall nr. So the
resulting lib probably works, but the harness doesn't compile and I'm
too lazy to look into it.

Anyways, enjoy.

	Kyle

--- a/debian/control	2006-01-02 22:33:58.000000000 -0500
+++ b/debian/control	2006-01-02 22:26:57.000000000 -0500
@@ -7,7 +7,7 @@
 
 Package: libaio
 Section: libs
-Architecture: i386 ia64 s390 alpha powerpc
+Architecture: i386 ia64 s390 alpha powerpc hppa
 Depends:
 Description: kernel aio access library
  This library enables userspace to use kernel asynchronous I/O system
diff -Nur a/src/libaio.h b/src/libaio.h
--- a/src/libaio.h	2005-04-01 15:31:32.000000000 -0500
+++ b/src/libaio.h	2006-01-02 22:01:10.000000000 -0500
@@ -60,7 +60,7 @@
 #define PADDED(x, y)	unsigned y; x
 #define PADDEDptr(x,y)	x
 #define PADDEDul(x, y)	unsigned long x
-#elif defined(__PPC__)  /* big endian, 32 bits */
+#elif defined(__PPC__) || defined(__hppa__)  /* big endian, 32 bits */
 #define PADDED(x, y)	unsigned y; x
 #define PADDEDptr(x, y)	unsigned y; x
 #define PADDEDul(x, y)	unsigned y; unsigned long x
diff -Nur a/src/syscall-parisc.h b/src/syscall-parisc.h
--- a/src/syscall-parisc.h	1969-12-31 19:00:00.000000000 -0500
+++ b/src/syscall-parisc.h	2006-01-02 22:26:17.000000000 -0500
@@ -0,0 +1,81 @@
+#define __syscall_nr(nr, type, name, args...)				\
+	unsigned long __sc_ret;						\
+	{								\
+		__sc_loadargs_##nr(name, args);				\
+		__asm__ __volatile__					\
+			("	ble  0x100(%%sr2, %%r0)\n"		\
+			 "	ldi  %1, %%r20\n"			\
+			: "=r" (__sc_res)				\
+			: "i" (__NR_##name), __sc_asm_input_##nr	\
+			: "memory", "%r1", "%r2", "%r20", "%r29",	\
+			  "%r31" __sc_clob_args_##nr			\
+		);							\
+		__sc_ret = (long)__sc_res;				\
+	}								\
+	if ((unsigned long)__sc_ret >= (unsigned long)-4095) {		\
+		__sc_ret = -1;						\
+	}								\
+	return __sc_ret
+
+#define __sc_loadargs_0(name, dummy...)					\
+	register unsigned long __sc_res __asm__("r28") = __NR_##name
+#define __sc_loadargs_1(name, arg1)					\
+	__sc_loadargs_0(name);						\
+	register unsigned long __sc_r26 __asm__("r26") = (unsigned long) (arg1)
+#define __sc_loadargs_2(name, arg1, arg2)				\
+	__sc_loadargs_1(name, arg1);					\
+	register unsigned long __sc_r25 __asm__("r25") = (unsigned long) (arg2)
+#define __sc_loadargs_3(name, arg1, arg2, arg3)				\
+	__sc_loadargs_2(name, arg1, arg2);				\
+	register unsigned long __sc_r24 __asm__("r24") = (unsigned long) (arg3)
+#define __sc_loadargs_4(name, arg1, arg2, arg3, arg4)			\
+	__sc_loadargs_3(name, arg1, arg2, arg3);			\
+	register unsigned long __sc_r23 __asm__("r23") = (unsigned long) (arg4)
+#define __sc_loadargs_5(name, arg1, arg2, arg3, arg4, arg5)		\
+	__sc_loadargs_4(name, arg1, arg2, arg3, arg4);			\
+	register unsigned long __sc_r22 __asm__("r22") = (unsigned long) (arg5)
+
+#define __sc_asm_input_0
+#define __sc_asm_input_1 "r" (__sc_r26)
+#define __sc_asm_input_2 __sc_asm_input_1, "r" (__sc_r25)
+#define __sc_asm_input_3 __sc_asm_input_2, "r" (__sc_r24)
+#define __sc_asm_input_4 __sc_asm_input_3, "r" (__sc_r23)
+#define __sc_asm_input_5 __sc_asm_input_4, "r" (__sc_r22)
+
+#define __sc_clob_args_5
+#define __sc_clob_args_4 __sc_clob_args_5, "%r22"
+#define __sc_clob_args_3 __sc_clob_args_4, "%r23"
+#define __sc_clob_args_2 __sc_clob_args_3, "%r24"
+#define __sc_clob_args_1 __sc_clob_args_2, "%r25"
+#define __sc_clob_args_0 __sc_clob_args_1, "%r26"
+
+
+#define io_syscall1(type,fname,sname,type1,arg1)				\
+type fname(type1 arg1)							\
+{									\
+	__syscall_nr(1, type, sname, arg1);				\
+}
+
+#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2)		\
+type fname(type1 arg1, type2 arg2)					\
+{									\
+	__syscall_nr(2, type, sname, arg1, arg2);			\
+}
+
+#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3)	\
+type fname(type1 arg1, type2 arg2, type3 arg3)				\
+{									\
+	__syscall_nr(3, type, sname, arg1, arg2, arg3);			\
+}
+
+#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
+{									\
+	__syscall_nr(4, type, sname, arg1, arg2, arg3, arg4);		\
+}
+
+#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5) \
+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5)	\
+{									\
+	__syscall_nr(5, type, sname, arg1, arg2, arg3, arg4, arg5);	\
+}
diff -Nur a/src/syscall.h b/src/syscall.h
--- a/src/syscall.h	2005-04-01 15:31:32.000000000 -0500
+++ b/src/syscall.h	2006-01-02 21:58:28.000000000 -0500
@@ -22,6 +22,8 @@
 #include "syscall-s390.h"
 #elif defined(__alpha__)
 #include "syscall-alpha.h"
+#elif defined(__hppa__)
+#include "syscall-parisc.h"
 #else
 #error "add syscall-arch.h"
 #endif
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
