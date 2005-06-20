From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [RFC] Emit OPD reloc for all global symbols and then
	some.
Date: Mon, 20 Jun 2005 15:02:52 -0400
Message-ID: <20050620190243.GB5269__26798.2608442709$1416623805$gmane$org@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
To: binutils@sources.redhat.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


binutils,

--- Robust function descriptor comparison fixes ---

Under hppa-linux:
------------------
We want to generate a PLABEL32 (OPD reloc) against all global symbols,
and then some. For example it should be possible for an application to
call dlsym asking for the address of main, and when compared to main it
should match.

- The main symbol returned by dlsym is an OPD.
- The main symbol in the executable is pointing at the PLT.
- GCC does generat an OPD reloc against main.
- ld optimizes away away the OPD reloc, and main is pointed it at the PLT. 
- A comparison between the two functions fails (e.g. if (main == foo))

For the sake of "comparing" function descriptors, we need to emit that
OPD for main, and all global symbols.

How did we do this in the past? GCC had to keep exact function type
information and generate a call to a special function that resolved the
PLT, and did a comparison of the ip/gp pair in the PLT to the OPD ip/gp
pair. This special function required _GOT_ to be visible globally.

We don't want _GOT_ globally visible. We don't want special comparison
functions. We want an OPD per function, and comparison should be as
easy as address equality.

How is this accomplished?

a. Keep a consistent meaning for hh->plabel.
   It will always indicate the symbol has an OPD reloc against it.

b. In check_relocs we need to count the reloc against the symbol
   and allocate space.

c. In allocate_dynrelocs we need to keep the space for this symbol
   even if we would like to get rid of this.

d. In relocate_section we need to emit the OPD reloc for this symbol.

e. We must be careful to copy all the required bits in
   copy_indirect_symbol when the versioned symbol won't pass through 
   check_relocs, and needs the space we already allocated for the reloc.

There are a couple of places where I am in doubt:

elf32_hppa_hide_symbol:
-----------------------
The comment indicates "so that we can keep plt entries for plabels."
However the conditional checks for "!hh->plabel" and this seems 
contrary to my reasoning. Which probably means my reasoning is flawed.
I have left this reference to ->plabel alone.

copy_indirect_symbol:
----------------------
I unconditionally |= the bits of 'plabel' and 'non_plabel_ref' into the 
direct version of the symbol. Is this the correct behaviour?

check_reloc:
allocate_dynreloc:
relocate_section:
-------------------
All of them check 
        (!eh->non_got_ref || hh->plabel)
        && (!hh->elf.def_dynamic 
            && hh->def_regular 
            && hh->plabel)

non_got_ref is set only in the (!info->shared && eh->dynindx != -1), case.
So along with "|| hh->plabel", it identifies all the global symbols which in
the case of the executable *were* being optimized away to point into the
plt.

The other set of conditionals catches local def_regular symbols like
main which have an OPD reloc against them and should be emitted in the
executable.

Does that seem like a sound plan?

Nit picks:
-----------
The linker continues to do extra work, outputing the required
information to point the OPD word to the plt, but it's overwritten by
ld.so at runtime when it creates the OPD and puts the word there. I have
yet to clean this up, its removal would make linking faster (but not by
much).

Testing:
---------
C++ testing is required. The libstdc++ testsuite is probably a good
place where this might fail.

---

The patch below has a single regression in the entire toolchain, but
fixes all function comparison failues in the glibc testsuite. The single
regression in the gcc 4.0.0 'C' testsuite and the compilation times out.
The cause is under investigation.

--- elf32-hppa.c.00-cleanup	2005-06-20 14:13:37.000000000 -0400
+++ elf32-hppa.c	2005-06-20 14:14:35.000000000 -0400
@@ -229,6 +229,8 @@
 
   /* Set if this symbol is used by a plabel reloc.  */
   unsigned int plabel:1;
+  /* Set if the symbol is referenced by more than just a plabel reloc */
+  unsigned int non_plabel_ref:1;
 };
 
 struct elf32_hppa_link_hash_table {
@@ -371,6 +373,7 @@
       hh = hppa_elf_hash_entry (entry);
       hh->stub_cache = NULL;
       hh->dyn_relocs = NULL;
+      hh->non_plabel_ref = 0;
       hh->plabel = 0;
     }
 
@@ -589,10 +592,12 @@
   bfd_vma max_branch_offset;
   unsigned int r_type;
 
+  /* A symbol with a plabel does not require a stub, unless
+     it has more than just a plabel reference. */
   if (hh != NULL
       && hh->elf.plt.offset != (bfd_vma) -1
       && hh->elf.dynindx != -1
-      && !hh->plabel
+      && hh->non_plabel_ref
       && (info->shared
 	  || !hh->elf.def_regular
 	  || hh->elf.root.type == bfd_link_hash_defweak))
@@ -961,7 +966,6 @@
 elf32_hppa_create_dynamic_sections (bfd *abfd, struct bfd_link_info *info)
 {
   struct elf32_hppa_link_hash_table *htab;
-  struct elf_link_hash_entry *eh;
 
   /* Don't try to create the .plt and .got twice.  */
   htab = hppa_link_hash_table (info);
@@ -990,12 +994,7 @@
   htab->sdynbss = bfd_get_section_by_name (abfd, ".dynbss");
   htab->srelbss = bfd_get_section_by_name (abfd, ".rela.bss");
 
-  /* hppa-linux needs _GLOBAL_OFFSET_TABLE_ to be visible from the main
-     application, because __canonicalize_funcptr_for_compare needs it.  */
-  eh = elf_hash_table (info)->hgot;
-  eh->forced_local = 0;
-  eh->other = STV_DEFAULT;
-  return bfd_elf_link_record_dynamic_symbol (info, eh);
+  return TRUE;
 }
 
 /* Copy the extra info we tack onto an elf_link_hash_entry.  */
@@ -1046,6 +1045,9 @@
       hh_ind->dyn_relocs = NULL;
     }
 
+  hh_dir->plabel |= hh_ind->plabel;
+  hh_dir->non_plabel_ref |= hh_ind->non_plabel_ref;
+  
   if (ELIMINATE_COPY_RELOCS
       && eh_ind->root.type != bfd_link_hash_indirect
       && eh_dir->dynamic_adjusted)
@@ -1109,11 +1111,11 @@
       if (r_symndx < symtab_hdr->sh_info)
 	hh = NULL;
       else
-        {
+	{
 	  hh = hppa_elf_hash_entry (eh_syms[r_symndx - symtab_hdr->sh_info]);
 	  while (hh->elf.root.type == bfd_link_hash_indirect
 		 || hh->elf.root.type == bfd_link_hash_warning)
-	    hh = hppa_elf_hash_entry (hh->elf.root.u.i.link);
+	    hh = hppa_elf_hash_entry (h->elf.root.u.i.link);
 	}
 
       r_type = ELF32_R_TYPE (rela->r_info);
@@ -1134,6 +1136,14 @@
 	  if (rela->r_addend != 0)
 	    abort ();
 
+          /* The definition is slightly changed: 
+	     All global symbols must have PLABEL32 relocs against
+	     their plabel data word, this will generate an OPD 
+	     against which symbol comparions may occur without
+	     help from special helper functions like 
+	     __canonicalize_function_pointer_for_compare.
+	     */
+	  
 	  /* If we are creating a shared library, then we need to
 	     create a PLT entry for all PLABELs, because PLABELs with
 	     local symbols may be passed via a pointer to another
@@ -1309,6 +1319,7 @@
 		}
 	      else if (need_entry & PLT_PLABEL)
 		{
+		  /* PLABEL to a local symbol */
 		  bfd_signed_vma *local_got_refcounts;
 		  bfd_signed_vma *local_plt_refcounts;
 
@@ -1369,6 +1380,12 @@
 	     may need to keep relocations for symbols satisfied by a
 	     dynamic library if we manage to avoid copy relocs for the
 	     symbol.  */
+
+	  /* Note we also allow certain local functions to emit
+	     relocs, this is so that glibc can create an OPD for
+	     this symbol at runtime. 'main' is probably the best
+	     example. */
+	    	    
 	  if ((info->shared
 	       && (sec->flags & SEC_ALLOC) != 0
 	       && (IS_ABSOLUTE_RELOC (r_type)
@@ -1381,7 +1398,10 @@
 		  && (sec->flags & SEC_ALLOC) != 0
 		  && hh != NULL
 		  && (hh->elf.root.type == bfd_link_hash_defweak
-		      || !hh->elf.def_regular)))
+		      || !hh->elf.def_regular
+		      || (!hh->elf.def_dynamic 
+			  && hh->elf.def_regular 
+			  && hh->plabel))))
 	    {
 	      struct elf32_hppa_dyn_reloc_entry *hdh_p;
 	      struct elf32_hppa_dyn_reloc_entry **hdh_head;
@@ -1703,6 +1723,7 @@
 	}
     }
 
+  /* TODO: This logic seems flawed. */
   if (! hppa_elf_hash_entry(eh)->plabel)
     {
       eh->needs_plt = 0;
@@ -1886,12 +1907,9 @@
 
       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, info->shared, eh))
 	{
-	  /* Allocate these later.  From this point on, h->plabel
-	     means that the plt entry is only used by a plabel.
-	     We'll be using a normal plt entry for this symbol, so
-	     clear the plabel indicator.  */
-	  
-	  hh->plabel = 0;
+	  /* Allocate these later.
+	     We have assume a non-plabel reference */
+	  hh->non_plabel_ref = 1;
 	}
       else if (hh->plabel)
 	{
@@ -1900,6 +1918,8 @@
 	  sec = htab->splt;
 	  eh->plt.offset = sec->size;
 	  sec->size += PLT_ENTRY_SIZE;
+	  /* Only a plabel reference */
+	  hh->non_plabel_ref = 0;
 	}
       else
 	{
@@ -1910,6 +1930,7 @@
     }
   else
     {
+      /* No .plt entry needed. */
       eh->plt.offset = (bfd_vma) -1;
       eh->needs_plt = 0;
     }
@@ -1941,7 +1962,7 @@
   
   if (htab->elf.dynamic_sections_created
       && eh->plt.offset != (bfd_vma) -1
-      && !hh->plabel
+      && hh->non_plabel_ref
       && eh->plt.refcount > 0)
     {
       /* Make an entry in the .plt section.  */
@@ -2011,21 +2032,28 @@
 	 visibility.  */
       if (ELF_ST_VISIBILITY (eh->other) != STV_DEFAULT
 	  && eh->root.type == bfd_link_hash_undefweak)
-	hh->dyn_relocs = NULL;
+        {
+	  hh->dyn_relocs = NULL;
+	  return TRUE;
+	}
     }
   else
     {
       /* For the non-shared case, discard space for relocs against
 	 symbols which turn out to need copy relocs or are not
-	 dynamic.  */
-      
-      if (!eh->non_got_ref
-	  && ((ELIMINATE_COPY_RELOCS
-	       && eh->def_dynamic
-	       && !eh->def_regular)
-	       || (htab->elf.dynamic_sections_created
-		   && (eh->root.type == bfd_link_hash_undefweak
-		       || eh->root.type == bfd_link_hash_undefined))))
+	 dynamic. We always want a plabel dynrel for the OPD,
+	 even if it's a DEF_REGULAR && !DEF_DYNAMIC, we need this
+	 for function descriptor comparisons. */      
+      if ((!eh->non_got_ref || hh->plabel)
+	  && ((!eh->def_dynamic
+	       && eh->def_regular
+	       && hh->plabel)
+	      || (ELIMINATE_COPY_RELOCS
+	          && eh->def_dynamic
+	          && !eh->def_regular)
+	      || (htab->elf.dynamic_sections_created
+		  && (eh->root.type == bfd_link_hash_undefweak
+		      || eh->root.type == bfd_link_hash_undefined))))
 	{
 	  /* Make sure this symbol is output as a dynamic symbol.
 	     Undefined weak syms won't yet be marked as dynamic.  */
@@ -3186,7 +3214,7 @@
 	  || (hh != NULL
 	      && hh->elf.plt.offset != (bfd_vma) -1
 	      && hh->elf.dynindx != -1
-	      && !hh->plabel
+	      && hh->non_plabel_ref
 	      && (info->shared
 		  || !hh->elf.def_regular
 		  || hh->elf.root.type == bfd_link_hash_defweak)))
@@ -3627,9 +3655,16 @@
 	    bfd_map_over_sections (output_bfd, hppa_record_segment_addr, htab);
 	  break;
 
+	case R_PARISC_PLABEL32:
+
+	  /* This is a true dynamic plabel reloc, the other will be
+	     rebuilt to point at the plabel word, which points to a
+	     .plt entry */
+	  if (htab->elf.dynamic_sections_created)
+	    plabel = 1;
+	  
 	case R_PARISC_PLABEL14R:
 	case R_PARISC_PLABEL21L:
-	case R_PARISC_PLABEL32:
 	  if (htab->elf.dynamic_sections_created)
 	    {
 	      bfd_vma off;
@@ -3642,7 +3677,7 @@
 		  if (! WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, info->shared,
 							 &hh->elf))
 		    {
-		      /* In a non-shared link, adjust_dynamic_symbols
+		      /* In a non-shared link, adjust_dynamic_symbol
 			 isn't called for symbols forced local.  We
 			 need to write out the plt entry here.  */
 		      if ((off & 1) != 0)
@@ -3724,7 +3759,6 @@
 				+ htab->splt->output_section->vma
 				+ 2);
 		}
-	      plabel = 1;
 	    }
 	  /* Fall through and possibly emit a dynamic relocation.  */
 
@@ -3765,10 +3799,13 @@
 	      || (!info->shared
 		  && hh != NULL
 		  && hh->elf.dynindx != -1
-		  && !hh->elf.non_got_ref
-		  && ((ELIMINATE_COPY_RELOCS
-		       && hh->elf.def_dynamic
-		       && !hh->elf.def_regular)
+		  && (!hh->elf.non_got_ref || plabel)
+		  && ((!hh->elf.def_dynamic
+		       && hh->elf.def_regular
+		       && plabel) 		    
+		      || (ELIMINATE_COPY_RELOCS
+		          && hh->elf.def_dynamic
+		          && !hh->elf.def_regular)
 		      || hh->elf.root.type == bfd_link_hash_undefweak
 		      || hh->elf.root.type == bfd_link_hash_undefined)))
 	    {
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
