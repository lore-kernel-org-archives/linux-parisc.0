Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id E38CC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Apr 2001 05:15:52 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 66A79B008; Fri,  6 Apr 2001 12:15:12 +0100 (BST)
Date: Fri, 6 Apr 2001 12:15:12 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Cc: pjlahaie@linuxcare.com
Message-ID: <20010406121512.T9198@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] modutils fixes
List-ID: <linux-parisc.vger.kernel.org>

Hi, this is a diff against modutils 2.4.5 to fix two problems:

1.  On 32 bit kernels modutils used data_start to find the kernels
dp value, but it should have really used $global$.  Didn't used to
matter as they were the same, but not anymore.

2.  On 64 bit kernels modutils uses a different stub to call millicode
functions, which used to assume dp held the modules local value.
That wasn't a valid assumption, so I've reworked the stub such that
it doesn't use dp.

I won't rush to send this upstream as the maintainer is on holiday.

Kernel changes have been made recently relating to module support
(export $global$, set up dp for kernel threads in a module), so
make sure you are up to date there if you want to use modules.

There are also a bunch more symbols needed in parisc_ksyms.c, depending
on what you want to modularise, but I'm holding off on commiting
those as Paul has similar local changes and I don't want to make
life more complicated for him.

Richard


diff -ur -x *.o modutils-2.4.5-clean/ChangeLog modutils-2.4.5/ChangeLog
--- modutils-2.4.5-clean/ChangeLog	Wed Mar 28 11:49:06 2001
+++ modutils-2.4.5/ChangeLog	Fri Apr  6 11:30:00 2001
@@ -1,3 +1,6 @@
+	* hppa dp is $global$, not data_start.  Richard Hirst.
+	* hppa64 stub for millicode calls must not use dp.  Richard Hirst.
+
 2001-03-29  Keith Owens  <kaos@ocs.com.au>
 
 	modutils 2.4.5
diff -ur -x *.o modutils-2.4.5-clean/obj/obj_hppa.c modutils-2.4.5/obj/obj_hppa.c
--- modutils-2.4.5-clean/obj/obj_hppa.c	Wed Mar 28 11:49:06 2001
+++ modutils-2.4.5/obj/obj_hppa.c	Wed Apr  4 14:04:48 2001
@@ -383,7 +383,7 @@
    This is significantly less complex than what we do for shared
    libraries because, obviously, modules are not shared.  Also we have
    no issues related to symbol visibility, lazy linking, etc.
-   The kernels dp is fixed (at symbol data_start), and we can fix up any
+   The kernels dp is fixed (at symbol $global$), and we can fix up any
    DPREL refs in the module to use that same dp value.
    All PCREL17F refs result in a stub with the following format:
 
@@ -658,13 +658,13 @@
   int i;
   hppa_file_t *hfile = (hppa_file_t *)f;
 
-  /* Initialise dp to the kernels dp (symbol data_start)
+  /* Initialise dp to the kernels dp (symbol $global$)
    */
   for (i = 0, s = ksyms; i < nksyms; i++, s++)
-    if (!strcmp((char *)s->name, "data_start"))
+    if (!strcmp((char *)s->name, "$global$"))
       break;
   if (i >= nksyms) {
-    error("Cannot initialise dp, 'data_start' not found\n");
+    error("Cannot initialise dp, '$global$' not found\n");
     return 1;
   }
   hfile->dp = s->value;
diff -ur -x *.o modutils-2.4.5-clean/obj/obj_hppa64.c modutils-2.4.5/obj/obj_hppa64.c
--- modutils-2.4.5-clean/obj/obj_hppa64.c	Wed Mar 28 11:49:06 2001
+++ modutils-2.4.5/obj/obj_hppa64.c	Fri Apr  6 11:31:16 2001
@@ -94,15 +94,15 @@
  *     e8 20 d0 00     bve (r1)
  *     53 7b 00 30     ldd 18(dp),dp
  *
- * We need a different stub for millicode calls, which doesn't screw
- * dp:
+ * We need a different stub for millicode calls, which doesn't depend on
+ * or modify dp:
  *
- *     53 61 00 00     ldd 0(dp),r1
- *     			R_PARISC_LTOFF14R <.got entry offset from dp>
+ *     20 20 00 00     ldil 0,r1
+ *			R_PARISC_DIR21L <addr of kernels opd entry>
+ *     34 21 00 00     ldo 0(r1),r1
+ *			R_PARISC_DIR14R <addr of kernels opd entry>
  *     50 21 00 20     ldd 10(r1),r1
- *     e8 20 d0 00     bve (r1)
- *     08 00 02 40     nop
- *
+ *     e8 20 d0 02     bve,n (r1)
  */
 
 /* NOTE: to keep the code cleaner we make all stubs the same size.
@@ -120,10 +120,10 @@
 
 unsigned char hppa64_stub_millicode[] =
 {
-       0x53, 0x61, 0x00, 0x00,
+       0x20, 0x20, 0x00, 0x00,
+       0x34, 0x21, 0x00, 0x00,
        0x50, 0x21, 0x00, 0x20,
-       0xe8, 0x20, 0xd0, 0x00,
-       0x08, 0x00, 0x02, 0x40,
+       0xe8, 0x20, 0xd0, 0x02,
 };
 
 /*======================================================================*/
@@ -575,15 +575,23 @@
 		     */
 		    unsigned char *stub;
 
-		    if (!strncmp(isym->root.name, "$$", 2))
+		    if (!strncmp(isym->root.name, "$$", 2)) {
 			stub = hppa64_stub_millicode;
-		    else
+			memcpy((Elf64_Addr *)(hfile->stub->contents + se->offset),
+					stub, SIZEOF_STUB);
+			v = (Elf64_Addr)isym->root.value;
+			ret = patch_21l(v, (Elf64_Word *)(hfile->stub->contents + se->offset));
+			if (ret == obj_reloc_ok)
+			    ret = patch_14r(v, (Elf64_Word *)(hfile->stub->contents + se->offset + 4));
+		    }
+		    else {
 			stub = hppa64_stub_extern;
+			memcpy((Elf64_Addr *)(hfile->stub->contents + se->offset),
+					stub, SIZEOF_STUB);
+			v = (Elf64_Addr)(hfile->got->header.sh_addr + ge->offset) - gp;
+			ret = patch_14r2(v, (Elf64_Word *)(hfile->stub->contents + se->offset));
+		    }
 		    se->reloc_done = TRUE;
-		    memcpy((Elf64_Addr *)(hfile->stub->contents + se->offset),
-	    			stub, SIZEOF_STUB);
-		    v = (Elf64_Addr)(hfile->got->header.sh_addr + ge->offset) - gp;
-		    ret = patch_14r2(v, (Elf64_Word *)(hfile->stub->contents + se->offset));
 		}
 		v = hfile->stub->header.sh_addr + se->offset;
 	    }
