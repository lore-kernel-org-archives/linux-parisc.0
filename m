Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 648F348CB
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Oct 2003 15:35:52 -0600 (MDT)
Date: Sun, 12 Oct 2003 17:32:26 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20031012213226.GE23999@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] Sysdeps changes for hppa.
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

libc-alpha,

Generic defines JUMPTARGET, so we must undefine it before setting it to
nothing in sysdeps/hppa/sysdep.h.

Secondly, there were a lot of missing macro's in
sysdep/unix/sysv/linux/hppa/sysdep.h, the second bit of the patch takes
care of defining those properly for hppa and cleans up the file itself
in a more logical layout.

The last patch makes sure that syscall in sysdep.c takes advantage of
all the fixes for PIC register bugs I had to track down.

Cheers,
Carlos.
===
 sysdeps/hppa/sysdep.h                 |    1 
 sysdeps/unix/sysv/linux/hppa/sysdep.h |  274 ++++++++--
 sysdeps/unix/sysv/linux/hppa/sysdep.c |   46 +
 3 files changed, 254 insertions(+), 67 deletions(-)
===

2003-10-12  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/hppa/sysdep.h: Undef JUMPTARGET before use.
	* sysdeps/unix/sysv/linux/hppa/sysdep.h:
	Define __NR_semtimedop for compat with old kernels,
	PSEUDO_ERRVAL, SYSCALL_ERROR_LABEL under all conditions,
	INTERNAL_SYSCALL_DECL, INTERNAL_SYSCALL_ERROR_P,
	INTERNAL_SYSCALL_ERRNO, INTERNAL_SYSCALL, and undef 
	JUMPTARGET before use.
	[PIC]: Save pic register around syscall.
	* sysdeps/unix/sysv/linux/hppa/sysdep.c (syscall): 
	Cleanup asm statment.

--- libc/sysdeps/hppa/sysdep.h	6 Jul 2001 04:55:51 -0000	1.3
+++ libc/sysdeps/hppa/sysdep.h	1 Apr 2003 06:15:35 -0000
@@ -70,6 +67,7 @@
 #define	PSEUDO_END(name)						      \
   END (name)
 
+#undef JUMPTARGET
 #define JUMPTARGET(name)	name
 #define SYSCALL_PIC_SETUP	/* Nothing.  */
diff -u -p -r1.7 sysdep.h
--- libc/sysdeps/unix/sysv/linux/hppa/sysdep.h	23 Mar 2003 19:42:22 -0000	1.7
+++ libc/sysdeps/unix/sysv/linux/hppa/sysdep.h	21 Sep 2003 19:24:57 -0000
@@ -31,6 +31,26 @@
 #undef SYS_ify
 #define SYS_ify(syscall_name)	(__NR_##syscall_name)
 
+/* Included for older kernels whose headers 
+   are missing the define  */ 
+#ifndef __NR_semtimedop
+# define __NR_semtimedop 228
+#endif
+
+# ifdef PIC
+/* WARNING: CANNOT BE USED IN A NOP! */
+#  define STW_PIC stw %r19, -32(%sr0, %sp) ASM_LINE_SEP
+#  define LDW_PIC ldw -32(%sr0, %sp), %r19 ASM_LINE_SEP
+#  define STW_ASM_PIC	"       copy %%r19, %%r4\n"
+#  define LDW_ASM_PIC	"       copy %%r4, %%r19\n"
+#  define USING_GR4	"%r4",
+# else
+#  define STW_PIC ASM_LINE_SEP
+#  define LDW_PIC ASM_LINE_SEP
+#  define STW_ASM_PIC	" \n"
+#  define LDW_ASM_PIC	" \n"
+#  define USING_GR4
+# endif
 
 #ifdef __ASSEMBLER__
 
@@ -77,20 +97,13 @@
 	.text					ASM_LINE_SEP	\
 	.export C_SYMBOL_NAME(name)		ASM_LINE_SEP	\
 	.type	C_SYMBOL_NAME(name),@function	ASM_LINE_SEP	\
-	C_LABEL(name)						\
-	CALL_MCOUNT
-
-#define ret \
-	bv 0(2)					ASM_LINE_SEP	\
-	nop
-
-#define ret_NOERRNO \
-	bv 0(2)					ASM_LINE_SEP	\
-	nop
+	C_LABEL(name)				ASM_LINE_SEP	\
+	CALL_MCOUNT				ASM_LINE_SEP
 
 #undef	END
-#define END(name)						\
-1:	.size	C_SYMBOL_NAME(name),1b-C_SYMBOL_NAME(name)
+#define END(name)							\
+1:							ASM_LINE_SEP	\
+.size	C_SYMBOL_NAME(name),1b-C_SYMBOL_NAME(name)	ASM_LINE_SEP	\
 
 /* If compiled for profiling, call `mcount' at the start of each function.  */
 /* No, don't bother.  gcc will put the call in for us.  */
@@ -110,27 +123,83 @@
 	nop
 */
 
-#define	PSEUDO(name, syscall_name, args)				      \
-  ENTRY (name)								      \
-  DO_CALL(syscall_name, args)					ASM_LINE_SEP  \
-  nop
+#define	PSEUDO(name, syscall_name, args)			\
+  ENTRY (name)							\
+  DO_CALL(syscall_name, args)			ASM_LINE_SEP	\
+  nop						ASM_LINE_SEP
+
+#define ret \
+	/* Return value set by ERRNO code */	ASM_LINE_SEP	\
+	bv 0(2)					ASM_LINE_SEP	\
+	nop					ASM_LINE_SEP
 
 #undef	PSEUDO_END
-#define	PSEUDO_END(name)						      \
+#define	PSEUDO_END(name)					\
   END (name)
 
-#define	PSEUDO_NOERRNO(name, syscall_name, args)			      \
-  ENTRY (name)								      \
-  DO_CALL(syscall_name, args)					ASM_LINE_SEP  \
-  nop
+/* We don't set the errno on the return from the syscall */
+#define	PSEUDO_NOERRNO(name, syscall_name, args)		\
+  ENTRY (name)							\
+  DO_CALL_NOERRNO(syscall_name, args)		ASM_LINE_SEP	\
+  nop						ASM_LINE_SEP
 
+#define ret_NOERRNO ret 
+  
 #undef	PSEUDO_END_NOERRNO
-#define	PSEUDO_END_NOERRNO(name)					      \
+#define	PSEUDO_END_NOERRNO(name)				\
   END (name)
 
+/* This has to return the error value */
+#undef  PSEUDO_ERRVAL
+#define PSEUDO_ERRVAL(name, syscall_name, args)			\
+	ENTRY(name)						\
+	DO_CALL_ERRVAL(syscall_name, args)	ASM_LINE_SEP	\
+	nop					ASM_LINE_SEP
+
+#define ret_ERRVAL ret
+	
+#undef	PSEUDO_END_ERRVAL
+#define PSEUDO_END_ERRVAL(name)					\
+	END(name)
+
+#undef JUMPTARGET
 #define JUMPTARGET(name)	name
 #define SYSCALL_PIC_SETUP	/* Nothing.  */
 
+	
+/* All the syscall assembly macros rely on finding the approriate 
+   SYSCALL_ERROR_LABEL or rather HANDLER. */
+
+/* int * __errno_location(void) so you have to store your value
+   into the return address! */
+#define DEFAULT_SYSCALL_ERROR_HANDLER 			\
+	.import __errno_location,code	ASM_LINE_SEP	\
+	/* branch to errno handler */	ASM_LINE_SEP	\
+	bl __errno_location,%rp		ASM_LINE_SEP
+	
+/* Here are the myriad of configuration options that the above can
+   work for... what we've done is provide the framework for future
+   changes if required to each section */
+	
+#ifdef PIC
+# if RTLD_PRIVATE_ERRNO
+#  define SYSCALL_ERROR_HANDLER DEFAULT_SYSCALL_ERROR_HANDLER			    
+# else /* !RTLD_PRIVATE_ERRNO */
+#  if defined _LIBC_REENTRANT
+#   define SYSCALL_ERROR_HANDLER DEFAULT_SYSCALL_ERROR_HANDLER
+#  else /* !_LIBC_REENTRANT */
+#   define SYSCALL_ERROR_HANDLER DEFAULT_SYSCALL_ERROR_HANDLER
+#  endif /* _LIBC_REENTRANT */
+# endif /* RTLD_PRIVATE_ERRNO */
+#else
+# ifndef _LIBC_REENTRANT
+#  define SYSCALL_ERROR_HANDLER DEFAULT_SYSCALL_ERROR_HANDLER
+# else
+#  define SYSCALL_ERROR_HANDLER DEFAULT_SYSCALL_ERROR_HANDLER
+# endif
+#endif					
+	
+	
 /* Linux takes system call arguments in registers:
 	syscall number	gr20
 	arg 1		gr26
@@ -159,25 +228,61 @@
 
 #undef	DO_CALL
 #define DO_CALL(syscall_name, args)				\
-	DOARGS_##args						\
+	DOARGS_##args				ASM_LINE_SEP	\
+	STW_PIC					ASM_LINE_SEP	\
+	/* Do syscall, delay loads # */		ASM_LINE_SEP	\
 	ble  0x100(%sr2,%r0)			ASM_LINE_SEP	\
 	ldi SYS_ify (syscall_name), %r20	ASM_LINE_SEP	\
 	ldi -0x1000,%r1				ASM_LINE_SEP	\
 	cmpb,>>=,n %r1,%ret0,0f			ASM_LINE_SEP	\
-	stw %rp, -20(%sr0,%r30)			ASM_LINE_SEP	\
-	stw %ret0, -24(%sr0,%r30)		ASM_LINE_SEP	\
-	.import __errno_location,code		ASM_LINE_SEP	\
-	bl __errno_location,%rp			ASM_LINE_SEP	\
-	ldo 64(%r30), %r30			ASM_LINE_SEP	\
-	ldo -64(%r30), %r30			ASM_LINE_SEP	\
-	ldw -24(%r30), %r26			ASM_LINE_SEP	\
+	/* save rp or we get lost */		ASM_LINE_SEP	\
+	stw %rp, -20(%sr0,%sp)			ASM_LINE_SEP	\
+	/* Restore r19 from frame */		ASM_LINE_SEP	\
+	LDW_PIC					ASM_LINE_SEP	\
+	stw %ret0, -24(%sr0,%sp)		ASM_LINE_SEP	\
+	SYSCALL_ERROR_HANDLER			ASM_LINE_SEP	\
+	/* create frame */			ASM_LINE_SEP	\
+	ldo 64(%sp), %sp			ASM_LINE_SEP	\
+	ldo -64(%sp), %sp			ASM_LINE_SEP	\
+	/* OPTIMIZE: Don't reload r19 */	ASM_LINE_SEP	\
+	/* do a -1*syscall_ret0 */		ASM_LINE_SEP	\
+	ldw -24(%sr0,%sp), %r26			ASM_LINE_SEP	\
 	sub %r0, %r26, %r26			ASM_LINE_SEP	\
+	/* Store into errno location */		ASM_LINE_SEP	\
 	stw %r26, 0(%sr0,%ret0)			ASM_LINE_SEP	\
+	/* return -1 as error */		ASM_LINE_SEP	\
 	ldo -1(%r0), %ret0			ASM_LINE_SEP	\
-	ldw -20(%r30), %rp			ASM_LINE_SEP	\
+	ldw -20(%sr0,%sp), %rp			ASM_LINE_SEP	\
 0:						ASM_LINE_SEP	\
+	UNDOARGS_##args				ASM_LINE_SEP
+
+/* We do nothing with the return, except hand it back to someone else */
+#undef  DO_CALL_NOERRNO
+#define DO_CALL_NOERRNO(syscall_name, args)			\
+	DOARGS_##args                                           \
+	/* No need to store r19 */		ASM_LINE_SEP	\
+	ble  0x100(%sr2,%r0)                    ASM_LINE_SEP    \
+	ldi SYS_ify (syscall_name), %r20        ASM_LINE_SEP    \
+	/* Caller will restore r19 */		ASM_LINE_SEP	\
 	UNDOARGS_##args
 
+/* Here, we return the ERRVAL in assembly, note we don't call the
+   error handler function, but we do 'negate' the return _IF_
+   it's an error. Not sure if this is the right semantic. */
+
+#undef	DO_CALL_ERRVAL
+#define DO_CALL_ERRVAL(syscall_name, args)			\
+	DOARGS_##args				ASM_LINE_SEP	\
+	/* No need to store r19 */		ASM_LINE_SEP	\
+	ble  0x100(%sr2,%r0)			ASM_LINE_SEP	\
+	ldi SYS_ify (syscall_name), %r20	ASM_LINE_SEP	\
+	/* Caller will restore r19 */		ASM_LINE_SEP	\
+	ldi -0x1000,%r1				ASM_LINE_SEP	\
+	cmpb,>>=,n %r1,%ret0,0f			ASM_LINE_SEP	\
+	sub %r0, %ret0, %ret0			ASM_LINE_SEP	\
+0:						ASM_LINE_SEP	\
+	UNDOARGS_##args				ASM_LINE_SEP
+
 #define DOARGS_0 /* nothing */
 #define DOARGS_1 /* nothing */
 #define DOARGS_2 /* nothing */
@@ -198,26 +303,87 @@
 
 #else
 
+/* GCC has to be warned that a syscall may clobber all the ABI 
+   registers listed as "caller-saves", see page 8, Table 2 
+   in section 2.2.6 of the PA-RISC RUN-TIME architecture 
+   document. However! r28 is the result and will conflict with
+   the clobber list so it is left out. Also the input arguments
+   registers r20 -> r26 will conflict with the list so they 
+   are treated specially. Although r19 is clobbered by the syscall
+   we cannot say this because it would violate ABI, thus we say
+   r4 is clobbered and use that register to save/restore r19
+   across the syscall. */
+		 
+#define CALL_CLOB_REGS	"%r1", "%r2", USING_GR4 \
+		 	"%r20", "%r29", "%r31"
+		 
 #undef INLINE_SYSCALL
-#define INLINE_SYSCALL(name, nr, args...)	({		\
+#define INLINE_SYSCALL(name, nr, args...)	({			\
+	long __sys_res;							\
+	{								\
+		register unsigned long __res asm("r28");		\
+		LOAD_ARGS_##nr(args)					\
+		/* FIXME: HACK stw/ldw r19 around syscall */		\
+		asm volatile(						\
+			STW_ASM_PIC					\
+			"	ble  0x100(%%sr2, %%r0)\n"		\
+			"	ldi %1, %%r20\n"			\
+			LDW_ASM_PIC					\
+			: "=r" (__res)					\
+			: "i" (SYS_ify(name)) ASM_ARGS_##nr		\
+			: CALL_CLOB_REGS CLOB_ARGS_##nr			\
+		);							\
+		__sys_res = (long)__res;				\
+	}								\
+	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
+		__set_errno(-__sys_res);				\
+		__sys_res = -1;						\
+	}								\
+	__sys_res;							\
+})
+
+/* INTERNAL_SYSCALL_DECL - Allows us to setup some function static 
+   value to use within the context of the syscall 
+   INTERNAL_SYSCALL_ERROR_P - Returns 0 if it wasn't an error, 1 otherwise
+   You are allowed to use the syscall result (val) and the DECL error variable
+   to determine what went wrong.
+   INTERLAL_SYSCALL_ERRNO - Munges the val/err pair into the error number.
+   In our case we just flip the sign. */
+
+#undef INTERNAL_SYSCALL_DECL
+#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
+
+/* Equivalent to  (val < 0)&&(val > -4095) which is what we want */
+#undef INTERNAL_SYSCALL_ERROR_P
+#define INTERNAL_SYSCALL_ERROR_P(val, err) \
+	((unsigned long)val >= (unsigned long)-4095)
+	
+#undef INTERNAL_SYSCALL_ERRNO
+#define INTERNAL_SYSCALL_ERRNO(val, err) (-(val))
+
+/* Similar to INLINE_SYSCALL but we don't set errno */
+#undef INTERNAL_SYSCALL
+#define INTERNAL_SYSCALL(name, err, nr, args...) 		\
+({								\
 	long __sys_res;						\
 	{							\
 		register unsigned long __res asm("r28");	\
 		LOAD_ARGS_##nr(args)				\
+		/* FIXME: HACK stw/ldw r19 around syscall */	\
 		asm volatile(					\
-			"ble  0x100(%%sr2, %%r0)\n\t"		\
-			" ldi %1, %%r20"			\
+			STW_ASM_PIC				\
+			"	ble  0x100(%%sr2, %%r0)\n"	\
+			"	ldi %1, %%r20\n"		\
+			LDW_ASM_PIC				\
 			: "=r" (__res)				\
 			: "i" (SYS_ify(name)) ASM_ARGS_##nr	\
-			 );					\
-		__sys_res = __res;				\
-	}							\
-	if ((unsigned long)__sys_res >= (unsigned long)-4095) {	\
-		__set_errno(-__sys_res);			\
-		__sys_res = -1;					\
+			: CALL_CLOB_REGS CLOB_ARGS_##nr		\
+		);						\
+		__sys_res = (long)__res;			\
 	}							\
 	__sys_res;						\
-})
+ })
+
 
 #define LOAD_ARGS_0()
 #define LOAD_ARGS_1(r26)					\
@@ -239,12 +405,22 @@
 	register unsigned long __r21 __asm__("r21") = (unsigned long)r21;	\
 	LOAD_ARGS_5(r26,r25,r24,r23,r22)
 
-#define ASM_ARGS_0
-#define ASM_ARGS_1 , "r" (__r26)
-#define ASM_ARGS_2 , "r" (__r26), "r" (__r25)
-#define ASM_ARGS_3 , "r" (__r26), "r" (__r25), "r" (__r24)
-#define ASM_ARGS_4 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23)
-#define ASM_ARGS_5 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23), "r" (__r22)
-#define ASM_ARGS_6 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23), "r" (__r22), "r" (__r21)
-
+/* Even with zero args we use r20 for the syscall number */
+#define ASM_ARGS_0 
+#define ASM_ARGS_1 ASM_ARGS_0, "r" (__r26)
+#define ASM_ARGS_2 ASM_ARGS_1, "r" (__r25)
+#define ASM_ARGS_3 ASM_ARGS_2, "r" (__r24)
+#define ASM_ARGS_4 ASM_ARGS_3, "r" (__r23)
+#define ASM_ARGS_5 ASM_ARGS_4, "r" (__r22)
+#define ASM_ARGS_6 ASM_ARGS_5, "r" (__r21)
+
+/* The registers not listed as inputs but clobbered */
+#define CLOB_ARGS_6
+#define CLOB_ARGS_5 CLOB_ARGS_6, "%r21"
+#define CLOB_ARGS_4 CLOB_ARGS_5, "%r22"
+#define CLOB_ARGS_3 CLOB_ARGS_4, "%r23"
+#define CLOB_ARGS_2 CLOB_ARGS_3, "%r24"
+#define CLOB_ARGS_1 CLOB_ARGS_2, "%r25"
+#define CLOB_ARGS_0 CLOB_ARGS_1, "%r26"
+	
 #endif	/* __ASSEMBLER__ */
diff -u -p -r1.4 sysdep.c
--- libc/sysdeps/unix/sysv/linux/hppa/sysdep.c	11 Oct 2002 10:51:21 -0000	1.4
+++ libc/sysdeps/unix/sysv/linux/hppa/sysdep.c	30 Aug 2003 23:03:16 -0000
@@ -19,6 +19,10 @@
 #include <sysdep.h>
 #include <errno.h>
 
+extern int __syscall_error(int err_no);
+extern int syscall (int sysnum, int arg0, int arg1, int arg2, 
+			int arg3, int arg4, int arg5);
+
 /* This routine is jumped to by all the syscall handlers, to stash
    an error number into errno.  */
 int
@@ -30,25 +34,31 @@ __syscall_error (int err_no)
 
 
 /* HPPA implements syscall() in 'C'; the assembler version would
-   typically be in syscall.S.  */
-
+   typically be in syscall.S. Also note that we have INLINE_SYSCALL,
+   INTERNAL_SYSCALL, and all the generated pure assembly syscall wrappers.
+   How often the function is used is unknown. */
 int
 syscall (int sysnum, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5)
 {
-  long __sys_res;
-  {
-    register unsigned long __res asm("r28");
-    LOAD_ARGS_6(arg0, arg1, arg2, arg3, arg4, arg5)
-      asm volatile ("ble  0x100(%%sr2, %%r0)\n\t"
-		    "copy %1, %%r20"
-		    : "=r" (__res)
-		    : "r" (sysnum) ASM_ARGS_6);
-    __sys_res = __res;
-  }
-  if ((unsigned long) __sys_res >= (unsigned long)-4095)
-    {
-    __set_errno(-__sys_res);
-    __sys_res = -1;
-  }
-  return __sys_res;
+	/* FIXME: Keep this matching INLINE_SYSCALL for hppa */
+	long __sys_res;
+	{
+		register unsigned long __res asm("r28");
+		LOAD_ARGS_6(arg0, arg1, arg2, arg3, arg4, arg5)
+		asm volatile (
+			STW_ASM_PIC
+			"	ble  0x100(%%sr2, %%r0)	\n"
+			"	copy %1, %%r20		\n"
+			LDW_ASM_PIC
+			: "=r" (__res)
+			: "r" (sysnum) ASM_ARGS_6
+			: CALL_CLOB_REGS CLOB_ARGS_6
+		);
+		__sys_res = __res;
+	}
+	if ((unsigned long) __sys_res >= (unsigned long)-4095){
+		__set_errno(-__sys_res);
+		__sys_res = -1;
+	}
+	return __sys_res;
 }
