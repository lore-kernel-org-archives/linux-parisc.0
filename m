Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA14679
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 14:15:17 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 20:15:03 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008190020150.9244-100000@front.linuxcare.com.au> <8766oy1nxa.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Aug 2000 16:14:27 -0400
In-Reply-To: David Huggins-Daines's message of "18 Aug 2000 13:25:53 -0400"
Message-ID: <87vgwyz5r0.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Alan Modra <alan@linuxcare.com.au> writes:
> > A bit of head-scratching, a couple of added functions, and the linker now
> > detects PIC functions and handles them appropriately.
> 
> Sorry to burst your bubble but this doesn't work in the real world,
> where "real world" is defined as 'hppa-linux-gcc -o hello hello.c'

Actually it wasn't so bad after all.  Here's a patch that fixes the
case of statically linked binaries, though I'm reluctant to check it
in because I'm not quite sure the logic is 100% correct; without
removing the check for defined weak symbols, we end up generating a
*lot* of useless import stubs when linking with a static libc, but
this might not be the right way to avoid this.

It's not fixed in the case of dynamically linked binaries that are
statically linked with PIC (which is basically all dynamically linked
binaries since libgcc.a is linked statically).  It might make sense to
unify the generation of import stubs and PLT slots for all PIC symbols
whether they are linked statically or dynamically, but I don't know if
I want to attempt that myself :-)

Oh, also, I've been bad about ChangeLog entries lately, sorry - should
I retroactively create some for the recent checkins I've made?

2000-08-18  David Huggins-Daines  <dhd@linuxcare.com>

	* elf32-hppa.c (final_link_relocate): Call an import stub in
          the case of statically linked PIC symbols.
          (hppa_handle_PIC_calls): Don't try to handle undefined weak
          symbols at all, and don't create import stubs for locally
          defined weak symbols unless they are PIC.

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/bfd/elf32-hppa.c,v
retrieving revision 1.22
diff -u -r1.22 elf32-hppa.c
--- elf32-hppa.c	2000/08/18 15:25:47	1.22
+++ elf32-hppa.c	2000/08/18 20:04:42
@@ -1961,8 +1961,8 @@
       || (h->elf_link_hash_flags & ELF_LINK_HASH_NEEDS_PLT) != 0)
     {
       if (h->plt.refcount <= 0
+	  || h->root.type == bfd_link_hash_undefweak
 	  || ((h->elf_link_hash_flags & ELF_LINK_HASH_DEF_REGULAR) != 0
-	      && h->root.type != bfd_link_hash_defweak
 	      && (!info->shared || info->symbolic)
 	      && !(!info->shared
 		   && (h->root.type == bfd_link_hash_defined
@@ -1971,13 +1971,13 @@
 	{
 	  /* The .plt entry is not needed when:
 	     a) Garbage collection has removed all references to the
-	     symbol, or
-	     b) We know for certain the symbol is defined in this
-	     object, and it's not a weak definition.  Either this
-	     object is the application or we are doing a shared
-	     symbolic link.  As a special sop to the hppa ABI, we
-	     keep a .plt entry for functions in sections containing
-	     PIC code.  */
+	     symbol.
+	     b) It's an undefined weak symbol.
+	     c) We know for certain the symbol is defined in this
+	     object.  Either this object is the application or we are
+	     doing a shared symbolic link.  As a special sop to the
+	     hppa ABI, we keep a .plt entry for functions in sections
+	     containing PIC code.  */
 	  h->plt.offset = (bfd_vma) -1;
 	  h->elf_link_hash_flags &= ~ELF_LINK_HASH_NEEDS_PLT;
 	  return true;
@@ -2851,8 +2851,11 @@
     case R_PARISC_PCREL17F:
     case R_PARISC_PCREL22F:
       /* If this is a call to a function defined in another dynamic
-	 library, then find the import stub in the stub hash.  */
-      if (sym_sec == NULL || sym_sec->output_section == NULL)
+	 library, or if it is a call to a PIC function in the same
+	 object, then find the import stub in the stub hash.  */
+      if (sym_sec == NULL
+	  || sym_sec->output_section == NULL
+	  || (h != NULL && h->pic_call))
 	{
 	  stub_entry = hppa_get_stub_entry (input_section, sym_sec,
 					    h, rel, info);


-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
