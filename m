Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA32228
	for <parisc-linux@puffin.external.hp.com>; Mon, 23 Oct 2000 23:02:22 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 05:03:48 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA04366;
	Tue, 24 Oct 2000 16:02:19 +1100
Date: Tue, 24 Oct 2000 16:02:19 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: Bug in shared libraries
In-Reply-To: <8766mn1qv0.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0010241541510.11525-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 20 Oct 2000, David Huggins-Daines wrote:

> John Marvin <jsm@udlkern.fc.hp.com> writes:
> 
> > Here is a partial dump from ld-2.1.94.so. The instruction at offset 3c60
> > below, "stw r6,0(r7)", is the first faulting instruction that is attempting
> > to write into its own .rodata section. Once this is fixed, there may
> > be others.
> 
> Yes, I know what this is now.  The problem is that the compiler places
> static PLABELs in .rodata instead of .data.  This doesn't cause any
> problems for static executables since all the relocations on these
> PLABELs will be resolved in the final link.  However when building
> shared objects they will get emitted as dynamic relocations.
> 
> That's actually not supposed to make the dynamic linker crash though,
> because the linker will set a flag (and create a dynamic tag) to
> indicate that the read-only segments in the object should be remapped
> read-write during relocation processing.
> 
> I wonder if the problem is actually that the call to mprotect() that
> ld.so makes in order to remap its text segment read-write is failing,
> or not having the desired effect.

The problem occurs when ld.so is relocating itself, ie. during
ELF_DYNAMIC_RELOCATE (&bootstrap_map, 0, 0).  I looked at fixing the
dynamic linker, but it's a complete pain to do as a lot of things aren't
set up at bootstrap stage.  _Much_ easier to fix the compiler as per the
following diff.  I've tested this on hppa-linux, and a newly built glibc
has no .rela.rodata in ld.so or libc.so.

Alan
-- 
Linuxcare.  Support for the Revolution.


Index: gcc/config/pa/pa-linux.h
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa-linux.h,v
retrieving revision 1.12
diff -u -p -r1.12 pa-linux.h
--- pa-linux.h	2000/10/11 20:38:49	1.12
+++ pa-linux.h	2000/10/24 04:51:08
@@ -146,6 +146,13 @@ while (0)
   else                                                          \
     fprintf (FILE, "\tb .L%d\n\tnop\n", VALUE)
 
+#undef SELECT_RTX_SECTION
+#define SELECT_RTX_SECTION(MODE,RTX)	\
+  if (flag_pic && function_label_operand (RTX, MODE))	\
+    data_section ();					\
+  else							\
+    readonly_data_section ();
+
 /* FIXME: The Linux/parisc gas does not enjoy labels without colons.
    We haven't really decided on all the details of our assembly
    dialect, and the ELF and Linux configuration we 'mix in' here does
Index: gcc/config/pa/pa-linux64.h
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa-linux64.h,v
retrieving revision 1.4
diff -u -p -r1.4 pa-linux64.h
--- pa-linux64.h	2000/10/11 20:38:49	1.4
+++ pa-linux64.h	2000/10/24 04:51:08
@@ -213,6 +213,13 @@ do {  \
 #undef STATIC_CHAIN_REGNUM
 #define STATIC_CHAIN_REGNUM 31
 
+#undef SELECT_RTX_SECTION
+#define SELECT_RTX_SECTION(MODE,RTX)	\
+  if (flag_pic && function_label_operand (RTX, MODE))	\
+    data_section ();					\
+  else							\
+    readonly_data_section ();
+
 /* This is not needed for correct operation in 32bit mode, and since
    older versions of gas and the hpux assembler do not accept .dword
    we put this here instead of the more logical location, pa.h.  */
