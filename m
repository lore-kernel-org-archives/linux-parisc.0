Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05436482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 May 2001 21:27:39 -0600 (MDT)
Received: Received: [from squeak.local (async65-ade-isp-2.nas.one.net.au [203.101.90.66])
	by mail-ob05.one.net.au  with SMTP id f4P3RAn10308
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 May 2001 13:27:14 +1000 (EST)]
From: amodra@one.net.au
Date: Fri, 25 May 2001 13:03:59 +0930
To: binutils@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010525130358.K9275@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] elf32-hppa: abort rather than BFD_ASSERT
List-ID: <linux-parisc.vger.kernel.org>

Be a little more brutal.  Any BFD_ASSERT failure here either rapidly
results in a segfault during linking, or worse, generates shared libs
and executables that will bomb with bus errors at runtime.  An
undefined millicode symbol in a shared library is nasty too:  they
can't be satisfied by another shared lib export as the ABI doesn't
allow millicode to be exported from shared libs.

bfd/ChangeLog
	* elf32-hppa.c (elf32_hppa_relocate_section): Don't allow
	undefined millicode syms in shared libs.
	(hppa_build_one_stub): Turn BFD_ASSERTs into aborts.
	(elf32_hppa_check_relocs): Likewise.
	(elf32_hppa_adjust_dynamic_symbol): Likewise.
	(elf32_hppa_size_dynamic_sections): Likewise.
	(elf32_hppa_relocate_section): Likewise.
	(elf32_hppa_finish_dynamic_symbol): Likewise.
	(elf32_hppa_finish_dynamic_sections): Likewise.

-- 
Alan Modra

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.33
diff -u -p -r1.33 elf32-hppa.c
--- elf32-hppa.c	2001/05/18 03:11:13	1.33
+++ elf32-hppa.c	2001/05/25 02:50:18
@@ -938,7 +938,8 @@ hppa_build_one_stub (gen_entry, in_arg)
 
     case hppa_stub_import:
     case hppa_stub_import_shared:
-      BFD_ASSERT (stub_entry->h->elf.plt.offset < (bfd_vma) -2);
+      if (stub_entry->h->elf.plt.offset >= (bfd_vma) -2)
+	abort ();
       sym_value = (stub_entry->h->elf.plt.offset
 		   + hplink->splt->output_offset
 		   + hplink->splt->output_section->vma
@@ -998,8 +999,9 @@ hppa_build_one_stub (gen_entry, in_arg)
 	  dynobj = hplink->root.dynobj;
 	  eh = (struct elf32_hppa_link_hash_entry *) stub_entry->h;
 
-	  BFD_ASSERT (eh->elf.root.type == bfd_link_hash_defined
-		      || eh->elf.root.type == bfd_link_hash_defweak);
+	  if (eh->elf.root.type != bfd_link_hash_defined
+	      && eh->elf.root.type != bfd_link_hash_defweak)
+	    abort ();
 
 	  value = (eh->elf.root.u.def.value
 		   + eh->elf.root.u.def.section->output_offset
@@ -1289,7 +1291,8 @@ elf32_hppa_check_relocs (abfd, info, sec
 	case R_PARISC_PLABEL21L:
 	case R_PARISC_PLABEL32:
 	  /* If the addend is non-zero, we break badly.  */
-	  BFD_ASSERT (rel->r_addend == 0);
+	  if (rel->r_addend != 0)
+	    abort ();
 
 	  /* If we are creating a shared library, then we need to
 	     create a PLT entry for all PLABELs, because PLABELs with
@@ -1968,8 +1971,9 @@ elf32_hppa_adjust_dynamic_symbol (info, 
      real definition first, and we can just use the same value.  */
   if (h->weakdef != NULL)
     {
-      BFD_ASSERT (h->weakdef->root.type == bfd_link_hash_defined
-		  || h->weakdef->root.type == bfd_link_hash_defweak);
+      if (h->weakdef->root.type != bfd_link_hash_defined
+	  && h->weakdef->root.type != bfd_link_hash_defweak)
+	abort ();
       h->root.u.def.section = h->weakdef->root.u.def.section;
       h->root.u.def.value = h->weakdef->root.u.def.value;
       return true;
@@ -2173,7 +2177,8 @@ elf32_hppa_size_dynamic_sections (output
 
   hplink = hppa_link_hash_table (info);
   dynobj = hplink->root.dynobj;
-  BFD_ASSERT (dynobj != NULL);
+  if (dynobj == NULL)
+    abort ();
 
   if (hplink->root.dynamic_sections_created)
     {
@@ -2183,7 +2188,8 @@ elf32_hppa_size_dynamic_sections (output
       if (! info->shared)
 	{
 	  s = bfd_get_section_by_name (dynobj, ".interp");
-	  BFD_ASSERT (s != NULL);
+	  if (s == NULL)
+	    abort ();
 	  s->_raw_size = sizeof ELF_DYNAMIC_INTERPRETER;
 	  s->contents = (unsigned char *) ELF_DYNAMIC_INTERPRETER;
 	}
@@ -3590,7 +3596,8 @@ elf32_hppa_relocate_section (output_bfd,
 	  else if (h->elf.root.type == bfd_link_hash_undefweak)
 	    ;
 	  else if (info->shared && !info->no_undefined
-		   && ELF_ST_VISIBILITY (h->elf.other) == STV_DEFAULT)
+		   && ELF_ST_VISIBILITY (h->elf.other) == STV_DEFAULT
+		   && h->elf.type != STT_PARISC_MILLI)
 	    {
 	      if (info->symbolic)
 		if (!((*info->callbacks->undefined_symbol)
@@ -3623,7 +3630,8 @@ elf32_hppa_relocate_section (output_bfd,
 	      bfd_vma off;
 
 	      off = h->elf.got.offset;
-	      BFD_ASSERT (off != (bfd_vma) -1);
+	      if (off == (bfd_vma) -1)
+		abort ();
 
 	      if (! hplink->root.dynamic_sections_created
 		  || (info->shared
@@ -3659,11 +3667,10 @@ elf32_hppa_relocate_section (output_bfd,
 	    {
 	      /* Local symbol case.  */
 	      bfd_vma off;
-
-	      BFD_ASSERT (local_got_offsets != NULL
-			  && local_got_offsets[r_symndx] != (bfd_vma) -1);
 
-	      off = local_got_offsets[r_symndx];
+	      if (local_got_offsets == NULL
+		  || (off = local_got_offsets[r_symndx]) == (bfd_vma) -1)
+		abort ();
 
 	      /* The offset must always be a multiple of 4.  We use
 		 the least significant bit to record whether we have
@@ -3773,7 +3780,8 @@ elf32_hppa_relocate_section (output_bfd,
 		    }
 		}
 
-	      BFD_ASSERT (off < (bfd_vma) -2);
+	      if (off >= (bfd_vma) -2)
+		abort ();
 
 	      /* PLABELs contain function pointers.  Relocation is to
 		 the entry for the function in the .plt.  The magic +2
@@ -3840,7 +3848,8 @@ elf32_hppa_relocate_section (output_bfd,
 		  if (name == NULL)
 		    return false;
 		  sreloc = bfd_get_section_by_name (dynobj, name);
-		  BFD_ASSERT (sreloc != NULL);
+		  if (sreloc == NULL)
+		    abort ();
 		}
 
 	      outrel.r_offset = rel->r_offset;
@@ -4112,7 +4121,8 @@ elf32_hppa_finish_dynamic_symbol (output
 	}
       else
 	{
-	  BFD_ASSERT((h->got.offset & 1) == 0);
+	  if ((h->got.offset & 1) != 0)
+	    abort ();
 	  bfd_put_32 (output_bfd, (bfd_vma) 0,
 		      hplink->sgot->contents + h->got.offset);
 	  rel.r_info = ELF32_R_INFO (h->dynindx, R_PARISC_DIR32);
@@ -4133,9 +4143,10 @@ elf32_hppa_finish_dynamic_symbol (output
 
       /* This symbol needs a copy reloc.  Set it up.  */
 
-      BFD_ASSERT (h->dynindx != -1
-		  && (h->root.type == bfd_link_hash_defined
-		      || h->root.type == bfd_link_hash_defweak));
+      if (! (h->dynindx != -1
+	     && (h->root.type == bfd_link_hash_defined
+		 || h->root.type == bfd_link_hash_defweak)))
+	abort ();
 
       s = hplink->srelbss;
 
@@ -4181,7 +4192,8 @@ elf32_hppa_finish_dynamic_sections (outp
     {
       Elf32_External_Dyn *dyncon, *dynconend;
 
-      BFD_ASSERT (sdyn != NULL);
+      if (sdyn == NULL)
+	abort ();
 
       dyncon = (Elf32_External_Dyn *) sdyn->contents;
       dynconend = (Elf32_External_Dyn *) (sdyn->contents + sdyn->_raw_size);
