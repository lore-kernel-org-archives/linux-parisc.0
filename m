Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68191482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 May 2001 03:09:57 -0600 (MDT)
Received: Received: [from squeak.local (async67-ade-isp-7.nas.one.net.au [203.101.92.68])
	by mail-ob05.one.net.au  with SMTP id f4S99AC02540
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 May 2001 19:09:20 +1000 (EST)]
From: amodra@one.net.au
Date: Mon, 28 May 2001 18:46:53 +0930
To: binutils@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org, rhirst@linuxcare.com
Message-ID: <20010528184653.B11349@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] elflink.h (elf_bfd_final_link)
List-ID: <linux-parisc.vger.kernel.org>

Does anyone know why elf_link_output_extsym is only called for a
shared link on symbols forced local?  Is it just a case of bit-rot
in that at one stage it was only symbol versioning with shared libs
that could force symbols local?

Not calling elf_link_output_extsym has the effect that the back-end
finish_dynamic_symbol routine isn't called, which means various hacks
are needed like the following:

bfd/ChangeLog
	* elf32-hppa.c (elf32_hppa_relocate_section): Set up .plt entries
	for symbols forced local that need plabels.
	(elf32_hppa_adjust_dynamic_symbol): Don't allocate space in
	.plt.rela for local syms if non-shared.
	(hppa_build_one_stub): Mask lsb of plt.offset.
	(elf32_hppa_finish_dynamic_symbol): Abort if lsb of plt.offset set.
	(clobber_millicode_symbols): Correct comment.
	(elf32_hppa_relocate_section): Likewise.
	(elf32_hppa_finish_dynamic_symbol): Likewise.

-- 
Alan Modra

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.34
diff -u -p -r1.34 elf32-hppa.c
--- elf32-hppa.c	2001/05/25 03:46:49	1.34
+++ elf32-hppa.c	2001/05/28 08:31:36
@@ -831,6 +831,7 @@ hppa_build_one_stub (gen_entry, in_arg)
   bfd_byte *loc;
   bfd_vma sym_value;
   bfd_vma insn;
+  bfd_vma off;
   int val;
   int size;
 
@@ -938,9 +939,12 @@ hppa_build_one_stub (gen_entry, in_arg)
 
     case hppa_stub_import:
     case hppa_stub_import_shared:
-      if (stub_entry->h->elf.plt.offset >= (bfd_vma) -2)
+      off = stub_entry->h->elf.plt.offset;
+      if (off >= (bfd_vma) -2)
 	abort ();
-      sym_value = (stub_entry->h->elf.plt.offset
+
+      off &= ~ (bfd_vma) 1;
+      sym_value = (off
 		   + hplink->splt->output_offset
 		   + hplink->splt->output_section->vma
 		   - elf_gp (hplink->splt->output_section->owner));
@@ -1014,10 +1018,10 @@ hppa_build_one_stub (gen_entry, in_arg)
 	     <__gp>.  */
 
 	  bfd_put_32 (hplink->splt->owner, value,
-		      hplink->splt->contents + eh->elf.plt.offset);
+		      hplink->splt->contents + off);
 	  value = elf_gp (hplink->splt->output_section->owner);
 	  bfd_put_32 (hplink->splt->owner, value,
-		      hplink->splt->contents + eh->elf.plt.offset + 4);
+		      hplink->splt->contents + off + 4);
 	}
       break;
 
@@ -1957,11 +1961,14 @@ elf32_hppa_adjust_dynamic_symbol (info, 
 		return false;
 	    }
 
-	  /* We also need to make an entry in the .rela.plt section.  */
-	  s = hplink->srelplt;
-	  s->_raw_size += sizeof (Elf32_External_Rela);
+	  if (h->dynindx != -1 || info->shared)
+	    {
+	      /* We also need to make an entry in the .rela.plt section.  */
+	      s = hplink->srelplt;
+	      s->_raw_size += sizeof (Elf32_External_Rela);
 
-	  hplink->need_plt_stub = 1;
+	      hplink->need_plt_stub = 1;
+	    }
 	}
       return true;
     }
@@ -2149,8 +2156,8 @@ clobber_millicode_symbols (h, info)
      struct elf_link_hash_entry *h;
      struct bfd_link_info *info;
 {
-  /* Note!  We only want to remove these from the dynamic symbol
-     table.  Therefore we do not set ELF_LINK_FORCED_LOCAL.  */
+  /* We only want to remove these from the dynamic symbol table.
+     Therefore we do not leave ELF_LINK_FORCED_LOCAL set.  */
   if (h->type == STT_PARISC_MILLI)
     {
       unsigned short oldflags = h->elf_link_hash_flags;
@@ -3684,10 +3691,10 @@ elf32_hppa_relocate_section (output_bfd,
 
 		  if (info->shared)
 		    {
-		      /* Output a dynamic *ABS* relocation for this
-			 GOT entry.  In this case it is relative to
-			 the base of the object because the symbol
-			 index is zero.  */
+		      /* Output a dynamic relocation for this GOT
+			 entry.  In this case it is relative to the
+			 base of the object because the symbol index
+			 is zero.  */
 		      Elf_Internal_Rela outrel;
 		      asection *srelgot = hplink->srelgot;
 
@@ -3735,6 +3742,25 @@ elf32_hppa_relocate_section (output_bfd,
 	      if (h != NULL)
 		{
 		  off = h->elf.plt.offset;
+		  if (!info->shared
+		      && (h->elf.elf_link_hash_flags & ELF_LINK_FORCED_LOCAL))
+		    {
+		      /* In a non-shared link, adjust_dynamic_symbols
+			 isn't called for symbols forced local.  We
+			 need to write out the plt entry here.  */ 
+		      if ((off & 1) != 0)
+			off &= ~1;
+		      else
+			{
+			  bfd_put_32 (output_bfd,
+				      relocation,
+				      hplink->splt->contents + off);
+			  bfd_put_32 (output_bfd,
+				      elf_gp (hplink->splt->output_section->owner),
+				      hplink->splt->contents + off + 4);
+			  h->elf.plt.offset |= 1;
+			}
+		    }
 		}
 	      else
 		{
@@ -3780,7 +3806,7 @@ elf32_hppa_relocate_section (output_bfd,
 		    }
 		}
 
-	      if (off >= (bfd_vma) -2)
+	      if (off >= (bfd_vma) -2 || (off & 1) != 0)
 		abort ();
 
 	      /* PLABELs contain function pointers.  Relocation is to
@@ -4015,6 +4041,9 @@ elf32_hppa_finish_dynamic_symbol (output
     {
       bfd_vma value;
 
+      if (h->plt.offset & 1)
+	abort ();
+
       /* This symbol has an entry in the procedure linkage table.  Set
 	 it up.
 
@@ -4045,8 +4074,8 @@ elf32_hppa_finish_dynamic_symbol (output
 	    {
 	      /* To support lazy linking, the function pointer is
 		 initialised to point to a special stub stored at the
-		 end of the .plt.  This is only done for plt entries
-		 with a non-*ABS* dynamic relocation.  */
+		 end of the .plt.  This is not done for plt entries
+		 with a base-relative dynamic relocation.  */
 	      value = (hplink->splt->output_offset
 		       + hplink->splt->output_section->vma
 		       + hplink->splt->_raw_size
