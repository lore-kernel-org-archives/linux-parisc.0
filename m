Return-Path: <carlos@baldric.uwo.ca>
Date: Fri, 30 Apr 2004 11:57:45 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040430155745.GG12850@baldric.uwo.ca>
References: <20040430141548.EFE284945CD@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040430141548.EFE284945CD@palinux.hppa>
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Apr 30, 2004 at 08:15:48AM -0600, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/04/30 08:15:48
> 
> Modified files:
> 	include/asm-parisc: unistd.h 
> 
> Log message:
> Update K_INLINE_SYSCALL so userspace apps using the macro work properly.

Lifted from the version I wrote for glibc. I get to clean this up yet
again when we remove the register saves across syscalls.

Index: include/asm-parisc/unistd.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/unistd.h,v
retrieving revision 1.5
diff -u -p -r1.5 unistd.h
--- a/include/asm-parisc/unistd.h	28 Apr 2004 23:13:37 -0000	1.5
+++ b/include/asm-parisc/unistd.h	30 Apr 2004 14:15:17 -0000
@@ -735,94 +735,141 @@
 
 #ifndef __ASSEMBLY__
 
-/* The old syscall code here didn't work, and it looks like it's only used
- * by applications such as fdisk which for some reason need to produce
- * their own syscall instead of using same from libc.  The code below
- * is leveraged from glibc/sysdeps/unix/sysv/linux/hppa/sysdep.h where
- * it is essentially duplicated -- which sucks.  -PB
- */
-
 #define SYS_ify(syscall_name)   __NR_##syscall_name
 
-/* The system call number MUST ALWAYS be loaded in the delay slot of
-   the ble instruction, or restarting system calls WILL NOT WORK.  See
-   arch/parisc/kernel/signal.c - dhd, 2000-07-26 */
-#define K_INLINE_SYSCALL(name, nr, args...)       ({              \
-        unsigned long __sys_res;                                \
-        {                                                       \
-                register unsigned long __res asm("r28");        \
-                K_LOAD_ARGS_##nr(args)                            \
-                asm volatile(                                   \
-			"ble  0x100(%%sr2, %%r0)\n\t"           \
-                        " ldi %1, %%r20"                        \
-                        : "=r" (__res)                          \
-                        : "i" (SYS_ify(name)) K_ASM_ARGS_##nr   \
-			  );                                    \
-                __sys_res = __res;                              \
-        }                                                       \
-        if (__sys_res >= (unsigned long)-4095) {                \
-		errno = -__sys_res;				\
-                __sys_res = (unsigned long)-1;                 \
-        }                                                       \
-        __sys_res;                                              \
+/* Assume all syscalls are done from PIC code just to be
+ * safe. The worst case scenario is that you lose a register
+ * and save/restore r19 across the syscall. */
+#define PIC
+
+#ifndef ASM_LINE_SEP
+# define ASM_LINE_SEP ;
+#endif
+
+/* Definition taken from glibc 2.3.3
+ * sysdeps/unix/sysv/linux/hppa/sysdep.h
+ */
+
+#ifdef PIC
+/* WARNING: CANNOT BE USED IN A NOP! */
+# define K_STW_PIC stw %r19, -32(%sr0, %sp) ASM_LINE_SEP
+# define K_LDW_PIC ldw -32(%sr0, %sp), %r19 ASM_LINE_SEP
+# define K_STW_ASM_PIC	"       copy %%r19, %%r4\n"
+# define K_LDW_ASM_PIC	"       copy %%r4, %%r19\n"
+# define K_USING_GR4	"%r4",
+#else
+# define K_STW_PIC ASM_LINE_SEP
+# define K_LDW_PIC ASM_LINE_SEP
+# define K_STW_ASM_PIC	" \n"
+# define K_LDW_ASM_PIC	" \n"
+# define K_USING_GR4
+#endif
+
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
+#define K_CALL_CLOB_REGS "%r1", "%r2", K_USING_GR4 \
+	        	 "%r20", "%r29", "%r31"
+
+#undef K_INLINE_SYSCALL
+#define K_INLINE_SYSCALL(name, nr, args...)	({			\
+	long __sys_res;							\
+	{								\
+		register unsigned long __res asm("r28");		\
+		K_LOAD_ARGS_##nr(args)					\
+		/* FIXME: HACK stw/ldw r19 around syscall */		\
+		asm volatile(						\
+			K_STW_ASM_PIC					\
+			"	ble  0x100(%%sr2, %%r0)\n"		\
+			"	ldi %1, %%r20\n"			\
+			K_LDW_ASM_PIC					\
+			: "=r" (__res)					\
+			: "i" (SYS_ify(name)) K_ASM_ARGS_##nr   	\
+			: K_CALL_CLOB_REGS K_CLOB_ARGS_##nr		\
+		);							\
+		__sys_res = (long)__res;				\
+	}								\
+	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
+		errno = -__sys_res);		        		\
+		__sys_res = -1;						\
+	}								\
+	__sys_res;							\
 })
 
 #define K_LOAD_ARGS_0()
-#define K_LOAD_ARGS_1(r26)                                        \
-        register unsigned long __r26 __asm__("r26") = (unsigned long)r26;       \
-        K_LOAD_ARGS_0()
-#define K_LOAD_ARGS_2(r26,r25)                                    \
-        register unsigned long __r25 __asm__("r25") = (unsigned long)r25;       \
-        K_LOAD_ARGS_1(r26)
-#define K_LOAD_ARGS_3(r26,r25,r24)                                \
-        register unsigned long __r24 __asm__("r24") = (unsigned long)r24;       \
-        K_LOAD_ARGS_2(r26,r25)
-#define K_LOAD_ARGS_4(r26,r25,r24,r23)                            \
-        register unsigned long __r23 __asm__("r23") = (unsigned long)r23;       \
-        K_LOAD_ARGS_3(r26,r25,r24)
-#define K_LOAD_ARGS_5(r26,r25,r24,r23,r22)                        \
-        register unsigned long __r22 __asm__("r22") = (unsigned long)r22;       \
-        K_LOAD_ARGS_4(r26,r25,r24,r23)
-#define K_LOAD_ARGS_6(r26,r25,r24,r23,r22,r21)                    \
-        register unsigned long __r21 __asm__("r21") = (unsigned long)r21;       \
-        K_LOAD_ARGS_5(r26,r25,r24,r23,r22)
+#define K_LOAD_ARGS_1(r26)					\
+	register unsigned long __r26 __asm__("r26") = (unsigned long)(r26);   \
+	K_LOAD_ARGS_0()
+#define K_LOAD_ARGS_2(r26,r25)					\
+	register unsigned long __r25 __asm__("r25") = (unsigned long)(r25);   \
+	K_LOAD_ARGS_1(r26)
+#define K_LOAD_ARGS_3(r26,r25,r24)				\
+	register unsigned long __r24 __asm__("r24") = (unsigned long)(r24);   \
+	K_LOAD_ARGS_2(r26,r25)
+#define K_LOAD_ARGS_4(r26,r25,r24,r23)				\
+	register unsigned long __r23 __asm__("r23") = (unsigned long)(r23);   \
+	K_LOAD_ARGS_3(r26,r25,r24)
+#define K_LOAD_ARGS_5(r26,r25,r24,r23,r22)			\
+	register unsigned long __r22 __asm__("r22") = (unsigned long)(r22);   \
+	K_LOAD_ARGS_4(r26,r25,r24,r23)
+#define K_LOAD_ARGS_6(r26,r25,r24,r23,r22,r21)			\
+	register unsigned long __r21 __asm__("r21") = (unsigned long)(r21);   \
+	K_LOAD_ARGS_5(r26,r25,r24,r23,r22)
 
+/* Even with zero args we use r20 for the syscall number */
 #define K_ASM_ARGS_0
-#define K_ASM_ARGS_1 , "r" (__r26)
-#define K_ASM_ARGS_2 , "r" (__r26), "r" (__r25)
-#define K_ASM_ARGS_3 , "r" (__r26), "r" (__r25), "r" (__r24)
-#define K_ASM_ARGS_4 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23)
-#define K_ASM_ARGS_5 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23), "r" (__r22)
-#define K_ASM_ARGS_6 , "r" (__r26), "r" (__r25), "r" (__r24), "r" (__r23), "r" (__r22), "r" (__r21)
+#define K_ASM_ARGS_1 K_ASM_ARGS_0, "r" (__r26)
+#define K_ASM_ARGS_2 K_ASM_ARGS_1, "r" (__r25)
+#define K_ASM_ARGS_3 K_ASM_ARGS_2, "r" (__r24)
+#define K_ASM_ARGS_4 K_ASM_ARGS_3, "r" (__r23)
+#define K_ASM_ARGS_5 K_ASM_ARGS_4, "r" (__r22)
+#define K_ASM_ARGS_6 K_ASM_ARGS_5, "r" (__r21)
+
+/* The registers not listed as inputs but clobbered */
+#define K_CLOB_ARGS_6
+#define K_CLOB_ARGS_5 K_CLOB_ARGS_6, "%r21"
+#define K_CLOB_ARGS_4 K_CLOB_ARGS_5, "%r22"
+#define K_CLOB_ARGS_3 K_CLOB_ARGS_4, "%r23"
+#define K_CLOB_ARGS_2 K_CLOB_ARGS_3, "%r24"
+#define K_CLOB_ARGS_1 K_CLOB_ARGS_2, "%r25"
+#define K_CLOB_ARGS_0 K_CLOB_ARGS_1, "%r26"
 
-#define _syscall0(type,name)						      \
-type name(void)								      \
-{									      \
-    return K_INLINE_SYSCALL(name, 0);	\
+#define _syscall0(type,name)						\
+type name(void)								\
+{									\
+    return K_INLINE_SYSCALL(name, 0);	                                \
 }
 
-#define _syscall1(type,name,type1,arg1)					      \
-type name(type1 arg1)							      \
-{									      \
-    return K_INLINE_SYSCALL(name, 1, arg1);	\
+#define _syscall1(type,name,type1,arg1)					\
+type name(type1 arg1)							\
+{									\
+    return K_INLINE_SYSCALL(name, 1, arg1);	                        \
 }
 
-#define _syscall2(type,name,type1,arg1,type2,arg2)			      \
-type name(type1 arg1, type2 arg2)					      \
-{									      \
-    return K_INLINE_SYSCALL(name, 2, arg1, arg2);	\
+#define _syscall2(type,name,type1,arg1,type2,arg2)			\
+type name(type1 arg1, type2 arg2)					\
+{									\
+    return K_INLINE_SYSCALL(name, 2, arg1, arg2);	                \
 }
 
-#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3)		      \
-type name(type1 arg1, type2 arg2, type3 arg3)				      \
-{									      \
-    return K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3);	\
+#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3)		\
+type name(type1 arg1, type2 arg2, type3 arg3)				\
+{									\
+    return K_INLINE_SYSCALL(name, 3, arg1, arg2, arg3);	                \
 }
 
-#define _syscall4(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4)      \
-type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		      \
-{									      \
-    return K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4);	\
+#define _syscall4(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
+type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
+{									\
+    return K_INLINE_SYSCALL(name, 4, arg1, arg2, arg3, arg4);	        \
 }
 
 /* select takes 5 arguments */
@@ -834,13 +881,11 @@ type name(type1 arg1, type2 arg2, type3 
 
 
 /* mmap & mmap2 take 6 arguments */
-
 #define _syscall6(type,name,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5,type6,arg6) \
 type name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5, type6 arg6) \
-{									\
+{									        \
     return K_INLINE_SYSCALL(name, 6, arg1, arg2, arg3, arg4, arg5, arg6);	\
 }
-
 
 #ifdef __KERNEL_SYSCALLS__
 
