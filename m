Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA25656
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 22:35:42 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 22:35:58 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
References: <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au> <87zomjmtr7.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Aug 2000 18:35:49 -0400
In-Reply-To: David Huggins-Daines's message of "11 Aug 2000 16:23:56 -0400"
Message-ID: <87u2crmnne.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > So...  I can turn a PLABEL reference into a GOT reference, which will
> > magically fix the $$dyncall problem.
> 
> Yes, that's the right idea.  However it only works for external
> symbols, and you still need a PLABEL32 relocation for function
> pointers to local symbols within a shared object (like dl_main for
> instance, hint hint :-)
> 
> I'll try to take a shot at it but I still don't fully comprehend the
> BFD code.

Here's an (ugly) patch that works.  Please verify that the last chunk
is okay - ld was outputting bogus PLABEL32 relocations when things
were compiled with -ffunction-sections, because it was effectively
calculating the addend as the offset within the input section.

With this patch ld.so manages to link itself again.

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/bfd/elf32-hppa.c,v
retrieving revision 1.13.2.25
diff -u -r1.13.2.25 elf32-hppa.c
--- elf32-hppa.c	2000/08/11 18:12:40	1.13.2.25
+++ elf32-hppa.c	2000/08/12 04:28:20
@@ -1058,9 +1058,14 @@
 	    }
 	  break;
 
+	case R_PARISC_PLABEL32:
+	  /* In this case, if it's local, we don't need a .plt entry,
+             but we might need to generate a dynamic relocation. */
+	  if (h == NULL)
+	    goto local_plabel;
+
 	case R_PARISC_PLABEL14R: /* "Official" procedure labels.  */
 	case R_PARISC_PLABEL21L:
-	case R_PARISC_PLABEL32:
 	case R_PARISC_PCREL17C:
 	case R_PARISC_PCREL17F:
 	case R_PARISC_PCREL22F:
@@ -1131,6 +1136,7 @@
 	  /* Fall through.  */
 #endif
 
+	local_plabel:
 	case R_PARISC_DIR32: /* .word, PARISC.unwind relocs.  */
 
 	  /* Flag this symbol as having a non-got, non-plt reference
@@ -2738,12 +2744,16 @@
 			 + hplink->sgot->output_section->vma);
 	  break;
 
+	case R_PARISC_PLABEL32:
+	  /* As in check_relocs, we may need to output a dynamic reloc
+             here even for local symbols. */
+	  if (h == NULL)
+	    goto local_plabel;
 	case R_PARISC_PLABEL14R:
 	case R_PARISC_PLABEL21L:
-	case R_PARISC_PLABEL32:
 	  if (elf_hash_table (info)->dynamic_sections_created
 	      && h != NULL
-	      && h->elf.plt.offset != -1)
+	      && h->elf.plt.offset != (bfd_vma) -1)
 	    {
 	      /* PLABELs contain function pointers.  Relocation is to
 		 the entry for the function in the .plt.  The magic +2
@@ -2756,6 +2766,7 @@
 	    }
 	  break;
 
+	local_plabel:
 	case R_PARISC_DIR17F:
 	case R_PARISC_DIR17R:
 	case R_PARISC_DIR14R:
@@ -2832,14 +2843,18 @@
 		{
 		  int indx = 0;
 
+		  /* Add the absolute offset of the symbol. */
+		  outrel.r_addend += relocation;
+
 		  if (! bfd_is_abs_section (sym_sec))
 		    {
 		      indx = elf_section_data (sym_sec->output_section)->dynindx;
-		      outrel.r_addend -= (sym_sec->output_offset
-					  + sym_sec->output_section->vma);
+		      /* Subtract out the output section's address (but
+                         not the offset of the input section in the
+                         output section!). */
+		      outrel.r_addend -= sym_sec->output_section->vma;
 		    }
 
-		  outrel.r_addend += relocation;
 		  outrel.r_info = ELF32_R_INFO (indx, r_type);
 		}
 


-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
