Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin8.bigpond.com (unknown [139.134.6.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04863482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 01:39:17 -0600 (MDT)
Received: from bubble.local ([144.135.24.69]) by
          mailin8.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLHUW600.B83 for <parisc-linux@lists.parisc-linux.org>; Sat,
          20 Oct 2001 17:45:42 +1000
Date: Sat, 20 Oct 2001 17:09:07 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: parisc-linux@lists.parisc-linux.org
Cc: bcollins@debian.org, randolph@tausq.org,
	libc-alpha@sources.redhat.com
Message-ID: <20011020170907.G1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Fix for hppa-linux ld.so with newer binutils
List-ID: <linux-parisc.vger.kernel.org>

Newer binutils don't initialise .got entries for global syms, so the
scheme used by sysdeps/hppa/dl-machine.h:elf_machine_dynamic to find
the address of .dynamic no longer works.

ChangeLog
	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
	const function.  Do not use &_DYNAMIC as .got entries for global
	syms are no longer initialised.  Instead they rely on the reloc,
	which hasn't yet been applied.
	(elf_machine_load_address): Make it const.  Call
	elf_machine_dynamic as that function is called fropm rtld anyway.

-- 
Alan Modra
 
Index: sysdeps/hppa/dl-machine.h
===================================================================
RCS file: /home/cvs/parisc/glibc/sysdeps/hppa/dl-machine.h,v
retrieving revision 1.41
diff -u -p -r1.41 dl-machine.h
--- dl-machine.h	2001/06/08 00:19:01	1.41
+++ dl-machine.h	2001/10/20 07:20:27
@@ -76,42 +76,40 @@ elf_machine_matches_host (const Elf32_Eh
 
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
   asm (
 "	b,l	1f,%0\n"
 "	depi	0,31,2,%0\n"
 "1:	addil	L'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 8),%0\n"
 "	ldw	R'_GLOBAL_OFFSET_TABLE_ - ($PIC_pcrel$0 - 12)(%%r1),%0\n"
       : "=r" (dynamic) : : "r1");
-#else
-  /* This works because we already have our GOT address available.  */
-  dynamic = (Elf32_Addr) &_DYNAMIC;
-#endif
 
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
