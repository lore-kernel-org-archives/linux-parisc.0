Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta03ps.bigpond.com (mta03ps.bigpond.com [144.135.25.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B955482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 08:05:49 -0600 (MDT)
Received: from bubble.local ([144.135.25.69]) by
          mta03ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLM24A00.1SF for <parisc-linux@lists.parisc-linux.org>; Tue,
          23 Oct 2001 00:12:10 +1000
Date: Mon, 22 Oct 2001 23:35:34 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: parisc-linux@lists.parisc-linux.org, bcollins@debian.org,
	randolph@tausq.org, libc-alpha@sources.redhat.com
Message-ID: <20011022233534.X1037@bubble.sa.bigpond.net.au>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020170907.G1037@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Sat, Oct 20, 2001 at 05:09:07PM +0930
Subject: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 05:09:07PM +0930, Alan Modra wrote:
> 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> 	const function.  Do not use &_DYNAMIC as .got entries for global
> 	syms are no longer initialised.  Instead they rely on the reloc,
> 	which hasn't yet been applied.
> 	(elf_machine_load_address): Make it const.  Call
> 	elf_machine_dynamic as that function is called fropm rtld anyway.

The following, which includes the above patch, should allow glibc to
once again work on hppa-linux with current binutils.  A number of other
horrible things fixed:

a) ELF_MACHINE_PLTREL_OVERLAP defined.  This should have been defined
   right from the first hppa-linux glibc port.  Resulted in all the .plt
   relocs being processed twice, and meant that Jakub's optimisation
   with elf_machine_rel_relative didn't work.
b) It's true that hppa doesn't have an R_PARISC_RELATIVE reloc.  However,
   hppa-linux uses a scheme that gives the same benefits;  Normal relocs
   with a symbol index of zero.  Actually, this has an added benefit in
   that you can effectively have a "relative" IPLT reloc (Might be
   useful for prelinking).  I added code to binutils to tag these relocs
   as reloc_class_relative but didn't implement elf_machine_rela_relative,
   with the net result that many relocations weren't being applied.
c) .got section entries other than the reserved ones, are not longer
   read.
d) As for c) with lazy linking .plt entries.

glibc/ChangeLog
	* sysdeps/hppa/dl-fptr.h (_dl_lookup_address): Warning fix.
	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic): Make it a const
	function.  Do not use &_DYNAMIC as .got entries are no longer
	initialised since we are a rela target.
        (elf_machine_load_address): Make it const.  Call
        elf_machine_dynamic as that function is called fropm rtld anyway.
	(runtime_got): New function.
	(elf_machine_runtime_setup): Use runtime_got and modify code
	handling IPLT so that .plt section contents need not be read.
	(_start): Formatting fixes.
	(ELF_MACHINE_PLTREL_OVERLAP): Define.
	(TRAMPOLINE_TEMPLATE): Don't use multi-line string literals.
	(elf_machine_rela): Likewise.
	(elf_machine_rela_relative): Implement.  Add "map" param.
	* sysdeps/alpha/dl-machine.h (elf_machine_rela_relative): Add "map".
	* sysdeps/arm/dl-machine.h (elf_machine_rel_relative): Ditto.
	* sysdeps/cris/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/i386/dl-machine.h (elf_machine_rel_relative): Ditto.
	* sysdeps/ia64/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/m68k/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/mips/mips64/dl-machine.h (elf_machine_rel_relative): Ditto.
	* sysdeps/mips/dl-machine.h (elf_machine_rel_relative): Ditto.
	* sysdeps/powerpc/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/s390/s390-32/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/s390/s390-64/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/sh/dl-machine.h (elf_machine_rela_relative): Ditto.
	* sysdeps/sparc/sparc32/dl-machine.h (elf_machine_rela_relative): Ditto
	* sysdeps/sparc/sparc64/dl-machine.h (elf_machine_rela_relative): Ditto
	* sysdeps/x86_64/dl-machine.h (elf_machine_rela_relative): Ditto.
	* elf/do-rel.h (elf_dynamic_do_rel): Modify call to suit.

-- 
Alan Modra

diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/elf/do-rel.h glibc-2.2.4-3/elf/do-rel.h
--- glibc-2.2.4-3.orig/elf/do-rel.h	Mon Oct 22 14:15:44 2001
+++ glibc-2.2.4-3/elf/do-rel.h	Mon Oct 22 20:36:37 2001
@@ -86,7 +86,7 @@ elf_dynamic_do_rel (struct link_map *map
 # endif
 #endif
 	  for (; relative < r; ++relative)
-	    elf_machine_rel_relative (l_addr, relative,
+	    elf_machine_rel_relative (map, l_addr, relative,
 				      (void *) (l_addr + relative->r_offset));
 
       if (map->l_info[VERSYMIDX (DT_VERSYM)])
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/alpha/dl-machine.h glibc-2.2.4-3/sysdeps/alpha/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/alpha/dl-machine.h	Mon Oct 22 14:15:48 2001
+++ glibc-2.2.4-3/sysdeps/alpha/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -537,7 +537,8 @@ elf_machine_rela (struct link_map *map,
 }
 
 static inline void
-elf_machine_rela_relative (Elf64_Addr l_addr, const Elf64_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf64_Addr l_addr,
+			   const Elf64_Rela *reloc,
 			   Elf64_Addr *const reloc_addr)
 {
   /* XXX Make some timings.  Maybe it's preverable to test for
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/arm/dl-machine.h glibc-2.2.4-3/sysdeps/arm/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/arm/dl-machine.h	Mon Oct 22 14:15:48 2001
+++ glibc-2.2.4-3/sysdeps/arm/dl-machine.h	Mon Oct 22 12:22:09 2001
@@ -518,7 +518,8 @@ elf_machine_rel (struct link_map *map, c
 }
 
 static inline void
-elf_machine_rel_relative (Elf32_Addr l_addr, const Elf32_Rel *reloc,
+elf_machine_rel_relative (struct link_map *map, Elf32_Addr l_addr,
+			  const Elf32_Rel *reloc,
 			  Elf32_Addr *const reloc_addr)
 {
   *reloc_addr += l_addr;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/cris/dl-machine.h glibc-2.2.4-3/sysdeps/cris/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/cris/dl-machine.h	Mon Oct 22 14:15:48 2001
+++ glibc-2.2.4-3/sysdeps/cris/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -366,7 +366,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/hppa/dl-fptr.c glibc-2.2.4-3/sysdeps/hppa/dl-fptr.c
--- glibc-2.2.4-3.orig/sysdeps/hppa/dl-fptr.c	Mon Oct 22 14:22:23 2001
+++ glibc-2.2.4-3/sysdeps/hppa/dl-fptr.c	Mon Oct 22 14:04:04 2001
@@ -188,7 +188,8 @@ _dl_lookup_address (const void *address)
   Elf32_Addr addr = (Elf32_Addr) address;
   struct hppa_fptr *f;
 
-  address = (unsigned long)address &~ 3; /* Clear the bottom two bits.  See make_fptr. */
+ /* Clear the bottom two bits.  See make_fptr. */
+  address = (const void *) ((unsigned long) address &~ 3);
 
 #ifdef _LIBC_REENTRANT
   /* Make sure we are alone.  */
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/hppa/dl-machine.h glibc-2.2.4-3/sysdeps/hppa/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/hppa/dl-machine.h	Mon Oct 22 14:22:23 2001
+++ glibc-2.2.4-3/sysdeps/hppa/dl-machine.h	Mon Oct 22 22:16:09 2001
@@ -73,45 +73,59 @@ elf_machine_matches_host (const Elf32_Eh
   return ehdr->e_machine == EM_PARISC;
 }
 
+/* Return the run-time address of .got.  */
+static inline Elf32_Addr
+runtime_got (void) __attribute__ ((const));
+
+static inline Elf32_Addr
+runtime_got (void)
+{
+  Elf32_Addr got;
+
+  asm ("b,l	1f,%0\n"
+"	depi	0,31,2,%0\n"
+"1:	addil	L'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 8),%0\n"
+"	ldo	R'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 12)(%%r1),%0"
+       : "=r" (got) : : "r1");
+
+  return got;
+}
 
 /* Return the link-time address of _DYNAMIC.  */
 static inline Elf32_Addr
+elf_machine_dynamic (void) __attribute__ ((const));
+
+static inline Elf32_Addr
 elf_machine_dynamic (void)
 {
   Elf32_Addr dynamic;
 
-#if 0
-  /* Use this method if GOT address not yet set up.  */
-  asm (
-"	b,l	1f,%0\n"
+  asm ("b,l	1f,%0\n"
 "	depi	0,31,2,%0\n"
 "1:	addil	L'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 8),%0\n"
 "	ldw	R'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 12)(%%r1),%0\n"
-      : "=r" (dynamic) : : "r1");
-#else
-  /* This works because we already have our GOT address available.  */
-  dynamic = (Elf32_Addr) &_DYNAMIC;
-#endif
+       : "=r" (dynamic) : : "r1");
 
   return dynamic;
 }
 
 /* Return the run-time load address of the shared object.  */
 static inline Elf32_Addr
+elf_machine_load_address (void) __attribute__ ((const));
+
+static inline Elf32_Addr
 elf_machine_load_address (void)
 {
-  Elf32_Addr dynamic, dynamic_linkaddress;
+  Elf32_Addr dynamic;
 
   asm (
 "	b,l	1f,%0\n"
 "	depi	0,31,2,%0\n"
 "1:	addil	L'_DYNAMIC - ($PIC_pcrel$0 - 8),%0\n"
-"	ldo	R'_DYNAMIC - ($PIC_pcrel$0 - 12)(%%r1),%1\n"
-"	addil	L'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 16),%0\n"
-"	ldw	R'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 20)(%%r1),%0\n"
-   : "=r" (dynamic_linkaddress), "=r" (dynamic) : : "r1");
+"	ldo	R'_DYNAMIC - ($PIC_pcrel$0 - 12)(%%r1),%0\n"
+   : "=r" (dynamic) : : "r1");
 
-  return dynamic - dynamic_linkaddress;
+  return dynamic - elf_machine_dynamic ();
 }
 
 /* Fixup a PLT entry to bounce directly to the function at VALUE.  */
@@ -174,13 +188,6 @@ elf_machine_runtime_setup (struct link_m
 	      fptr = (struct hppa_fptr *) (reloc->r_offset + l_addr);
 	      if (r_sym != 0)
 		{
-		  /* Relocate the pointer to the stub.  */
-		  fptr->func += l_addr;
-		  /* Instead of the LTP value, we put the reloc offset
-		     here.  The trampoline code will load the proper
-		     LTP and pass the reloc offset to the fixup
-		     function.  */
-		  fptr->gp = iplt - jmprel;
 		  if (!got)
 		    {
 		      static union {
@@ -188,27 +195,22 @@ elf_machine_runtime_setup (struct link_m
 			Elf32_Addr i[2];
 		      } sig = {{0x00,0xc0,0xff,0xee, 0xde,0xad,0xbe,0xef}};
 
-		      /* Find our .got section.  It's right after the
-			 stub.  */
-		      got = (Elf32_Addr *) (fptr->func + GOT_FROM_PLT_STUB);
-
-		      /* Sanity check to see if the address we are
-                         going to check below is within a reasonable
-                         approximation of the bounds of the PLT (or,
-                         at least, is at an address that won't fault
-                         on read).  Then check for the magic signature
-                         above. */
-		      if (fptr->func < (Elf32_Addr) fptr + sizeof(*fptr))
-			  return 0;
-		      if (fptr->func >
-			  ((Elf32_Addr) fptr
-			   + SIZEOF_PLT_STUB
-			   + ((l->l_info[DT_PLTRELSZ]->d_un.d_val / sizeof (Elf32_Rela))
-			      * 8)))
-			return 0;
+		      got = (Elf32_Addr *) runtime_got ();
+
+		      /* The .got section is right after the .plt stub. 
+			 Check the magic signature.  */
 		      if (got[-2] != sig.i[0] || got[-1] != sig.i[1])
 			return 0; /* No lazy linking for you! */
 		    }
+
+		  /* Relocate the pointer to the stub.  */
+		  fptr->func = (Elf32_Addr) got - GOT_FROM_PLT_STUB;
+
+		  /* Instead of the LTP value, we put the reloc offset
+		     here.  The trampoline code will load the proper
+		     LTP and pass the reloc offset to the fixup
+		     function.  */
+		  fptr->gp = iplt - jmprel;
 		}
 	      else
 		{
@@ -278,22 +280,24 @@ asm (									\
 "	stw	%r25,-40(%sp)\n" /* argc */				\
 "	stw	%r24,-44(%sp)\n" /* argv */				\
 									\
-	/* We need the LTP, and we need it now. */			\
-	/* $PIC_pcrel$0 points 8 bytes past the current instruction,	\
-	   just like a branch reloc.  This sequence gets us the runtime	\
-	   address of _DYNAMIC. */					\
+	/* We need the LTP, and we need it now.				\
+	   $PIC_pcrel$0 points 8 bytes past the current instruction,	\
+	   just like a branch reloc.  This sequence gets us the		\
+	   runtime address of _DYNAMIC. */				\
 "	bl	0f,%r19\n"						\
 "	depi	0,31,2,%r19\n"	/* clear priviledge bits */		\
 "0:	addil	L'_DYNAMIC - ($PIC_pcrel$0 - 8),%r19\n"			\
 "	ldo	R'_DYNAMIC - ($PIC_pcrel$0 - 12)(%r1),%r26\n"		\
 									\
-	/* Also get the link time address from the first entry of the GOT.  */ \
+	/* The link time address is stored in the first entry of the	\
+	   GOT.  */							\
 "	addil	L'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 16),%r19\n"	\
 "	ldw	R'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 20)(%r1),%r20\n" \
 									\
 "	sub	%r26,%r20,%r20\n"	/* Calculate load offset */	\
 									\
-	/* Rummage through the dynamic entries, looking for DT_PLTGOT.  */ \
+	/* Rummage through the dynamic entries, looking for		\
+	   DT_PLTGOT.  */						\
 "	ldw,ma	8(%r26),%r19\n"						\
 "1:	cmpib,=,n 3,%r19,2f\n"	/* tag == DT_PLTGOT? */			\
 "	cmpib,<>,n 0,%r19,1b\n"						\
@@ -313,8 +317,8 @@ asm (									\
 	   |         32 bytes of magic       |				\
 	   |---------------------------------|				\
 	   | 32 bytes argument/sp save area  |				\
-	   |---------------------------------|  ((current->mm->env_end) + 63 & ~63) \
-	   |         N bytes of slack        |				\
+	   |---------------------------------|  ((current->mm->env_end)	\
+	   |         N bytes of slack        |	 + 63 & ~63)		\
 	   |---------------------------------|				\
 	   |      envvar and arg strings     |				\
 	   |---------------------------------|				\
@@ -382,7 +386,7 @@ asm (									\
 "	bl	_dl_init,%r2\n"						\
 "	ldo	4(%r23),%r23\n"	/* delay slot */			\
 									\
-	/* Reload argc, argv  to the registers start.S expects them in (feh) */ \
+	/* Reload argc, argv to the registers start.S expects.  */	\
 "	ldw	-40(%sp),%r25\n"					\
 "	ldw	-44(%sp),%r24\n"					\
 									\
@@ -394,8 +398,8 @@ asm (									\
 "	.word	0xdeadbeef\n"						\
 "	.previous\n"							\
 									\
-	/* %r3 contains a function pointer, we need to mask out the lower \
-	 * bits and load the gp and jump address. */			\
+	/* %r3 contains a function pointer, we need to mask out the	\
+	   lower bits and load the gp and jump address. */		\
 "	depi	0,31,2,%r3\n"						\
 "	ldw	0(%r3),%r2\n"						\
 "	addil	LT'__dl_fini_plabel,%r19\n"				\
@@ -413,42 +417,40 @@ asm (									\
    Enter with r19 = reloc offset, r20 = got-8, r21 = fixup ltp.  */
 #define TRAMPOLINE_TEMPLATE(tramp_name, fixup_name) \
   extern void tramp_name (void);		    \
-  asm ( "\
-	/* Trampoline for " #tramp_name " */
-	.globl " #tramp_name "
-	.type " #tramp_name ",@function
-" #tramp_name ":
-	/* Save return pointer */
-	stw	%r2,-20(%sp)
-	/* Save argument registers in the call stack frame. */
-	stw	%r26,-36(%sp)
-	stw	%r25,-40(%sp)
-	stw	%r24,-44(%sp)
-	stw	%r23,-48(%sp)
-	/* Build a call frame. */
-	stwm	%sp,64(%sp)
-
-	/* Set up args to fixup func.  */
-	ldw	8+4(%r20),%r26	/* got[1] == struct link_map *  */
-	copy	%r19,%r25	/* reloc offset  */
-
-	/* Call the real address resolver. */
-	bl	" #fixup_name ",%r2
-	copy	%r21,%r19	/* delay slot, set fixup func ltp */
-
-	ldwm	-64(%sp),%sp
-	/* Arguments. */
-	ldw	-36(%sp),%r26
-	ldw	-40(%sp),%r25
-	ldw	-44(%sp),%r24
-	ldw	-48(%sp),%r23
-	/* Return pointer. */
-	ldw	-20(%sp),%r2
-	/* Call the real function. */
-	ldw	0(%r28),%r22
-	bv	%r0(%r22)
-	ldw	4(%r28),%r19
-");
+  asm (".globl " #tramp_name "\n"					\
+"	.type " #tramp_name ",@function\n"				\
+ #tramp_name ":\n"							\
+	/* Save return pointer */					\
+"	stw	%r2,-20(%sp)\n"						\
+	/* Save argument registers in the call stack frame. */		\
+"	stw	%r26,-36(%sp)\n"					\
+"	stw	%r25,-40(%sp)\n"					\
+"	stw	%r24,-44(%sp)\n"					\
+"	stw	%r23,-48(%sp)\n"					\
+	/* Build a call frame. */					\
+"	stwm	%sp,64(%sp)\n"						\
+									\
+	/* Set up args to fixup func.  */				\
+"	ldw	8+4(%r20),%r26\n" /* got[1] == struct link_map *  */	\
+"	copy	%r19,%r25\n"	  /* reloc offset  */			\
+									\
+	/* Call the real address resolver. */				\
+"	bl	" #fixup_name ",%r2\n"					\
+"	copy	%r21,%r19\n"	  /* delay slot, set fixup func ltp */	\
+									\
+"	ldwm	-64(%sp),%sp\n"						\
+	/* Arguments. */						\
+"	ldw	-36(%sp),%r26\n"					\
+"	ldw	-40(%sp),%r25\n"					\
+"	ldw	-44(%sp),%r24\n"					\
+"	ldw	-48(%sp),%r23\n"					\
+	/* Return pointer. */						\
+"	ldw	-20(%sp),%r2\n"						\
+	/* Call the real function. */					\
+"	ldw	0(%r28),%r22\n"						\
+"	bv	%r0(%r22)\n"						\
+"	ldw	4(%r28),%r19\n"						\
+       );
 
 #ifndef PROF
 #define ELF_MACHINE_RUNTIME_TRAMPOLINE			\
@@ -476,6 +478,9 @@ asm (									\
 /* We only use RELA. */
 #define ELF_MACHINE_NO_REL 1
 
+/* DT_RELASZ includes .rela.plt  */
+#define ELF_MACHINE_PLTREL_OVERLAP 1
+
 /* Return the address of the entry point. */
 #define ELF_MACHINE_START_ADDRESS(map, start) \
   DL_FUNCTION_ADDRESS (map, start)
@@ -538,7 +543,7 @@ elf_machine_rela (struct link_map *map, 
 	return;
 #endif
       /* .eh_frame can have unaligned relocs.  */
-      if ((unsigned long)reloc_addr & 3)
+      if ((unsigned long) reloc_addr & 3)
 	{
 	  char *rel_addr = (char *) reloc_addr;
 	  rel_addr[0] = value >> 24;
@@ -574,14 +579,14 @@ elf_machine_rela (struct link_map *map, 
 	   probably haven't relocated the necessary values by this
 	   point so we have to find them ourselves. */
 
-	asm ("bl	0f,%0
-	      depi	0,31,2,%0
-0:	      addil	L'__boot_ldso_fptr - ($PIC_pcrel$0 - 8),%0
-	      ldo	R'__boot_ldso_fptr - ($PIC_pcrel$0 - 12)(%%r1),%1
-	      addil	L'__fptr_root - ($PIC_pcrel$0 - 16),%0
-	      ldo	R'__fptr_root - ($PIC_pcrel$0 - 20)(%%r1),%2
-	      addil	L'__fptr_count - ($PIC_pcrel$0 - 24),%0
-	      ldo	R'__fptr_count - ($PIC_pcrel$0 - 28)(%%r1),%3"
+	asm ("bl	0f,%0\n\t"
+	     "depi	0,31,2,%0\n\t"
+	     "0:\taddil	L'__boot_ldso_fptr - ($PIC_pcrel$0 - 8),%0\n\t"
+	     "ldo	R'__boot_ldso_fptr - ($PIC_pcrel$0 - 12)(%%r1),%1\n\t"
+	     "addil	L'__fptr_root - ($PIC_pcrel$0 - 16),%0\n\t"
+	     "ldo	R'__fptr_root - ($PIC_pcrel$0 - 20)(%%r1),%2\n\t"
+	     "addil	L'__fptr_count - ($PIC_pcrel$0 - 24),%0\n\t"
+	     "ldo	R'__fptr_count - ($PIC_pcrel$0 - 28)(%%r1),%3"
 	     :
 	     "=r" (dot),
 	     "=r" (p_boot_ldso_fptr),
@@ -635,11 +640,51 @@ elf_machine_rela (struct link_map *map, 
   *reloc_addr = value;
 }
 
+/* hppa doesn't have an R_PARISC_RELATIVE reloc, but uses relocs with
+   ELF32_R_SYM (info) == 0 for a similar purpose.  */
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
-  /* XXX Nothing to do.  There is no relative relocation, right?  */
+  unsigned long const r_type = ELF32_R_TYPE (reloc->r_info);
+  Elf32_Addr value;
+
+  value = l_addr + reloc->r_addend;
+
+  if (ELF32_R_SYM (reloc->r_info) != 0)
+    asm volatile ("iitlbp	%r0,(%r0)");  /* Crash. */
+
+  switch (r_type)
+    {
+    case R_PARISC_DIR32:
+      /* .eh_frame can have unaligned relocs.  */
+      if ((unsigned long) reloc_addr & 3)
+	{
+	  char *rel_addr = (char *) reloc_addr;
+	  rel_addr[0] = value >> 24;
+	  rel_addr[1] = value >> 16;
+	  rel_addr[2] = value >> 8;
+	  rel_addr[3] = value;
+	  return;
+	}
+      break;
+
+    case R_PARISC_PLABEL32:
+      break;
+
+    case R_PARISC_IPLT:
+      elf_machine_fixup_plt (NULL, map, reloc, reloc_addr, value);
+      return;
+
+    case R_PARISC_NONE:
+      return;
+
+    default:
+      _dl_reloc_bad_type (map, r_type, 0);
+    }
+
+  *reloc_addr = value;
 }
 
 static inline void
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/i386/dl-machine.h glibc-2.2.4-3/sysdeps/i386/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/i386/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/i386/dl-machine.h	Mon Oct 22 12:22:09 2001
@@ -379,7 +379,8 @@ elf_machine_rel (struct link_map *map, c
 }
 
 static inline void
-elf_machine_rel_relative (Elf32_Addr l_addr, const Elf32_Rel *reloc,
+elf_machine_rel_relative (struct link_map *map, Elf32_Addr l_addr,
+			  const Elf32_Rel *reloc,
 			  Elf32_Addr *const reloc_addr)
 {
   assert (ELF32_R_TYPE (reloc->r_info) == R_386_RELATIVE);
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/ia64/dl-machine.h glibc-2.2.4-3/sysdeps/ia64/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/ia64/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/ia64/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -580,7 +580,8 @@ elf_machine_rela (struct link_map *map,
 }
 
 static inline void
-elf_machine_rela_relative (Elf64_Addr l_addr, const Elf64_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf64_Addr l_addr,
+			   const Elf64_Rela *reloc,
 			   Elf64_Addr *const reloc_addr)
 {
   /* ??? Ignore MSB and Instruction format for now.  */
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/m68k/dl-machine.h glibc-2.2.4-3/sysdeps/m68k/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/m68k/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/m68k/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -299,7 +299,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/mips/dl-machine.h glibc-2.2.4-3/sysdeps/mips/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/mips/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/mips/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -535,7 +535,8 @@ elf_machine_rel (struct link_map *map, c
 }
 
 static inline void
-elf_machine_rel_relative (ElfW(Addr) l_addr, const ElfW(Rel) *reloc,
+elf_machine_rel_relative (struct link_map *map, ElfW(Addr) l_addr,
+			  const ElfW(Rel) *reloc,
 			  ElfW(Addr) *const reloc_addr)
 {
   /* XXX Nothing to do.  There is no relative relocation, right?  */
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/mips/mips64/dl-machine.h glibc-2.2.4-3/sysdeps/mips/mips64/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/mips/mips64/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/mips/mips64/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -576,7 +576,8 @@ elf_machine_rel (struct link_map *map, c
 }
 
 static inline void
-elf_machine_rel_relative (ElfW(Addr) l_addr, const ElfW(Rel) *reloc,
+elf_machine_rel_relative (struct link_map *map, ElfW(Addr) l_addr,
+			  const ElfW(Rel) *reloc,
 			  ElfW(Addr) *const reloc_addr)
 {
   /* XXX Nothing to do.  There is no relative relocation, right?  */
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/powerpc/dl-machine.h glibc-2.2.4-3/sysdeps/powerpc/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/powerpc/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/powerpc/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -394,7 +394,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/s390/s390-32/dl-machine.h glibc-2.2.4-3/sysdeps/s390/s390-32/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/s390/s390-32/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/s390/s390-32/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -440,7 +440,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/s390/s390-64/dl-machine.h glibc-2.2.4-3/sysdeps/s390/s390-64/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/s390/s390-64/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/s390/s390-64/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -420,7 +420,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf64_Addr l_addr, const Elf64_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf64_Addr l_addr,
+			   const Elf64_Rela *reloc,
 			   Elf64_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/sh/dl-machine.h glibc-2.2.4-3/sysdeps/sh/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/sh/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/sh/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -558,7 +558,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   Elf32_Addr value;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/sparc/sparc32/dl-machine.h glibc-2.2.4-3/sysdeps/sparc/sparc32/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/sparc/sparc32/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/sparc/sparc32/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -461,7 +461,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf32_Addr l_addr, const Elf32_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
+			   const Elf32_Rela *reloc,
 			   Elf32_Addr *const reloc_addr)
 {
   *reloc_addr += l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/sparc/sparc64/dl-machine.h glibc-2.2.4-3/sysdeps/sparc/sparc64/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/sparc/sparc64/dl-machine.h	Mon Oct 22 14:15:49 2001
+++ glibc-2.2.4-3/sysdeps/sparc/sparc64/dl-machine.h	Mon Oct 22 12:18:30 2001
@@ -370,7 +370,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf64_Addr l_addr, const Elf64_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf64_Addr l_addr,
+			   const Elf64_Rela *reloc,
 			   Elf64_Addr *const reloc_addr)
 {
   *reloc_addr = l_addr + reloc->r_addend;
diff -urpN -x*~ -xTAGS -xdebian glibc-2.2.4-3.orig/sysdeps/x86_64/dl-machine.h glibc-2.2.4-3/sysdeps/x86_64/dl-machine.h
--- glibc-2.2.4-3.orig/sysdeps/x86_64/dl-machine.h	Mon Oct 22 14:15:50 2001
+++ glibc-2.2.4-3/sysdeps/x86_64/dl-machine.h	Mon Oct 22 12:22:09 2001
@@ -393,7 +393,8 @@ elf_machine_rela (struct link_map *map, 
 }
 
 static inline void
-elf_machine_rela_relative (Elf64_Addr l_addr, const Elf64_Rela *reloc,
+elf_machine_rela_relative (struct link_map *map, Elf64_Addr l_addr,
+			   const Elf64_Rela *reloc,
 			   Elf64_Addr *const reloc_addr)
 {
   assert (ELF64_R_TYPE (reloc->r_info) == R_X86_64_RELATIVE);
