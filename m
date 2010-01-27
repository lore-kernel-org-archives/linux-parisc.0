From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Segmentation fault in __libc_start_main with -static
Date: Wed, 27 Jan 2010 12:06:24 -0500 (EST)
Message-ID: <20100127170625.0E6F54EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In trying to debug a new gcc testsuite failure, I tried to link the
application with -static to simplify debugging.  It turns out we have
a couple of problems in linking threaded applications with -static.

The first problem is the linker does change r19 to dp for various TLS
relocations using the global pointer.  I've attached a patch below
to which I think fixes this problem.

The second issue is the handling of the symbol __nptl_threads.
We get a segmentation fault at startup here:

0x000223bc <__libc_start_main+600>:     addil L%0,r0,r1
0x000223c0 <__libc_start_main+604>:     ldo 0(r1),r3
0x000223c4 <__libc_start_main+608>:     ldw 0(r3),rp

The relocations are:

00000258 R_PARISC_DPREL21L  __nptl_nthreads
0000025c R_PARISC_DPREL14R  __nptl_nthreads

The original code:

 258:   2b 60 00 00     addil L%0,dp,r1
 25c:   34 23 00 00     ldo 0(r1),r3
 260:   0c 60 10 82     ldw 0(r3),rp

__nptl_nthreads is undefined weak:

         w __nptl_nthreads

The original code gets munged in elf32-hppa.c:

    /* For all the DP relative relocations, we need to examine the symbol's
       section.  If it has no section or if it's a code section, then
       "data pointer relative" makes no sense.  In that case we don't
       adjust the "value", and for 21 bit addil instructions, we change the
       source addend register from %dp to %r0.  This situation commonly
       arises for undefined weak symbols and when a variable's "constness"
       is declared differently from the way the variable is defined.  For
       instance: "extern int foo" with foo defined as "const int foo".  */
      if (sym_sec == NULL || (sym_sec->flags & SEC_CODE) != 0)
	{
	  if ((insn & ((0x3f << 26) | (0x1f << 21)))
	      == (((int) OP_ADDIL << 26) | (27 << 21)))
	    {
	      insn &= ~ (0x1f << 21);
	    }
	  /* Now try to make things easy for the dynamic linker.  */

	  break;
        }

We either need to define __nptl_nthreads or check if its address is
NULL.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.169
diff -u -3 -p -r1.169 elf32-hppa.c
--- elf32-hppa.c	8 Nov 2009 20:47:24 -0000	1.169
+++ elf32-hppa.c	26 Jan 2010 02:52:02 -0000
@@ -3388,12 +3388,19 @@ final_link_relocate (asection *input_sec
     case R_PARISC_DPREL21L:
     case R_PARISC_DPREL14R:
     case R_PARISC_DPREL14F:
+    case R_PARISC_TLS_GD21L:
+    case R_PARISC_TLS_LDM21L:
+    case R_PARISC_TLS_IE21L:
       /* Convert instructions that use the linkage table pointer (r19) to
 	 instructions that use the global data pointer (dp).  This is the
 	 most efficient way of using PIC code in an incomplete executable,
 	 but the user must follow the standard runtime conventions for
 	 accessing data for this to work.  */
-      if (orig_r_type == R_PARISC_DLTIND21L)
+      if (orig_r_type == R_PARISC_DLTIND21L
+	  || (!info->shared
+	      && (r_type == R_PARISC_TLS_GD21L
+		  || r_type == R_PARISC_TLS_LDM21L
+		  || r_type == R_PARISC_TLS_IE21L)))
 	{
 	  /* Convert addil instructions if the original reloc was a
 	     DLTIND21L.  GCC sometimes uses a register other than r19 for
@@ -3444,11 +3451,8 @@ final_link_relocate (asection *input_sec
     case R_PARISC_DLTIND21L:
     case R_PARISC_DLTIND14R:
     case R_PARISC_DLTIND14F:
-    case R_PARISC_TLS_GD21L:
     case R_PARISC_TLS_GD14R:
-    case R_PARISC_TLS_LDM21L:
     case R_PARISC_TLS_LDM14R:
-    case R_PARISC_TLS_IE21L:
     case R_PARISC_TLS_IE14R:
       value -= elf_gp (input_section->output_section->owner);
       break;
