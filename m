Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id D2B064A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Mar 2001 06:50:56 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA19536;
	Fri, 16 Mar 2001 00:37:55 +1100
Date: Fri, 16 Mar 2001 00:37:55 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: taggart@carmen.fc.hp.com
Cc: randolph@tausq.org, bdale@gag.com, alan_c_meyer@am.exch.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
In-Reply-To: <Pine.LNX.4.21.0103151813460.27636-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103160028370.15086-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 15 Mar 2001, Alan Modra wrote:

> On Thu, 15 Mar 2001, John David Anglin wrote:
> 
> > Uh?  Non pic code has always called pic code in libgcc.  Trashing r19
> > in frame_dummy shouldn't be a problem.
> 
> The only reason pic code can be called from non-pic is that the linker
> inserts magic stubs.  For some reason, that's not happening here on the
> call from frame_dummy to __register_frame_info.  You're right though, it
> should work.

This fixes the linker problem.  We had a function that happened to
have it's address taken and thus had a plabel, that also needed a non-PIC
to PIC call stub.

bfd/ChangeLog
	* elf32-hppa.c (elf32_hppa_link_hash_entry): Add maybe_pic_call.
	(hppa_link_hash_newfunc): Init it.
	(hppa_type_of_stub): Only use non-PIC to PIC call stub if caller
	section appears to be non-PIC.
	(final_link_relocate): Likewise.
	(elf32_hppa_adjust_dynamic_symbol): Set maybe_pic_call for any
	possible candidate function, and set pic_call for those that will
	only have a .plt entry for the PIC call stub.
	(hppa_handle_PIC_calls): Set maybe_pic_call.

Unfortunately, c++ progs still crash due to the unwind frame info list
head being trashed.  Haven't found out why yet, and I'm ready to crash
myself.

Alan Modra
-- 
Linuxcare

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.28
diff -u -p -r1.28 elf32-hppa.c
--- elf32-hppa.c	2001/03/08 21:03:58	1.28
+++ elf32-hppa.c	2001/03/15 13:26:03
@@ -225,6 +225,10 @@ struct elf32_hppa_link_hash_entry {
 #endif
 
   /* Set during a static link if we detect a function is PIC.  */
+  unsigned int maybe_pic_call:1;
+
+  /* Set if the only reason we need a .plt entry is for a non-PIC to
+     PIC function call.  */
   unsigned int pic_call:1;
 
   /* Set if this symbol is used by a plabel reloc.  */
@@ -490,6 +494,7 @@ hppa_link_hash_newfunc (entry, table, st
 #if ! LONG_BRANCH_PIC_IN_SHLIB || RELATIVE_DYNAMIC_RELOCS
       ret->reloc_entries = NULL;
 #endif
+      ret->maybe_pic_call = 0;
       ret->pic_call = 0;
       ret->plabel = 0;
       ret->plt_abs = 0;
@@ -721,7 +726,7 @@ hppa_type_of_stub (input_sec, rel, hash,
 	      && hash->elf.plt.offset != (bfd_vma) -1)
 	  || hash->elf.root.type == bfd_link_hash_undefweak
 	  || hash->elf.root.type == bfd_link_hash_undefined
-	  || hash->pic_call))
+	  || (hash->maybe_pic_call && !(input_sec->flags & SEC_HAS_GOT_REF))))
     {
       /* If output_section is NULL, then it's a symbol defined in a
 	 shared library.  We will need an import stub.  Decide between
@@ -1890,6 +1895,14 @@ elf32_hppa_adjust_dynamic_symbol (info, 
   if (h->type == STT_FUNC
       || (h->elf_link_hash_flags & ELF_LINK_HASH_NEEDS_PLT) != 0)
     {
+      if (!info->shared
+	  && h->plt.refcount > 0
+	  && (h->elf_link_hash_flags & ELF_LINK_HASH_DEF_REGULAR) != 0
+	  && (h->root.u.def.section->flags & SEC_HAS_GOT_REF) != 0)
+	{
+	  ((struct elf32_hppa_link_hash_entry *) h)->maybe_pic_call = 1;
+	}
+
       if (h->plt.refcount <= 0
 	  || ((h->elf_link_hash_flags & ELF_LINK_HASH_DEF_REGULAR) != 0
 	      && h->root.type != bfd_link_hash_defweak
@@ -1906,14 +1919,8 @@ elf32_hppa_adjust_dynamic_symbol (info, 
 
 	  /* As a special sop to the hppa ABI, we keep a .plt entry
 	     for functions in sections containing PIC code.  */
-	  if (!info->shared
-	      && h->plt.refcount > 0
-	      && (h->root.type == bfd_link_hash_defined
-		  || h->root.type == bfd_link_hash_defweak)
-	      && (h->root.u.def.section->flags & SEC_HAS_GOT_REF) != 0)
-	    {
-	      ((struct elf32_hppa_link_hash_entry *) h)->pic_call = 1;
-	    }
+	  if (((struct elf32_hppa_link_hash_entry *) h)->maybe_pic_call)
+	    ((struct elf32_hppa_link_hash_entry *) h)->pic_call = 1;
 	  else
 	    {
 	      h->plt.offset = (bfd_vma) -1;
@@ -2059,6 +2066,7 @@ hppa_handle_PIC_calls (h, inf)
     }
 
   h->elf_link_hash_flags |= ELF_LINK_HASH_NEEDS_PLT;
+  ((struct elf32_hppa_link_hash_entry *) h)->maybe_pic_call = 1;
   ((struct elf32_hppa_link_hash_entry *) h)->pic_call = 1;
 
   info = (struct bfd_link_info *) inf;
@@ -3244,11 +3252,12 @@ final_link_relocate (input_section, cont
 	 find the import stub in the stub hash.  */
       if (sym_sec == NULL
 	  || sym_sec->output_section == NULL
-	  || (h != NULL &&
-	      (h->pic_call
-	       || (h->elf.root.type == bfd_link_hash_defweak
-		   && h->elf.dynindx != -1
-		   && h->elf.plt.offset != (bfd_vma) -1))))
+	  || (h != NULL
+	      && ((h->maybe_pic_call
+		   && !(input_section->flags & SEC_HAS_GOT_REF))
+		  || (h->elf.root.type == bfd_link_hash_defweak
+		      && h->elf.dynindx != -1
+		      && h->elf.plt.offset != (bfd_vma) -1))))
 	{
 	  stub_entry = hppa_get_stub_entry (input_section, sym_sec,
 					    h, rel, hplink);
