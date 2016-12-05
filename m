From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 18:50:57 -0500
Message-ID: <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi> <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net> <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi> <a5349909-f4d8-1f0a-abbf-d16945f53ed6@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-30-163483931
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Meelis Roos <mroos@linux.ee>,
        linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a5349909-f4d8-1f0a-abbf-d16945f53ed6@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-30-163483931
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2016-12-05, at 4:17 PM, John David Anglin wrote:

> I'll post the current Debian patch set for hppa tonight and maybe we =
can consolidate.

I believe the two hppa specific patches that gentoo has are now =
installed upstream.

Here is current debian patch set for 2.24.  I believe =
cvs-atomic-machine.diff  has been applied.  The 'submitted-*'
patches have been submitted but not yet applied upstream.

There is one small bit of the _STACK_GROWS_UP patch that wasn't =
installed upstream.  It fixes a
testsuite regression.

The submitted-gmon-start.diff patch removes __gmon_start__ from shared =
libraries.  It presence breaks
--as-needed handling in the linker.  However, it's removal is a bit =
tricky and can result in broken packages
needing rebuilding.  This can be bad if the package happens to be the =
compiler or other crucial package.
Essentially everything has been rebuilt on debian.

We still have a change to SHMLBA which affects non standard page sizes.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=submitted-sysdeps-cancel.diff
Content-Type: application/octet-stream;
	name="submitted-sysdeps-cancel.diff"
Content-Transfer-Encoding: 7bit

diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h b/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
index cafc752..f239408 100644
--- a/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
+++ b/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
@@ -62,12 +62,11 @@
 	ENTRY (__##syscall_name##_nocancel)				\
 	DOARGS_##args					ASM_LINE_SEP	\
 	stwm TREG, 64(%sp)				ASM_LINE_SEP	\
+	.cfi_def_cfa_offset -64				ASM_LINE_SEP	\
 	.cfi_offset TREG, 0				ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	\
 	stw %sp, -4(%sp)				ASM_LINE_SEP	\
-	.cfi_offset 30, -4				ASM_LINE_SEP	\
 	stw %r19, -32(%sp)				ASM_LINE_SEP	\
-	.cfi_offset 19, -32				ASM_LINE_SEP	\
+	.cfi_offset 19, 32				ASM_LINE_SEP	\
 	/* Save r19 */					ASM_LINE_SEP	\
 	SAVE_PIC(TREG)					ASM_LINE_SEP	\
 	/* Do syscall, delay loads # */			ASM_LINE_SEP	\
@@ -91,21 +90,19 @@ L(pre_nc_end):						ASM_LINE_SEP	\
 	/* No need to LOAD_PIC */			ASM_LINE_SEP	\
 	/* Undo frame */				ASM_LINE_SEP	\
 	ldwm -64(%sp),TREG				ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	\
 	/* Restore rp before exit */			ASM_LINE_SEP	\
 	ldw -20(%sp), %rp				ASM_LINE_SEP	\
-	.cfi_restore 2					ASM_LINE_SEP	\
 	ret						ASM_LINE_SEP	\
 	END(__##syscall_name##_nocancel)		ASM_LINE_SEP	\
 	/**********************************************/ASM_LINE_SEP	\
 	ENTRY (name)							\
 	DOARGS_##args					ASM_LINE_SEP	\
 	stwm TREG, 64(%sp)				ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	\
+	.cfi_def_cfa_offset -64				ASM_LINE_SEP	\
+	.cfi_offset TREG, 0				ASM_LINE_SEP	\
 	stw %sp, -4(%sp)				ASM_LINE_SEP	\
-	.cfi_offset 30, -4				ASM_LINE_SEP	\
 	stw %r19, -32(%sp)				ASM_LINE_SEP	\
-	.cfi_offset 19, -32				ASM_LINE_SEP	\
+	.cfi_offset 19, 32				ASM_LINE_SEP	\
 	/* Done setting up frame, continue... */	ASM_LINE_SEP	\
 	SINGLE_THREAD_P					ASM_LINE_SEP	\
 	cmpib,<>,n 0,%ret0,L(pseudo_cancel)		ASM_LINE_SEP	\
@@ -168,40 +165,32 @@ L(pre_end):						ASM_LINE_SEP	\
 	/* No need to LOAD_PIC */			ASM_LINE_SEP	\
 	/* Undo frame */				ASM_LINE_SEP	\
 	ldwm -64(%sp),TREG				ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	\
 	/* Restore rp before exit */			ASM_LINE_SEP	\
-	ldw -20(%sp), %rp				ASM_LINE_SEP	\
-	.cfi_restore 2					ASM_LINE_SEP
+	ldw -20(%sp), %rp				ASM_LINE_SEP
 
 /* Save arguments into our frame */
 # define PUSHARGS_0	/* nothing to do */
 # define PUSHARGS_1	PUSHARGS_0 stw %r26, -36(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 26, -36			ASM_LINE_SEP
+			.cfi_offset 26, 28			ASM_LINE_SEP
 # define PUSHARGS_2	PUSHARGS_1 stw %r25, -40(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 25, -40			ASM_LINE_SEP
+			.cfi_offset 25, 24			ASM_LINE_SEP
 # define PUSHARGS_3	PUSHARGS_2 stw %r24, -44(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 24, -44			ASM_LINE_SEP
+			.cfi_offset 24, 20			ASM_LINE_SEP
 # define PUSHARGS_4	PUSHARGS_3 stw %r23, -48(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 23, -48			ASM_LINE_SEP
+			.cfi_offset 23, 16			ASM_LINE_SEP
 # define PUSHARGS_5	PUSHARGS_4 stw %r22, -52(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 22, -52			ASM_LINE_SEP
+			.cfi_offset 22, 12			ASM_LINE_SEP
 # define PUSHARGS_6	PUSHARGS_5 stw %r21, -56(%sr0,%sp)	ASM_LINE_SEP	\
-			.cfi_offset 21, -56			ASM_LINE_SEP
+			.cfi_offset 21, 8			ASM_LINE_SEP
 
 /* Bring them back from the stack */
 # define POPARGS_0	/* nothing to do */
-# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	ASM_LINE_SEP	\
-			.cfi_restore 26				ASM_LINE_SEP
-# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	ASM_LINE_SEP	\
-			.cfi_restore 25				ASM_LINE_SEP
-# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	ASM_LINE_SEP	\
-			.cfi_restore 24				ASM_LINE_SEP
-# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	ASM_LINE_SEP	\
-			.cfi_restore 23				ASM_LINE_SEP
-# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	ASM_LINE_SEP	\
-			.cfi_restore 22				ASM_LINE_SEP
-# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	ASM_LINE_SEP	\
-			.cfi_restore 21				ASM_LINE_SEP
+# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	ASM_LINE_SEP
+# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	ASM_LINE_SEP
+# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	ASM_LINE_SEP
+# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	ASM_LINE_SEP
+# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	ASM_LINE_SEP
+# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	ASM_LINE_SEP
 
 # if IS_IN (libpthread)
 #  ifdef PIC
diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h b/sysdeps/unix/sysv/linux/hppa/sysdep.h
index b459f0a..00cb366 100644
--- a/sysdeps/unix/sysv/linux/hppa/sysdep.h
+++ b/sysdeps/unix/sysv/linux/hppa/sysdep.h
@@ -49,11 +49,9 @@
    to another function */
 #define TREG 4
 #define SAVE_PIC(SREG) \
-	copy %r19, SREG ASM_LINE_SEP	\
-	.cfi_register 19, SREG
+	copy %r19, SREG
 #define LOAD_PIC(LREG) \
-	copy LREG , %r19 ASM_LINE_SEP	\
-	.cfi_restore 19
+	copy LREG , %r19
 /* Inline assembly defines */
 #define TREG_ASM "%r4" /* Cant clobber r3, it holds framemarker */
 #define SAVE_ASM_PIC	"       copy %%r19, %" TREG_ASM "\n"
@@ -292,12 +290,11 @@
 #define DO_CALL(syscall_name, args)				\
 	/* Create a frame */			ASM_LINE_SEP	\
 	stwm TREG, 64(%sp)			ASM_LINE_SEP	\
+	.cfi_def_cfa_offset -64			ASM_LINE_SEP	\
 	.cfi_offset TREG, 0			ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset 64		ASM_LINE_SEP	\
 	stw %sp, -4(%sp)			ASM_LINE_SEP	\
-	.cfi_offset 30, -4			ASM_LINE_SEP	\
 	stw %r19, -32(%sp)			ASM_LINE_SEP	\
-	.cfi_offset 19, -32			ASM_LINE_SEP	\
+	.cfi_offset 19, 32			ASM_LINE_SEP	\
 	/* Save r19 */				ASM_LINE_SEP	\
 	SAVE_PIC(TREG)				ASM_LINE_SEP	\
 	/* Do syscall, delay loads # */		ASM_LINE_SEP	\
@@ -320,10 +317,8 @@
 L(pre_end):					ASM_LINE_SEP	\
 	/* Restore our frame, restoring TREG */	ASM_LINE_SEP	\
 	ldwm -64(%sp), TREG			ASM_LINE_SEP	\
-	.cfi_adjust_cfa_offset -64		ASM_LINE_SEP	\
 	/* Restore return pointer */		ASM_LINE_SEP	\
-	ldw -20(%sp),%rp			ASM_LINE_SEP	\
-	.cfi_restore 2				ASM_LINE_SEP
+	ldw -20(%sp),%rp			ASM_LINE_SEP
 
 /* We do nothing with the return, except hand it back to someone else */
 #undef  DO_CALL_NOERRNO

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=submitted-setcontext.diff
Content-Type: application/octet-stream;
	name="submitted-setcontext.diff"
Content-Transfer-Encoding: 7bit

Index: glibc-2.22/sysdeps/unix/sysv/linux/hppa/setcontext.S
===================================================================
--- glibc-2.22.orig/sysdeps/unix/sysv/linux/hppa/setcontext.S
+++ glibc-2.22/sysdeps/unix/sysv/linux/hppa/setcontext.S
@@ -141,7 +141,7 @@ ENTRY(__setcontext)
 
 	/* No further context available. Exit now.  */
 	bl	HIDDEN_JUMPTARGET(exit), %r2
-	ldi	-1, %r26
+	ldi	0, %r26
 
 
 .Lerror:

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=submitted-gmon-start.diff
Content-Type: application/octet-stream;
	name="submitted-gmon-start.diff"
Content-Transfer-Encoding: 7bit

2015-11-15  Helge Deller  <deller@gmx.de>
	    John David Anglin  <danglin@gcc.gnu.org>

	PR libc/19170
	* sysdeps/hppa/crti.S (gmon_initializer): New.  Use .init_array support
	to call gmon_initializer.  Only call __gmon_start__ when symbol is
	defined at runtime.
	* sysdeps/hppa/crtn.S (__gmon_start__): Delete.
	* sysdeps/hppa/dl-lookupcfg.h (DL_FIXUP_MAKE_VALUE): Provide null
	function descriptor when MAP argument is null.
	* sysdeps/hppa/dl-trampoline.S (_dl_runtime_resolve): Return directly
	to previous function when function is undefined.

diff --git a/sysdeps/hppa/crti.S b/sysdeps/hppa/crti.S
index 98f1af5..568a999 100644
--- a/sysdeps/hppa/crti.S
+++ b/sysdeps/hppa/crti.S
@@ -49,6 +49,95 @@
 # define PREINIT_FUNCTION_WEAK 1
 #endif
 
+#if PREINIT_FUNCTION_WEAK
+	weak_extern (PREINIT_FUNCTION)
+#else
+	.hidden PREINIT_FUNCTION
+#endif
+
+
+/* If we have working .init_array support, we want to keep the .init
+   section empty (apart from the mandatory prologue/epilogue.  This
+   ensures that the default unwind conventions (return-pointer in b0,
+   frame state in ar.pfs, etc.)  will do the Right Thing.  To ensure
+   an empty .init section, we register gmon_initializer() via the
+   .init_array.
+
+    --davidm 02/10/29 */
+
+#if PREINIT_FUNCTION_WEAK
+/* This blob of assembly code is one simple C function:
+
+static void
+__attribute__ ((used))
+gmon_initializer (void)
+{
+  extern void weak_function __gmon_start__ (void);
+
+  if (__gmon_start__)
+    (*__gmon_start__)();
+}
+
+In a final executable, PLABEL32 relocations for function pointers are
+resolved at link time.  Typically, binutils/ld resolves __gmon_start__
+using an external shared library.  __gmon_start__ is always called if
+it is found at link time.  If __gmon_start__ is not found at runtime
+due to a library update, then the function pointer will point at a null
+function descriptor and calling it will cause a segmentation fault.
+So, we call __canonicalize_funcptr_for_compare to obtain the canonicalized
+address of __gmon_start__ and skip calling __gmon_start__ if it is zero.
+
+ */
+	.type __canonicalize_funcptr_for_compare,@function
+	.type $$dyncall,@function
+
+	.section .data.rel.ro,"aw",@progbits
+	.align 4
+.LC0:
+	.type __gmon_start__,@function
+	.word P%__gmon_start__
+
+	.text
+	.align 4
+	.type gmon_initializer,@function
+gmon_initializer:
+	.PROC
+	.CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
+	.ENTRY
+	stw %r2,-20(%r30)
+	stwm %r4,64(%r30)
+	stw %r3,-60(%r30)
+	addil LT'.LC0,%r19
+	ldw RT'.LC0(%r1),%r28
+	ldw 0(%r28),%r3
+	comib,= 0,%r3,1f
+	copy %r19,%r4
+	stw %r19,-32(%r30)
+	bl __canonicalize_funcptr_for_compare,%r2
+	copy %r3,%r26
+	comib,= 0,%r28,1f
+	copy %r4,%r19
+	copy %r3,%r22
+	.CALL ARGW0=GR
+	bl $$dyncall,%r31
+	copy %r31,%r2
+1:
+	ldw -84(%r30),%r2
+	ldw -60(%r30),%r3
+	bv %r0(%r2)
+	ldwm -64(%r30),%r4
+	.EXIT
+	.PROCEND
+	.size gmon_initializer, .-gmon_initializer
+
+# undef PREINIT_FUNCTION
+# define PREINIT_FUNCTION gmon_initializer
+#endif
+
+	.section .init_array, "aw"
+	.word P% PREINIT_FUNCTION
+
+
 /* _init prologue.  */
 	.section .init, "ax", %progbits
 	.align 4
@@ -58,14 +147,6 @@ _init:
 	stw	%rp,-20(%sp)
 	stwm	%r4,64(%sp)
 	stw	%r19,-32(%sp)
-#if PREINIT_FUNCTION_WEAK
-	bl	PREINIT_FUNCTION,%rp
-	copy	%r19,%r4	/* delay slot */
-#else
-	bl	PREINIT_FUNCTION,%rp
-	copy	%r19,%r4	/* delay slot */
-#endif
-	copy	%r4,%r19
 
 /* _fini prologue.  */
         .section .fini,"ax",%progbits
diff --git a/sysdeps/hppa/crtn.S b/sysdeps/hppa/crtn.S
index e0d345f..a410425 100644
--- a/sysdeps/hppa/crtn.S
+++ b/sysdeps/hppa/crtn.S
@@ -38,27 +38,6 @@
 /* crtn.S puts function epilogues in the .init and .fini sections
    corresponding to the prologues in crti.S. */
 
-/* Note that we cannot have a weak undefined __gmon_start__, because
-   that would require this to be PIC, and the linker is currently not
-   able to generate a proper procedure descriptor for _init.  Sad but
-   true.  Anyway, HPPA is one of those horrible architectures where
-   making the comparison and indirect call is quite expensive (see the
-   comment in sysdeps/generic/initfini.c). */
-        .text
-        .align 4
-        .weak   __gmon_start__
-        .type    __gmon_start__,@function
-__gmon_start__:
-	.proc
-	.callinfo
-	.entry
-        bv,n %r0(%r2)
-	.exit
-	.procend
-
-/* Here is the tail end of _init.  We put __gmon_start before this so
-   that the assembler creates the .PARISC.unwind section for us, ie.
-   with the right attributes.  */
 	.section .init, "ax", @progbits
 	ldw	-84(%sp),%rp
 	copy	%r4,%r19
diff --git a/sysdeps/hppa/dl-lookupcfg.h b/sysdeps/hppa/dl-lookupcfg.h
index c36928c..dea1809 100644
--- a/sysdeps/hppa/dl-lookupcfg.h
+++ b/sysdeps/hppa/dl-lookupcfg.h
@@ -75,7 +75,9 @@ void attribute_hidden _dl_unmap (struct link_map *map);
 
 /* Construct a fixup value from the address and linkmap */
 #define DL_FIXUP_MAKE_VALUE(map, addr) \
-   ((struct fdesc) { (addr), (map)->l_info[DT_PLTGOT]->d_un.d_ptr })
+  (map) ? ((struct fdesc) { (addr), (map)->l_info[DT_PLTGOT]->d_un.d_ptr }) \
+	: ((struct fdesc) { 0, 0 })
+
 
 /* Extract the code address from a fixup value */
 #define DL_FIXUP_VALUE_CODE_ADDR(value) ((value).ip)
diff --git a/sysdeps/hppa/dl-trampoline.S b/sysdeps/hppa/dl-trampoline.S
index 22f484a..64f0966 100644
--- a/sysdeps/hppa/dl-trampoline.S
+++ b/sysdeps/hppa/dl-trampoline.S
@@ -82,6 +82,11 @@ _dl_runtime_resolve:
 	bl	_dl_fixup,%rp
 	copy	%r21,%r19		/* set fixup func ltp */
 
+	/* Sometimes a final executable may attempt to call an undefined
+	   weak function (e.g., __gmon_start__).  Return if the function
+	   was not resolved by _dl_fixup */
+	comib,=	0,%r28,1f
+
 	/* Load up the returned func descriptor */
 	copy	%r28, %r22
 	copy	%r29, %r19
@@ -107,6 +112,13 @@ _dl_runtime_resolve:
 	/* Jump to new function, but return to previous function */
 	bv	%r0(%r22)
 	ldw	-20(%sp),%rp
+
+1:
+	/* Return to previous function */
+	ldw	-148(%sp),%rp
+	bv	%r0(%rp)
+	ldo	-128(%sp),%sp
+
         .EXIT
         .PROCEND
 	cfi_endproc

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=submitted-dladdr.diff
Content-Type: application/octet-stream;
	name="submitted-dladdr.diff"
Content-Transfer-Encoding: 7bit

2016-05-14  John David Anglin  <danglin@gcc.gnu.org>

	[BZ 20098]
	* sysdeps/hppa/dl-fptr.c (_dl_read_access_allowed): New.
	(_dl_lookup_address): Return address if it is not consistent with
	being a linker defined function pointer.  Likewise, return address
	if address and function descriptor addresses are not accessible.
	
diff --git a/sysdeps/hppa/dl-fptr.c b/sysdeps/hppa/dl-fptr.c
index 083242b..af0c5a1 100644
--- a/sysdeps/hppa/dl-fptr.c
+++ b/sysdeps/hppa/dl-fptr.c
@@ -331,22 +331,45 @@ elf_machine_resolve (void)
   return addr;
 }
 
+static inline int
+_dl_read_access_allowed (unsigned int *addr)
+{
+  int result;
+
+  asm ("proberi	(%1),3,%0" : "=r" (result) : "r" (addr) : );
+
+  return result;
+}
+
 ElfW(Addr)
 _dl_lookup_address (const void *address)
 {
   ElfW(Addr) addr = (ElfW(Addr)) address;
   unsigned int *desc, *gptr;
 
-  /* Check for special cases.  */
-  if ((int) addr == -1
-      || (unsigned int) addr < 4096
-      || !((unsigned int) addr & 2))
+  /* Return ADDR if the least-significant two bits of ADDR are not consistent
+     with ADDR being a linker defined function pointer.  The normal value for
+     a code address in a backtrace is 3.  */
+  if (((unsigned int) addr & 3) != 2)
+    return addr;
+
+  /* Handle special case where ADDR points to page 0.  */
+  if ((unsigned int) addr < 4096)
     return addr;
 
   /* Clear least-significant two bits from descriptor address.  */
   desc = (unsigned int *) ((unsigned int) addr & ~3);
+  if (!_dl_read_access_allowed (desc))
+    return addr;
+
+  /* Load first word of candidate descriptor.  It should be a pointer
+     with word alignment and point to memory that can be read.  */
+  gptr = (unsigned int *) desc[0];
+  if (((unsigned int) gptr & 3) != 0
+      || !_dl_read_access_allowed (gptr))
+    return addr;
 
-  /* Check if descriptor requires resolution.  The following trampoline is
+  /* See if descriptor requires resolution.  The following trampoline is
      used in each global offset table for function resolution:
 
 		ldw 0(r20),r22
@@ -358,7 +381,6 @@ _dl_lookup_address (const void *address)
 		.word "_dl_runtime_resolve ltp"
      got:	.word _DYNAMIC
 		.word "struct link map address" */
-  gptr = (unsigned int *) desc[0];
   if (gptr[0] == 0xea9f1fdd			/* b,l .-12,r20     */
       && gptr[1] == 0xd6801c1e			/* depwi 0,31,2,r20 */
       && (ElfW(Addr)) gptr[2] == elf_machine_resolve ())

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=local-stack-grows-up.diff
Content-Type: application/octet-stream;
	name="local-stack-grows-up.diff"
Content-Transfer-Encoding: 7bit

--- a/nptl/allocatestack.c
+++ b/nptl/allocatestack.c
@@ -683,9 +692,13 @@
 			prot) != 0)
 	    goto mprot_error;
 #elif _STACK_GROWS_UP
-	  if (mprotect ((char *) pd - pd->guardsize,
-			pd->guardsize - guardsize, prot) != 0)
-	    goto mprot_error;
+	  char *new_guard = (char *) (((uintptr_t) pd - guardsize) & ~pagesize_m1);
+	  char *old_guard = (char *) (((uintptr_t) pd - pd->guardsize) & ~pagesize_m1);
+	  /* The guard size difference might be > 0, but once rounded
+	     to the nearest page the size difference might be zero.  */
+	  if (old_guard - new_guard > 0)
+	    if (mprotect (old_guard, new_guard - old_guard, prot) != 0)
+	      goto mprot_error;
 #endif
 
 	  pd->guardsize = guardsize;

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=local-shmlba.diff
Content-Type: application/octet-stream;
	name="local-shmlba.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.18/sysdeps/unix/sysv/linux/hppa/bits/shm.h
===================================================================
--- eglibc-2.18.orig/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2013-01-09 19:28:48.000000000 -0500
+++ eglibc-2.18/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2014-04-09 21:08:06.516202583 -0400
@@ -36,7 +36,7 @@
 #define SHM_UNLOCK	12		/* unlock segment (root only) */
 
 /* Segment low boundary address multiple.  */
-#define SHMLBA 0x00400000		/* address needs to be 4 Mb aligned */
+#define SHMLBA		(__getpagesize ())
 
 /* Type to count number of attaches.  */
 typedef unsigned long int shmatt_t;

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=local-inlining.diff
Content-Type: application/octet-stream;
	name="local-inlining.diff"
Content-Transfer-Encoding: 7bit

Increase the maximal overall growth of the compilation unit caused
by inlining for dl-reloc.c on hppa. This remove some warnings and 
strangely it reduces the size of the final binary.

---
 sysdeps/hppa/Makefile |    1 +
 1 file changed, 1 insertion(+)

--- a/sysdeps/hppa/Makefile
+++ b/sysdeps/hppa/Makefile
@@ -23,6 +23,7 @@
 
 ifeq ($(subdir),elf)
 CFLAGS-rtld.c += -mdisable-fpregs
+CFLAGS-dl-reloc.c += --param inline-unit-growth=100
 sysdep-dl-routines += dl-symaddr dl-fptr
 # dl-fptr.c needs a complete rewrite to fix ISO C aliasing violations.
 CFLAGS-dl-fptr.c = -Wno-error

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=local-fptr-table-size.diff
Content-Type: application/octet-stream;
	name="local-fptr-table-size.diff"
Content-Transfer-Encoding: 7bit

Index: glibc-2.21/sysdeps/hppa/dl-fptr.c
===================================================================
--- glibc-2.21.orig/sysdeps/hppa/dl-fptr.c
+++ glibc-2.21/sysdeps/hppa/dl-fptr.c
@@ -28,6 +28,7 @@
 #include <dl-fptr.h>
 #include <dl-unmap-segments.h>
 #include <atomic.h>
+#include <libc-internal.h>
 
 #ifndef ELF_MACHINE_BOOT_FPTR_TABLE_LEN
 /* ELF_MACHINE_BOOT_FPTR_TABLE_LEN should be greater than the number of
@@ -181,24 +182,29 @@
 static inline ElfW(Addr) * __attribute__ ((always_inline))
 make_fptr_table (struct link_map *map)
 {
-  const ElfW(Sym) *symtab
-    = (const void *) D_PTR (map, l_info[DT_SYMTAB]);
+  const ElfW(Sym) *symtab = (const void *) D_PTR (map, l_info[DT_SYMTAB]);
   const char *strtab = (const void *) D_PTR (map, l_info[DT_STRTAB]);
   ElfW(Addr) *fptr_table;
   size_t size;
   size_t len;
+  const ElfW(Sym) *symtabend;
 
-  /* XXX Apparently the only way to find out the size of the dynamic
-     symbol section is to assume that the string table follows right
-     afterwards...  */
-  len = ((strtab - (char *) symtab)
+  /* Determine the end of the dynamic symbol table using the hash.  */
+  if (map->l_info[DT_HASH] != NULL)
+    symtabend = (symtab + ((Elf_Symndx *) D_PTR (map, l_info[DT_HASH]))[1]);
+  else
+  /* There is no direct way to determine the number of symbols in the
+     dynamic symbol table and no hash table is present.  The ELF
+     binary is ill-formed but what shall we do?  Use the beginning of
+     the string table which generally follows the symbol table.  */
+    symtabend = (const ElfW(Sym) *) strtab;
+
+  len = (((char *) symtabend - (char *) symtab)
 	 / map->l_info[DT_SYMENT]->d_un.d_val);
-  size = ((len * sizeof (fptr_table[0]) + GLRO(dl_pagesize) - 1)
-	  & -GLRO(dl_pagesize));
-  /* XXX We don't support here in the moment systems without MAP_ANON.
-     There probably are none for IA-64.  In case this is proven wrong
-     we will have to open /dev/null here and use the file descriptor
-     instead of the hard-coded -1.  */
+  size = ALIGN_UP (len * sizeof (fptr_table[0]), GLRO(dl_pagesize));
+
+  /* We don't support systems without MAP_ANON.  We avoid using malloc
+     because this might get called before malloc is setup.  */
   fptr_table = __mmap (NULL, size,
 		       PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE,
 		       -1, 0);

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=local-elf-make-cflags.diff
Content-Type: application/octet-stream;
	name="local-elf-make-cflags.diff"
Content-Transfer-Encoding: 7bit

Index: eglibc-2.18/elf/Makefile
===================================================================
--- eglibc-2.18.orig/elf/Makefile	2014-02-25 20:47:20.859469989 -0500
+++ eglibc-2.18/elf/Makefile	2014-02-25 20:47:20.769469646 -0500
@@ -424,7 +424,7 @@
 libof-ldconfig = ldconfig
 CFLAGS-dl-cache.c = $(SYSCONF-FLAGS)
 CFLAGS-cache.c = $(SYSCONF-FLAGS)
-CFLAGS-rtld.c = $(SYSCONF-FLAGS)
+CFLAGS-rtld.c += $(SYSCONF-FLAGS)
 
 cpp-srcs-left := $(all-rtld-routines:=.os)
 lib := rtld

--Apple-Mail-30-163483931
Content-Disposition: attachment;
	filename=cvs-atomic-machine.diff
Content-Type: application/octet-stream;
	name="cvs-atomic-machine.diff"
Content-Transfer-Encoding: 7bit

2016-09-22  John David Anglin  <dave.anglin@bell.net>

	* sysdeps/unix/sysv/linux/hppa/atomic-machine.h: Don't include
	abort-instr.h.
	(EFAULT): Remove conditional define.
	(ENOSYS): Likewise.
	(atomic_compare_and_exchange_val_acq): Use instruction nullification
	instead of conditional branch instructions.

--- a/sysdeps/unix/sysv/linux/hppa/atomic-machine.h
+++ b/sysdeps/unix/sysv/linux/hppa/atomic-machine.h
@@ -17,13 +17,6 @@
    <http://www.gnu.org/licenses/>.  */
 
 #include <stdint.h> /*  Required for type definitions e.g. uint8_t.  */
-#include <abort-instr.h> /*  Required for ABORT_INSTRUCTIUON.  */
-
-/* We need EFAULT, ENONSYS */
-#if !defined EFAULT && !defined ENOSYS
-#define EFAULT	14
-#define ENOSYS	251
-#endif
 
 #ifndef _ATOMIC_MACHINE_H
 #define _ATOMIC_MACHINE_H	1
@@ -62,7 +55,7 @@ typedef uintmax_t uatomic_max_t;
 #define _ASM_EDEADLOCK "-45"
 
 /* The only basic operation needed is compare and exchange.  The mem
-   pointer must be word aligned.  */
+   pointer must be word aligned.  We no longer loop on deadlock.  */
 #define atomic_compare_and_exchange_val_acq(mem, newval, oldval)	\
   ({									\
      register long lws_errno asm("r21");				\
@@ -74,20 +67,15 @@ typedef uintmax_t uatomic_max_t;
 	"0:					\n\t"			\
 	"ble	" _LWS "(%%sr2, %%r0)		\n\t"			\
 	"ldi	" _LWS_CAS ", %%r20		\n\t"			\
-	"ldi	" _ASM_EAGAIN ", %%r20		\n\t"			\
-	"cmpb,=,n %%r20, %%r21, 0b		\n\t"			\
-	"nop					\n\t"			\
-	"ldi	" _ASM_EDEADLOCK ", %%r20	\n\t"			\
-	"cmpb,=,n %%r20, %%r21, 0b		\n\t"			\
-	"nop					\n\t"			\
+	"cmpiclr,<> " _ASM_EAGAIN ", %%r21, %%r0\n\t"			\
+	"b,n 0b					\n\t"			\
+	"cmpclr,= %%r0, %%r21, %%r0		\n\t"			\
+	"iitlbp %%r0,(%%sr0, %%r0)		\n\t"			\
 	: "=r" (lws_ret), "=r" (lws_errno)				\
 	: "r" (lws_mem), "r" (lws_old), "r" (lws_new)			\
 	: _LWS_CLOBBER							\
      );									\
 									\
-     if (lws_errno == -EFAULT || lws_errno == -ENOSYS)			\
-	ABORT_INSTRUCTION;						\
-									\
      (__typeof (oldval)) lws_ret;					\
    })
 

--Apple-Mail-30-163483931--
