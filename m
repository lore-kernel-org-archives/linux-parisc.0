Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 142504899
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 04:57:19 -0700 (MST)
Date: Wed, 26 Mar 2003 12:57:17 +0100
Message-ID: <3E817DB00000012B@ocpmta1.freegates.net>
In-Reply-To: <200303260755.h2Q7tu202365@mailgate5.cinetic.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] glibc 2.3.2 patches updated, still no working sysdep-cancel
To: "Berthold Gunreben" <b.gunreben@web.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Carlos,

A grab your last patches and original src from ftp.gnu.org and in your patch
glibc23-05b-hppa-sysdep, the second hunk was rejected and so I change it
as follow:
=====
--- glibc-2.3.2/sysdeps/unix/sysv/linux/hppa/sysdep.h.orig	2002-08-26 23:16:19.000000000
+0200
+++ glibc-2.3.2/sysdeps/unix/sysv/linux/hppa/sysdep.h	2003-03-26 12:41:50.000000000
+0100
@@ -101,20 +101,27 @@
    which means
 	ENTRY(name)
 	DO_CALL(...)
-	nop
 	bv 0(2)
 	nop
 */
 
 #define	PSEUDO(name, syscall_name, args)				      \
   ENTRY (name)								      \
-  DO_CALL(syscall_name, args)					ASM_LINE_SEP  \
-  nop
+  DO_CALL(syscall_name, args)					ASM_LINE_SEP 
 
 #undef	PSEUDO_END
 #define	PSEUDO_END(name)						      \
   END (name)
 
+#define	PSEUDO_NOERRNO(name, syscall_name, args)			      \
+  ENTRY (name)								      \
+  DO_CALL_NOERRNO(syscall_name, args)				ASM_LINE_SEP 
+
+#undef	PSEUDO_END_NOERRNO
+#define	PSEUDO_END_NOERRNO(name)					      \
+  END (name)
+ 
+#undef JUMPTARGET
 #define JUMPTARGET(name)	name
 #define SYSCALL_PIC_SETUP	/* Nothing.  */
 
@@ -165,6 +172,13 @@
 0:						ASM_LINE_SEP	\
 	UNDOARGS_##args
 
+#undef	DO_CALL_NOERRNO
+#define DO_CALL_NOERRNO(syscall_name, args)			\
+	DOARGS_##args						\
+	ble  0x100(%sr2,%r0)			ASM_LINE_SEP	\
+	ldi SYS_ify (syscall_name), %r20	ASM_LINE_SEP	\
+	UNDOARGS_##args
+
 #define DOARGS_0 /* nothing */
 #define DOARGS_1 /* nothing */
 #define DOARGS_2 /* nothing */
@@ -183,7 +197,7 @@
 #define UNDOARGS_5 /* nothing */
 #define UNDOARGS_6 /* nothing */
 
-#else
+#else /* !__ASSEMBLER__ */
 
 #undef INLINE_SYSCALL
 #define INLINE_SYSCALL(name, nr, args...)	({		\
@@ -206,6 +220,35 @@
 	__sys_res;						\
 })
 
+#undef INTERNAL_SYSCALL_DECL
+#define INTERNAL_SYSCALL_DECL(err) do { } while (0)
+
+#undef INTERNAL_SYSCALL_ERROR_P
+#define INTERNAL_SYSCALL_ERROR_P(val, err) \
+  ((unsigned long) (val) >= -4095L)
+
+#undef INTERNAL_SYSCALL_ERRNO
+#define INTERNAL_SYSCALL_ERRNO(val, err)        (-(val))
+
+/* Similar to INLINE_SYSCALL but we don't set errno */
+#undef INTERNAL_SYSCALL
+#define INTERNAL_SYSCALL(name, err, nr, args...) 		\
+({								\
+	long __sys_res;						\
+	{							\
+		register unsigned long __res asm("r28");	\
+		LOAD_ARGS_##nr(args)				\
+		asm volatile(					\
+			"ble  0x100(%%sr2, %%r0)\n\t"		\
+			" ldi %1, %%r20"			\
+			: "=r" (__res)				\
+			: "i" (SYS_ify(name)) ASM_ARGS_##nr	\
+			);					\
+		__sys_res = __res;				\
+	}							\
+	__sys_res;						\
+ })
+
 #define LOAD_ARGS_0()
 #define LOAD_ARGS_1(r26)					\
 	register unsigned long __r26 __asm__("r26") = (unsigned long)r26;	\
=====

Or do I grab bad src?

Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
