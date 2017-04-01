From: John David Anglin <dave.anglin@bell.net>
Subject: Re: mmap problem in localedef
Date: Sat, 1 Apr 2017 15:20:35 -0400
Message-ID: <A02BEA2B-FDB2-4012-8128-793CBC2FCFEB@bell.net>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee> <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi> <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net> <20161205205837.7jvnprhqa4tpruud@raspberrypi-2.musicnaut.iki.fi> <a5349909-f4d8-1f0a-abbf-d16945f53ed6@bell.net> <9B251251-04AB-4D78-ADD7-F0D429DEB761@bell.net> <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-37--481356122
Cc: Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170401183717.jpvilw2u4lgiceuv@raspberrypi-3.musicnaut.iki.fi>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-37--481356122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 2017-04-01, at 2:37 PM, Aaro Koskinen wrote:

>> We still have a change to SHMLBA which affects non standard page =
sizes.
>=20
> FWIW, this is the one (local-shmlba.diff) that is needed to get =
localedef
> working on PA-RISC. I just tested with glibc 2.25 and Linux 4.10 with =
4 KB
> page size.

I compared the Debian 2.24 patch set for hppa versus my current patch =
set for trunk.  I found that
I was missing a couple of "local" patches including the one mentioned =
above.

Attached is my current patch set.  I'll do another build and check after =
I do a kernel update to add UTS
support.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-37--481356122
Content-Disposition: attachment;
	filename=glibc-20170401.d.txt
Content-Type: text/plain;
	name="glibc-20170401.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/elf/Makefile b/elf/Makefile
index cc4aeb25b6..883dd8f013 100644
--- a/elf/Makefile
+++ b/elf/Makefile
@@ -543,7 +543,7 @@ CFLAGS-ldconfig.c =3D $(SYSCONF-FLAGS) =
-D'LIBDIR=3D"$(libdir)"' \
 libof-ldconfig =3D ldconfig
 CFLAGS-dl-cache.c =3D $(SYSCONF-FLAGS)
 CFLAGS-cache.c =3D $(SYSCONF-FLAGS)
-CFLAGS-rtld.c =3D $(SYSCONF-FLAGS)
+CFLAGS-rtld.c +=3D $(SYSCONF-FLAGS)
=20
 cpp-srcs-left :=3D $(all-rtld-routines:=3D.os)
 lib :=3D rtld
diff --git a/nptl/allocatestack.c b/nptl/allocatestack.c
index e5c5f79a82..085ae07b32 100644
--- a/nptl/allocatestack.c
+++ b/nptl/allocatestack.c
@@ -647,9 +647,13 @@ allocate_stack (const struct pthread_attr *attr, =
struct pthread **pdp,
 			prot) !=3D 0)
 	    goto mprot_error;
 #elif _STACK_GROWS_UP
-	  if (mprotect ((char *) pd - pd->guardsize,
-			pd->guardsize - guardsize, prot) !=3D 0)
-	    goto mprot_error;
+	  char *new_guard =3D (char *) (((uintptr_t) pd - guardsize) & =
~pagesize_m1);
+	  char *old_guard =3D (char *) (((uintptr_t) pd - pd->guardsize) =
& ~pagesize_m1);
+	  /* The guard size difference might be > 0, but once rounded
+	     to the nearest page the size difference might be zero.  */
+	  if (old_guard - new_guard > 0)
+	    if (mprotect (old_guard, new_guard - old_guard, prot) !=3D =
0)
+	      goto mprot_error;
 #endif
=20
 	  pd->guardsize =3D guardsize;
diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c
index d80b5318e5..99d7d96027 100644
--- a/resolv/res_mkquery.c
+++ b/resolv/res_mkquery.c
@@ -83,6 +83,15 @@
 # define RANDOM_BITS(Var) { uint64_t v64; HP_TIMING_NOW (v64); Var =3D =
v64; }
 #endif
=20
+/* The structure HEADER is normally aligned to a word boundary and its
+   fields are accessed using word loads and stores.  We need to access
+   this structure when it is aligned on a byte boundary.  This can =
cause
+   problems on machines with strict alignment.  So, we create a new
+   typedef to reduce its alignment to one.  This ensures the fields are
+   accessed with byte loads and stores.  */
+typedef HEADER __attribute__ ((__aligned__(1))) UHEADER;
+#define HEADER UHEADER
+
 /*
  * Form all types of queries.
  * Returns the size of the result or -1.
diff --git a/resolv/res_query.c b/resolv/res_query.c
index 07dc6f6583..9a1a8f90d1 100644
--- a/resolv/res_query.c
+++ b/resolv/res_query.c
@@ -78,6 +78,14 @@
 #include <stdlib.h>
 #include <string.h>
=20
+/* The structure HEADER is normally aligned to a word boundary and its
+   fields are accessed using word loads and stores.  We need to access=20=

+   this structure when it is aligned on a byte boundary.  This can =
cause
+   problems on machines with strict alignment.  So, we create a new
+   typedef to reduce its alignment to one.  This ensures the fields are
+   accessed with byte loads and stores.  */
+typedef HEADER __attribute__ ((__aligned__(1))) UHEADER;
+
 /* Options.  Leave them on. */
 /* #undef DEBUG */
=20
@@ -117,8 +125,8 @@ __libc_res_nquery(res_state statp,
 		  int *resplen2,
 		  int *answerp2_malloced)
 {
-	HEADER *hp =3D (HEADER *) answer;
-	HEADER *hp2;
+	UHEADER *hp =3D (UHEADER *) answer;
+	UHEADER *hp2;
 	int n, use_malloc =3D 0;
 	u_int oflags =3D statp->_flags;
=20
@@ -235,7 +243,7 @@ __libc_res_nquery(res_state statp,
=20
 	if (answerp !=3D NULL)
 	  /* __libc_res_nsend might have reallocated the buffer.  */
-	  hp =3D (HEADER *) *answerp;
+	  hp =3D (UHEADER *) *answerp;
=20
 	/* We simplify the following tests by assigning HP to HP2 or
 	   vice versa.  It is easy to verify that this is the same as
@@ -246,7 +254,7 @@ __libc_res_nquery(res_state statp,
 	  }
 	else
 	  {
-	    hp2 =3D (HEADER *) *answerp2;
+	    hp2 =3D (UHEADER *) *answerp2;
 	    if (n < (int) sizeof (HEADER))
 	      {
 	        hp =3D hp2;
@@ -336,7 +344,7 @@ __libc_res_nsearch(res_state statp,
 		   int *answerp2_malloced)
 {
 	const char *cp, * const *domain;
-	HEADER *hp =3D (HEADER *) answer;
+	UHEADER *hp =3D (UHEADER *) answer;
 	char tmp[NS_MAXDNAME];
 	u_int dots;
 	int trailing_dot, ret, saved_herrno;
diff --git a/resolv/res_send.c b/resolv/res_send.c
index 28c4cabfcb..19f9a86a2b 100644
--- a/resolv/res_send.c
+++ b/resolv/res_send.c
@@ -110,6 +110,15 @@
 #include <kernel-features.h>
 #include <libc-diag.h>
=20
+/* The structure HEADER is normally aligned to a word boundary and its
+   fields are accessed using word loads and stores.  We need to access=20=

+   this structure when it is aligned on a byte boundary.  This can =
cause
+   problems on machines with strict alignment.  So, we create a new
+   typedef to reduce its alignment to one.  This ensures the fields are
+   accessed with byte loads and stores.  */
+typedef HEADER __attribute__ ((__aligned__(1))) UHEADER;
+#define HEADER UHEADER
+
 #if PACKETSZ > 65536
 #define MAXPACKET       PACKETSZ
 #else
diff --git a/sysdeps/hppa/Makefile b/sysdeps/hppa/Makefile
index c0edb99917..64af43b5ff 100644
--- a/sysdeps/hppa/Makefile
+++ b/sysdeps/hppa/Makefile
@@ -23,6 +23,7 @@ LDFLAGS-c_pic.os +=3D -Wl,--unique=3D.text*
=20
 ifeq ($(subdir),elf)
 CFLAGS-rtld.c +=3D -mdisable-fpregs
+CFLAGS-dl-reloc.c +=3D --param inline-unit-growth=3D100
 sysdep-dl-routines +=3D dl-symaddr dl-fptr
 # dl-fptr.c needs a complete rewrite to fix ISO C aliasing violations.
 CFLAGS-dl-fptr.c =3D -Wno-error
diff --git a/sysdeps/hppa/__longjmp.c b/sysdeps/hppa/__longjmp.c
index a7eefc7ad6..438db01473 100644
--- a/sysdeps/hppa/__longjmp.c
+++ b/sysdeps/hppa/__longjmp.c
@@ -24,15 +24,16 @@
 void
 __longjmp (__jmp_buf env, int val)
 {
+#ifdef CHECK_SP
+  CHECK_SP (env[0].__jmp_buf.__sp);
+#endif
+
+  {
   /* We must use one of the non-callee saves registers
      for env.  */
   register unsigned long r26 asm ("r26") =3D (unsigned long)&env[0];
   register unsigned long r25 asm ("r25") =3D (unsigned long)(val =3D=3D =
0 ? 1 : val);
=20
-#ifdef CHECK_SP
-  CHECK_SP (env[0].__jmp_buf.__sp);
-#endif
-
   asm volatile(
 	/* Set return value.  */
 	"copy	%0, %%r28\n\t"
@@ -79,6 +80,8 @@ __longjmp (__jmp_buf env, int val)
 	: /* No outputs.  */
 	: "r" (r25), "r" (r26)
 	: /* No point in clobbers.  */ );
+  }
+
   /* Avoid `volatile function does return' warnings.  */
   for (;;);
 }
diff --git a/sysdeps/hppa/crti.S b/sysdeps/hppa/crti.S
index 7c1470ddf8..0f9bb7b013 100644
--- a/sysdeps/hppa/crti.S
+++ b/sysdeps/hppa/crti.S
@@ -49,6 +49,95 @@
 # define PREINIT_FUNCTION_WEAK 1
 #endif
=20
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
+So, we call __canonicalize_funcptr_for_compare to obtain the =
canonicalized
+address of __gmon_start__ and skip calling __gmon_start__ if it is =
zero.
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
+	.CALLINFO FRAME=3D64,CALLS,SAVE_RP,ENTRY_GR=3D4
+	.ENTRY
+	stw %r2,-20(%r30)
+	stwm %r4,64(%r30)
+	stw %r3,-60(%r30)
+	addil LT'.LC0,%r19
+	ldw RT'.LC0(%r1),%r28
+	ldw 0(%r28),%r3
+	comib,=3D 0,%r3,1f
+	copy %r19,%r4
+	stw %r19,-32(%r30)
+	bl __canonicalize_funcptr_for_compare,%r2
+	copy %r3,%r26
+	comib,=3D 0,%r28,1f
+	copy %r4,%r19
+	copy %r3,%r22
+	.CALL ARGW0=3DGR
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
=20
 /* _fini prologue.  */
         .section .fini,"ax",%progbits
diff --git a/sysdeps/hppa/crtn.S b/sysdeps/hppa/crtn.S
index 42f310d217..49666b81f9 100644
--- a/sysdeps/hppa/crtn.S
+++ b/sysdeps/hppa/crtn.S
@@ -38,27 +38,6 @@
 /* crtn.S puts function epilogues in the .init and .fini sections
    corresponding to the prologues in crti.S. */
=20
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
diff --git a/sysdeps/hppa/dl-fptr.c b/sysdeps/hppa/dl-fptr.c
index 83bdb91202..4c0a4b0bd5 100644
--- a/sysdeps/hppa/dl-fptr.c
+++ b/sysdeps/hppa/dl-fptr.c
@@ -28,6 +28,7 @@
 #include <dl-fptr.h>
 #include <dl-unmap-segments.h>
 #include <atomic.h>
+#include <libc-internal.h>
=20
 #ifndef ELF_MACHINE_BOOT_FPTR_TABLE_LEN
 /* ELF_MACHINE_BOOT_FPTR_TABLE_LEN should be greater than the number of
@@ -181,24 +182,29 @@ make_fdesc (ElfW(Addr) ip, ElfW(Addr) gp)
 static inline ElfW(Addr) * __attribute__ ((always_inline))
 make_fptr_table (struct link_map *map)
 {
-  const ElfW(Sym) *symtab
-    =3D (const void *) D_PTR (map, l_info[DT_SYMTAB]);
+  const ElfW(Sym) *symtab =3D (const void *) D_PTR (map, =
l_info[DT_SYMTAB]);
   const char *strtab =3D (const void *) D_PTR (map, l_info[DT_STRTAB]);
   ElfW(Addr) *fptr_table;
   size_t size;
   size_t len;
+  const ElfW(Sym) *symtabend;
=20
-  /* XXX Apparently the only way to find out the size of the dynamic
-     symbol section is to assume that the string table follows right
-     afterwards...  */
-  len =3D ((strtab - (char *) symtab)
+  /* Determine the end of the dynamic symbol table using the hash.  */
+  if (map->l_info[DT_HASH] !=3D NULL)
+    symtabend =3D (symtab + ((Elf_Symndx *) D_PTR (map, =
l_info[DT_HASH]))[1]);
+  else
+  /* There is no direct way to determine the number of symbols in the
+     dynamic symbol table and no hash table is present.  The ELF
+     binary is ill-formed but what shall we do?  Use the beginning of
+     the string table which generally follows the symbol table.  */
+    symtabend =3D (const ElfW(Sym) *) strtab;
+
+  len =3D (((char *) symtabend - (char *) symtab)
 	 / map->l_info[DT_SYMENT]->d_un.d_val);
-  size =3D ((len * sizeof (fptr_table[0]) + GLRO(dl_pagesize) - 1)
-	  & -GLRO(dl_pagesize));
-  /* XXX We don't support here in the moment systems without MAP_ANON.
-     There probably are none for IA-64.  In case this is proven wrong
-     we will have to open /dev/null here and use the file descriptor
-     instead of the hard-coded -1.  */
+  size =3D ALIGN_UP (len * sizeof (fptr_table[0]), GLRO(dl_pagesize));
+
+  /* We don't support systems without MAP_ANON.  We avoid using malloc
+     because this might get called before malloc is setup.  */
   fptr_table =3D __mmap (NULL, size,
 		       PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE,
 		       -1, 0);
@@ -331,22 +337,45 @@ elf_machine_resolve (void)
   return addr;
 }
=20
+static inline int
+_dl_read_access_allowed (unsigned int *addr)
+{
+  int result;
+
+  asm ("proberi	(%1),3,%0" : "=3Dr" (result) : "r" (addr) : );
+
+  return result;
+}
+
 ElfW(Addr)
 _dl_lookup_address (const void *address)
 {
   ElfW(Addr) addr =3D (ElfW(Addr)) address;
   unsigned int *desc, *gptr;
=20
-  /* Check for special cases.  */
-  if ((int) addr =3D=3D -1
-      || (unsigned int) addr < 4096
-      || !((unsigned int) addr & 2))
+  /* Return ADDR if the least-significant two bits of ADDR are not =
consistent
+     with ADDR being a linker defined function pointer.  The normal =
value for
+     a code address in a backtrace is 3.  */
+  if (((unsigned int) addr & 3) !=3D 2)
+    return addr;
+
+  /* Handle special case where ADDR points to page 0.  */
+  if ((unsigned int) addr < 4096)
     return addr;
=20
   /* Clear least-significant two bits from descriptor address.  */
   desc =3D (unsigned int *) ((unsigned int) addr & ~3);
+  if (!_dl_read_access_allowed (desc))
+    return addr;
=20
-  /* Check if descriptor requires resolution.  The following trampoline =
is
+  /* Load first word of candidate descriptor.  It should be a pointer
+     with word alignment and point to memory that can be read.  */
+  gptr =3D (unsigned int *) desc[0];
+  if (((unsigned int) gptr & 3) !=3D 0
+      || !_dl_read_access_allowed (gptr))
+    return addr;
+
+  /* See if descriptor requires resolution.  The following trampoline =
is
      used in each global offset table for function resolution:
=20
 		ldw 0(r20),r22
@@ -358,7 +387,6 @@ _dl_lookup_address (const void *address)
 		.word "_dl_runtime_resolve ltp"
      got:	.word _DYNAMIC
 		.word "struct link map address" */
-  gptr =3D (unsigned int *) desc[0];
   if (gptr[0] =3D=3D 0xea9f1fdd			/* b,l .-12,r20  =
   */
       && gptr[1] =3D=3D 0xd6801c1e			/* depwi =
0,31,2,r20 */
       && (ElfW(Addr)) gptr[2] =3D=3D elf_machine_resolve ())
diff --git a/sysdeps/hppa/dl-trampoline.S b/sysdeps/hppa/dl-trampoline.S
index 856339bffe..f1294a931f 100644
--- a/sysdeps/hppa/dl-trampoline.S
+++ b/sysdeps/hppa/dl-trampoline.S
@@ -82,6 +82,11 @@ _dl_runtime_resolve:
 	bl	_dl_fixup,%rp
 	copy	%r21,%r19		/* set fixup func ltp */
=20
+	/* Sometimes a final executable may attempt to call an undefined
+	   weak function (e.g., __gmon_start__).  Return if the function
+	   was not resolved by _dl_fixup */
+	comib,=3D	0,%r28,1f
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
diff --git a/sysdeps/hppa/nptl/bits/pthreadtypes.h =
b/sysdeps/hppa/nptl/bits/pthreadtypes.h
index e37111a2f3..4f742bfaa6 100644
--- a/sysdeps/hppa/nptl/bits/pthreadtypes.h
+++ b/sysdeps/hppa/nptl/bits/pthreadtypes.h
@@ -103,39 +103,32 @@ typedef union
   long int __align;
 } pthread_mutexattr_t;
=20
-
-/* Data structure for conditional variable handling.  The structure of
-   the attribute type is not exposed on purpose. However, this =
structure
-   is exposed via PTHREAD_COND_INITIALIZER, and because of this, the
-   Linuxthreads version sets the first four ints to one. In the NPTL
-   version we must check, in every function using pthread_cond_t,
-   for the static Linuxthreads initializer and clear the appropriate
-   words. */
+/* Data structure for conditional variable handling. */
 typedef union
 {
   struct
   {
-    /* In the old Linuxthreads pthread_cond_t, this is the
-       start of the 4-word lock structure, the next four words
-       are set all to 1 by the Linuxthreads
-       PTHREAD_COND_INITIALIZER.  */
-    int __lock __attribute__ ((__aligned__(16)));
-    /* Tracks the initialization of this structure:
-       0  initialized with NPTL PTHREAD_COND_INITIALIZER.
-       1  initialized with Linuxthreads PTHREAD_COND_INITIALIZER.
-       2  initialization in progress.  */
-    int __initializer;
-    unsigned int __futex;
-    void *__mutex;
-    /* In the old Linuxthreads this would have been the start
-       of the pthread_fastlock status word.  */
-    __extension__ unsigned long long int __total_seq;
-    __extension__ unsigned long long int __wakeup_seq;
-    __extension__ unsigned long long int __woken_seq;
-    unsigned int __nwaiters;
-    unsigned int __broadcast_seq;
-    /* The NPTL pthread_cond_t is exactly the same size as
-       the Linuxthreads version, there are no words to spare.  */
+    __extension__ union
+    {
+      __extension__ unsigned long long int __wseq;
+      struct {
+	unsigned int __low;
+	unsigned int __high;
+      } __wseq32;
+    } __attribute__ ((__aligned__(16)));
+    __extension__ union
+    {
+      __extension__ unsigned long long int __g1_start;
+      struct {
+	unsigned int __low;
+        unsigned int __high;
+      } __g1_start32;
+    };
+    unsigned int __g_refs[2];
+    unsigned int __g_size[2];
+    unsigned int __g1_orig_size;
+    unsigned int __wrefs;
+    unsigned int __g_signals[2];
   } __data;
   char __size[__SIZEOF_PTHREAD_COND_T];
   __extension__ long long int __align;
diff --git a/sysdeps/unix/sysv/linux/hppa/bits/shm.h =
b/sysdeps/unix/sysv/linux/hppa/bits/shm.h
index 794f0ab2da..52632d0dea 100644
--- a/sysdeps/unix/sysv/linux/hppa/bits/shm.h
+++ b/sysdeps/unix/sysv/linux/hppa/bits/shm.h
@@ -37,7 +37,7 @@
 #define SHM_UNLOCK	12		/* unlock segment (root only) */
=20
 /* Segment low boundary address multiple.  */
-#define SHMLBA 0x00400000		/* address needs to be 4 Mb =
aligned */
+#define SHMLBA		(__getpagesize ())
=20
 /* Type to count number of attaches.  */
 typedef unsigned long int shmatt_t;
diff --git a/sysdeps/unix/sysv/linux/hppa/clone.S =
b/sysdeps/unix/sysv/linux/hppa/clone.S
index d36b302199..46ee6972d3 100644
--- a/sysdeps/unix/sysv/linux/hppa/clone.S
+++ b/sysdeps/unix/sysv/linux/hppa/clone.S
@@ -64,9 +64,12 @@
 ENTRY(__clone)
 	/* Prologue */
 	stwm	%r4, 64(%sp)
+	.cfi_def_cfa_offset -64
+	.cfi_offset 4, 0
 	stw	%sp, -4(%sp)
 #ifdef PIC
 	stw	%r19, -32(%sp)
+	.cfi_offset 19, 32
 #endif
=20
 	/* Sanity check arguments.  */
diff --git a/sysdeps/unix/sysv/linux/hppa/getcontext.S =
b/sysdeps/unix/sysv/linux/hppa/getcontext.S
index 6f52f2149d..68a74a0b7e 100644
--- a/sysdeps/unix/sysv/linux/hppa/getcontext.S
+++ b/sysdeps/unix/sysv/linux/hppa/getcontext.S
@@ -130,8 +130,11 @@ ENTRY(__getcontext)
=20
 	/* Prologue */
 	stwm	%r4, 64(%sp)
+	.cfi_def_cfa_offset -64
+	.cfi_offset 4, 0
 #ifdef PIC
 	stw	%r19, -32(%sp)
+	.cfi_offset 19, 32
 #endif
=20
 	/* Set up the trampoline registers.
@@ -156,7 +159,7 @@ ENTRY(__getcontext)
 	/* Epilogue */
 	ldw	-84(%sp), %r2
 #ifdef PIC
-	ldw	-96(%sp), %r19
+	ldw	-32(%sp), %r19
 #endif
 	bv	%r0(%r2)
 	ldwm	-64(%sp), %r4
diff --git a/sysdeps/unix/sysv/linux/hppa/internaltypes.h =
b/sysdeps/unix/sysv/linux/hppa/internaltypes.h
deleted file mode 100644
index d6496579da..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/internaltypes.h
+++ /dev/null
@@ -1,84 +0,0 @@
-#include_next <internaltypes.h>
-#ifndef _INTERNAL_TYPES_H_HPPA_
-#define _INTERNAL_TYPES_H_HPPA_ 1
-#include <atomic.h>
-
-/* In GLIBC 2.10 HPPA switched from Linuxthreads to NPTL, and in order
-to maintain ABI compatibility with pthread_cond_t, some care had to be
-taken.
-
-The NPTL pthread_cond_t grew in size. When HPPA switched to NPTL, we
-dropped the use of ldcw, and switched to the kernel helper routine for
-compare-and-swap.  This allowed HPPA to use the 4-word 16-byte aligned
-lock words, and alignment words to store the additional pthread_cond_t
-data. Once organized properly the new NPTL pthread_cond_t was 1 word
-smaller than the Linuxthreads version.
-
-However, we were faced with the case that users may have initialized =
the
-pthread_cond_t with PTHREAD_COND_INITIALIZER. In this case, the first
-four words were set to one, and must be cleared before any NPTL code
-used these words.
-
-We didn't want to use LDCW, because it continues to be a source of bugs
-when applications memset pthread_cond_t to all zeroes by accident. This
-works on all other architectures where lock words are unlocked at zero.
-Remember that because of the semantics of LDCW, a locked word is set to
-zero, and an unlocked word is set to 1.
-
-Instead we used atomic_compare_and_exchange_val_acq, but we couldn't =
use
-this on any of the pthread_cond_t words, otherwise it might interfere
-with the current operation of the structure. To solve this problem we
-used the left over word.
-
-If the stucture was initialized by a legacy Linuxthread
-PTHREAD_COND_INITIALIZER it contained a 1, and this indicates that the
-structure requires zeroing for NPTL. The first thread to come upon a
-pthread_cond_t with a 1 in the __initializer field, will
-compare-and-swap the value, placing a 2 there which will cause all =
other
-threads using the same pthread_cond_t to wait for the completion of the
-initialization. Lastly, we use a store (with memory barrier) to change
-__initializer from 2 to 0. Note that the store is strongly ordered, but
-we use the PA 1.1 compatible form which is ",ma" with zero offset.
-
-In the future, when the application is recompiled with NPTL
-PTHREAD_COND_INITIALIZER it will be a quick compare-and-swap, which
-fails because __initializer is zero, and the structure will be used as
-is correctly.  */
-
-#define cond_compat_clear(var) \
-({									=
\
-  int tmp =3D 0;								=
\
-  var->__data.__wseq =3D 0;						=
\
-  var->__data.__signals_sent =3D 0;					=
\
-  var->__data.__confirmed =3D 0;						=
\
-  var->__data.__generation =3D 0;						=
\
-  var->__data.__mutex =3D NULL;						=
\
-  var->__data.__quiescence_waiters =3D 0;					=
\
-  var->__data.__clockid =3D 0;						=
\
-  /* Clear __initializer last, to indicate initialization is done.  */	=
\
-  /* This synchronizes-with the acquire load below.  */			=
\
-  atomic_store_release (&var->__data.__initializer, 0);			=
\
-})
-
-#define cond_compat_check_and_clear(var) \
-({								\
-  int v;							\
-  int *value =3D &var->__data.__initializer;			\
-  /* This synchronizes-with the release store above.  */	\
-  while ((v =3D atomic_load_acquire (value)) !=3D 0)		\
-    {								\
-      if (v =3D=3D 1						\
-	  /* Relaxed MO is fine; it only matters who's first.  */        =
\
-	  && atomic_compare_exchange_acquire_weak_relaxed (value, 1, 2)) =
\
-	{							\
-	  /* We're first; initialize structure.  */		\
-	  cond_compat_clear (var);				\
-	  break;						\
-	}							\
-      else							\
-	/* Yield before we re-check initialization status.  */	\
-	sched_yield ();						\
-    }								\
-})
-
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/pt-vfork.S =
b/sysdeps/unix/sysv/linux/hppa/pt-vfork.S
index fc4573c86b..8b7d7df2fe 100644
--- a/sysdeps/unix/sysv/linux/hppa/pt-vfork.S
+++ b/sysdeps/unix/sysv/linux/hppa/pt-vfork.S
@@ -58,7 +58,10 @@ ENTRY(__vfork)
 	   that there is no child now, so it's safe to create
 	   a frame.  */
 	stw	%rp, -20(%sp)
+	.cfi_offset 2, -20
 	stwm	%r3, 64(%sp)
+	.cfi_def_cfa_offset -64
+	.cfi_offset 3, 0
 	stw	%sp, -4(%sp)
=20
 	sub	%r0,%ret0,%r3
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread.h =
b/sysdeps/unix/sysv/linux/hppa/pthread.h
index ac617201d2..d3b960edd4 100644
--- a/sysdeps/unix/sysv/linux/hppa/pthread.h
+++ b/sysdeps/unix/sysv/linux/hppa/pthread.h
@@ -185,7 +185,7 @@ enum
=20
=20
 /* Conditional variable handling.  */
-#define PTHREAD_COND_INITIALIZER { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } =
}
+#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, =
{0, 0} } }
=20
=20
 /* Cleanup buffers */
@@ -1165,12 +1165,6 @@ __END_DECLS
 #ifndef _PTHREAD_H_HPPA_
 #define _PTHREAD_H_HPPA_ 1
=20
-/* The pthread_cond_t initializer is compatible only with NPTL. We do =
not
-   want to be forwards compatible, we eventually want to drop the code
-   that has to clear the old LT initializer.  */
-#undef PTHREAD_COND_INITIALIZER
-#define PTHREAD_COND_INITIALIZER { { 0, 0, 0, (void *) 0, 0, 0, 0, 0, 0 =
} }
-
 /* The pthread_mutex_t and pthread_rwlock_t initializers are compatible
    only with NPTL. NPTL assumes pthread_rwlock_t is all zero.  */
 #undef PTHREAD_MUTEX_INITIALIZER
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_broadcast.c =
b/sysdeps/unix/sysv/linux/hppa/pthread_cond_broadcast.c
deleted file mode 100644
index a6f9f5d433..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_broadcast.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Copyright (C) 2009-2017 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library.  If not, see
-   <http://www.gnu.org/licenses/>.  */
-
-#ifndef INCLUDED_SELF
-# define INCLUDED_SELF
-# include <pthread_cond_broadcast.c>
-#else
-# include <pthread.h>
-# include <pthreadP.h>
-# include <internaltypes.h>
-# include <shlib-compat.h>
-int
-__pthread_cond_broadcast (pthread_cond_t *cond)
-{
-  cond_compat_check_and_clear (cond);
-  return __pthread_cond_broadcast_internal (cond);
-}
-versioned_symbol (libpthread, __pthread_cond_broadcast, =
pthread_cond_broadcast,
-                  GLIBC_2_3_2);
-# undef versioned_symbol
-# define versioned_symbol(lib, local, symbol, version)
-# undef __pthread_cond_broadcast
-# define __pthread_cond_broadcast __pthread_cond_broadcast_internal
-# include_next <pthread_cond_broadcast.c>
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_destroy.c =
b/sysdeps/unix/sysv/linux/hppa/pthread_cond_destroy.c
deleted file mode 100644
index 49af087bb4..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_destroy.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Copyright (C) 2009-2017 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library.  If not, see
-   <http://www.gnu.org/licenses/>.  */
-
-#ifndef INCLUDED_SELF
-# define INCLUDED_SELF
-# include <pthread_cond_destroy.c>
-#else
-# include <pthread.h>
-# include <pthreadP.h>
-# include <internaltypes.h>
-# include <shlib-compat.h>
-int
-__pthread_cond_destroy (pthread_cond_t *cond)
-{
-  cond_compat_check_and_clear (cond);
-  return __pthread_cond_destroy_internal (cond);
-}
-versioned_symbol (libpthread, __pthread_cond_destroy, =
pthread_cond_destroy,
-                  GLIBC_2_3_2);
-# undef versioned_symbol
-# define versioned_symbol(lib, local, symbol, version)
-# undef __pthread_cond_destroy
-# define __pthread_cond_destroy __pthread_cond_destroy_internal
-# include_next <pthread_cond_destroy.c>
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_init.c =
b/sysdeps/unix/sysv/linux/hppa/pthread_cond_init.c
deleted file mode 100644
index ccb3de07ff..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_init.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Copyright (C) 2009-2017 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library.  If not, see
-   <http://www.gnu.org/licenses/>.  */
-
-#ifndef INCLUDED_SELF
-# define INCLUDED_SELF
-# include <pthread_cond_init.c>
-#else
-# include <pthread.h>
-# include <pthreadP.h>
-# include <internaltypes.h>
-# include <shlib-compat.h>
-int
-__pthread_cond_init (pthread_cond_t *cond, const pthread_condattr_t =
*cond_attr)
-{
-  cond_compat_clear (cond);
-  return __pthread_cond_init_internal (cond, cond_attr);
-}
-versioned_symbol (libpthread, __pthread_cond_init, pthread_cond_init,
-                  GLIBC_2_3_2);
-# undef versioned_symbol
-# define versioned_symbol(lib, local, symbol, version)
-# undef __pthread_cond_init
-# define __pthread_cond_init __pthread_cond_init_internal
-# include_next <pthread_cond_init.c>
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_signal.c =
b/sysdeps/unix/sysv/linux/hppa/pthread_cond_signal.c
deleted file mode 100644
index 2bf32af933..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_signal.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/* Copyright (C) 2009-2017 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library.  If not, see
-   <http://www.gnu.org/licenses/>.  */
-
-#ifndef INCLUDED_SELF
-# define INCLUDED_SELF
-# include <pthread_cond_signal.c>
-#else
-# include <pthread.h>
-# include <pthreadP.h>
-# include <internaltypes.h>
-# include <shlib-compat.h>
-int
-__pthread_cond_signal (pthread_cond_t *cond)
-{
-  cond_compat_check_and_clear (cond);
-  return __pthread_cond_signal_internal (cond);
-}
-versioned_symbol (libpthread, __pthread_cond_signal, =
pthread_cond_signal,
-                  GLIBC_2_3_2);
-# undef versioned_symbol
-# define versioned_symbol(lib, local, symbol, version)
-# undef __pthread_cond_signal
-# define __pthread_cond_signal __pthread_cond_signal_internal
-# include_next <pthread_cond_signal.c>
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c =
b/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
deleted file mode 100644
index 1cc2fc15d4..0000000000
--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
+++ /dev/null
@@ -1,53 +0,0 @@
-/* Copyright (C) 2009-2017 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library.  If not, see
-   <http://www.gnu.org/licenses/>.  */
-
-#ifndef INCLUDED_SELF
-# define INCLUDED_SELF
-# include <pthread_cond_wait.c>
-#else
-# include <pthread.h>
-# include <pthreadP.h>
-# include <internaltypes.h>
-# include <shlib-compat.h>
-int
-__pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)
-{
-  cond_compat_check_and_clear (cond);
-  return __pthread_cond_wait_internal (cond, mutex);
-}
-versioned_symbol (libpthread, __pthread_cond_wait, pthread_cond_wait,
-                  GLIBC_2_3_2);
-int
-__pthread_cond_timedwait (cond, mutex, abstime)
-     pthread_cond_t *cond;
-     pthread_mutex_t *mutex;
-     const struct timespec *abstime;
-{
-  cond_compat_check_and_clear (cond);
-  return __pthread_cond_timedwait_internal (cond, mutex, abstime);
-}
-versioned_symbol (libpthread, __pthread_cond_timedwait, =
pthread_cond_timedwait,
-                  GLIBC_2_3_2);
-# undef versioned_symbol
-# define versioned_symbol(lib, local, symbol, version)
-# undef __pthread_cond_wait
-# define __pthread_cond_wait __pthread_cond_wait_internal
-# undef __pthread_cond_timedwait
-# define __pthread_cond_timedwait __pthread_cond_timedwait_internal
-# include_next <pthread_cond_wait.c>
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/setcontext.S =
b/sysdeps/unix/sysv/linux/hppa/setcontext.S
index 3f4da7938f..92cb204f8d 100644
--- a/sysdeps/unix/sysv/linux/hppa/setcontext.S
+++ b/sysdeps/unix/sysv/linux/hppa/setcontext.S
@@ -26,8 +26,11 @@
 ENTRY(__setcontext)
 	/* Prologue */
 	stwm	%r3, 64(%sp)
+	.cfi_def_cfa_offset -64
+	.cfi_offset 3, 0
 #ifdef PIC
 	stw	%r19, -32(%sp)
+	.cfi_offset 19, 32
 #endif
=20
 	/* Save ucp.  */
@@ -141,7 +144,7 @@ ENTRY(__setcontext)
=20
 	/* No further context available. Exit now.  */
 	bl	HIDDEN_JUMPTARGET(exit), %r2
-	ldi	-1, %r26
+	ldi	0, %r26
=20
=20
 .Lerror:
diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h =
b/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
index 5ea297267f..8b7f2b2095 100644
--- a/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
+++ b/sysdeps/unix/sysv/linux/hppa/sysdep-cancel.h
@@ -62,12 +62,11 @@
 	ENTRY (__##syscall_name##_nocancel)				=
\
 	DOARGS_##args					ASM_LINE_SEP	=
\
 	stwm TREG, 64(%sp)				ASM_LINE_SEP	=
\
+	.cfi_def_cfa_offset -64				ASM_LINE_SEP	=
\
 	.cfi_offset TREG, 0				ASM_LINE_SEP	=
\
-	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	=
\
 	stw %sp, -4(%sp)				ASM_LINE_SEP	=
\
-	.cfi_offset 30, -4				ASM_LINE_SEP	=
\
 	stw %r19, -32(%sp)				ASM_LINE_SEP	=
\
-	.cfi_offset 19, -32				ASM_LINE_SEP	=
\
+	.cfi_offset 19, 32				ASM_LINE_SEP	=
\
 	/* Save r19 */					ASM_LINE_SEP	=
\
 	SAVE_PIC(TREG)					ASM_LINE_SEP	=
\
 	/* Do syscall, delay loads # */			ASM_LINE_SEP	=
\
@@ -91,21 +90,19 @@ L(pre_nc_end):						=
ASM_LINE_SEP	\
 	/* No need to LOAD_PIC */			ASM_LINE_SEP	=
\
 	/* Undo frame */				ASM_LINE_SEP	=
\
 	ldwm -64(%sp),TREG				ASM_LINE_SEP	=
\
-	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	=
\
 	/* Restore rp before exit */			ASM_LINE_SEP	=
\
 	ldw -20(%sp), %rp				ASM_LINE_SEP	=
\
-	.cfi_restore 2					ASM_LINE_SEP	=
\
 	ret						ASM_LINE_SEP	=
\
 	END(__##syscall_name##_nocancel)		ASM_LINE_SEP	=
\
 	/**********************************************/ASM_LINE_SEP	=
\
 	ENTRY (name)							=
\
 	DOARGS_##args					ASM_LINE_SEP	=
\
 	stwm TREG, 64(%sp)				ASM_LINE_SEP	=
\
-	.cfi_adjust_cfa_offset 64			ASM_LINE_SEP	=
\
+	.cfi_def_cfa_offset -64				ASM_LINE_SEP	=
\
+	.cfi_offset TREG, 0				ASM_LINE_SEP	=
\
 	stw %sp, -4(%sp)				ASM_LINE_SEP	=
\
-	.cfi_offset 30, -4				ASM_LINE_SEP	=
\
 	stw %r19, -32(%sp)				ASM_LINE_SEP	=
\
-	.cfi_offset 19, -32				ASM_LINE_SEP	=
\
+	.cfi_offset 19, 32				ASM_LINE_SEP	=
\
 	/* Done setting up frame, continue... */	ASM_LINE_SEP	=
\
 	SINGLE_THREAD_P					ASM_LINE_SEP	=
\
 	cmpib,<>,n 0,%ret0,L(pseudo_cancel)		ASM_LINE_SEP	=
\
@@ -168,40 +165,32 @@ L(pre_end):						=
ASM_LINE_SEP	\
 	/* No need to LOAD_PIC */			ASM_LINE_SEP	=
\
 	/* Undo frame */				ASM_LINE_SEP	=
\
 	ldwm -64(%sp),TREG				ASM_LINE_SEP	=
\
-	.cfi_adjust_cfa_offset -64			ASM_LINE_SEP	=
\
 	/* Restore rp before exit */			ASM_LINE_SEP	=
\
-	ldw -20(%sp), %rp				ASM_LINE_SEP	=
\
-	.cfi_restore 2					ASM_LINE_SEP
+	ldw -20(%sp), %rp				ASM_LINE_SEP
=20
 /* Save arguments into our frame */
 # define PUSHARGS_0	/* nothing to do */
 # define PUSHARGS_1	PUSHARGS_0 stw %r26, -36(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 26, -36			=
ASM_LINE_SEP
+			.cfi_offset 26, 28			=
ASM_LINE_SEP
 # define PUSHARGS_2	PUSHARGS_1 stw %r25, -40(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 25, -40			=
ASM_LINE_SEP
+			.cfi_offset 25, 24			=
ASM_LINE_SEP
 # define PUSHARGS_3	PUSHARGS_2 stw %r24, -44(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 24, -44			=
ASM_LINE_SEP
+			.cfi_offset 24, 20			=
ASM_LINE_SEP
 # define PUSHARGS_4	PUSHARGS_3 stw %r23, -48(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 23, -48			=
ASM_LINE_SEP
+			.cfi_offset 23, 16			=
ASM_LINE_SEP
 # define PUSHARGS_5	PUSHARGS_4 stw %r22, -52(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 22, -52			=
ASM_LINE_SEP
+			.cfi_offset 22, 12			=
ASM_LINE_SEP
 # define PUSHARGS_6	PUSHARGS_5 stw %r21, -56(%sr0,%sp)	=
ASM_LINE_SEP	\
-			.cfi_offset 21, -56			=
ASM_LINE_SEP
+			.cfi_offset 21, 8			=
ASM_LINE_SEP
=20
 /* Bring them back from the stack */
 # define POPARGS_0	/* nothing to do */
-# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	=
ASM_LINE_SEP	\
-			.cfi_restore 26				=
ASM_LINE_SEP
-# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	=
ASM_LINE_SEP	\
-			.cfi_restore 25				=
ASM_LINE_SEP
-# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	=
ASM_LINE_SEP	\
-			.cfi_restore 24				=
ASM_LINE_SEP
-# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	=
ASM_LINE_SEP	\
-			.cfi_restore 23				=
ASM_LINE_SEP
-# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	=
ASM_LINE_SEP	\
-			.cfi_restore 22				=
ASM_LINE_SEP
-# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	=
ASM_LINE_SEP	\
-			.cfi_restore 21				=
ASM_LINE_SEP
+# define POPARGS_1	POPARGS_0 ldw -36(%sr0,%sp), %r26	=
ASM_LINE_SEP
+# define POPARGS_2	POPARGS_1 ldw -40(%sr0,%sp), %r25	=
ASM_LINE_SEP
+# define POPARGS_3	POPARGS_2 ldw -44(%sr0,%sp), %r24	=
ASM_LINE_SEP
+# define POPARGS_4	POPARGS_3 ldw -48(%sr0,%sp), %r23	=
ASM_LINE_SEP
+# define POPARGS_5	POPARGS_4 ldw -52(%sr0,%sp), %r22	=
ASM_LINE_SEP
+# define POPARGS_6	POPARGS_5 ldw -56(%sr0,%sp), %r21	=
ASM_LINE_SEP
=20
 # if IS_IN (libpthread)
 #  ifdef PIC
diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h =
b/sysdeps/unix/sysv/linux/hppa/sysdep.h
index d8dd0431a4..c0cd59e9f5 100644
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
=20
 /* We do nothing with the return, except hand it back to someone else =
*/
 #undef  DO_CALL_NOERRNO

--Apple-Mail-37--481356122--
