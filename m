Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2A4D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Jun 2003 12:44:12 -0600 (MDT)
Message-Id: <200306291844.h5TIi3Wx026630@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils ICE while building todays gcc HEAD on hppa-linux
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Sun, 29 Jun 2003 14:44:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com,
	jakub@redhat.com, gcc-patches@gcc.gnu.org
In-Reply-To: <16122.5027.155918.686357@gargle.gargle.HOWL> from "Matthias Klose" at Jun 25, 2003 11:26:59 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> ICE in binutils-2.14.90.0.4 building gcc HEAD 20030625, while linking
> the shared libstdc++ library:
> 
> [...]
> -Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.0
> /usr/bin/ld: BFD 2.14.90.0.4 20030523 Debian GNU/Linux internal error, aborting at ../../bfd/elf32-hppa.c line 3864 in elf32_hppa_relocate_section
> 
> /usr/bin/ld: Please report this bug.

I have installed the enclosed patch on the gcc trunk to work around the
above error.  There still isn't a good fix for the linker error.

The patch works around the problem by not using function descriptors
for the jump from a thunk on PA ports that define ASM_OUTPUT_DEF
(hppa-linux, hppa64-hpux).

In general, thunk and call sequence generation should be improved,
although things have gotten more complicated :(  The patch fixes
a bug in the updating and usage of total_code_bytes.  We were incorrectly
including linkonce sections in total_code_bytes and this caused a long
sequence to be used in some cases when a short sequence would do.

Tested with no regressions on hppa-unknown-linux-gnu, hppa2.0w-hp-hpux11.00
and hppa64-hp-hpux11.11.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

2003-06-29  John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

        * pa.c (update_total_code_bytes): New function.
	(last_address): Number of bytes output for a function and its
	associated thunks.
	(compute_frame_size): Use BITS_PER_UNIT.
	(pa_output_function_epilogue): Compute last_address.  Use
	update_total_code_bytes.
	(output_lbranch): Handle long branch on portable runtime.
	(attr_length_millicode_call, attr_length_call,
	attr_length_indirect_call): Only use total_code_bytes for calls in
	the text section.
	(output_call): Only use an indirect call sequence when the target is
	not local.
	(pa_asm_output_mi_thunk): Handle updating of total_code_bytes.  Improve
	test to determine when an IA-relative branch can be used.  Add various
	long branch sequences.  Avoid using an indirect branch on all ports
	except SOM.

Index: config/pa/pa.c
===================================================================
RCS file: /cvs/gcc/gcc/gcc/config/pa/pa.c,v
retrieving revision 1.216
diff -u -3 -p -r1.216 pa.c
--- config/pa/pa.c	19 Jun 2003 21:47:19 -0000	1.216
+++ config/pa/pa.c	29 Jun 2003 16:35:11 -0000
@@ -113,6 +113,7 @@ static void store_reg_modify PARAMS ((in
 static void load_reg PARAMS ((int, int, int));
 static void set_reg_plus_d PARAMS ((int, int, int, int));
 static void pa_output_function_prologue PARAMS ((FILE *, HOST_WIDE_INT));
+static void update_total_code_bytes PARAMS ((int));
 static void pa_output_function_epilogue PARAMS ((FILE *, HOST_WIDE_INT));
 static int pa_adjust_cost PARAMS ((rtx, rtx, rtx, int));
 static int pa_adjust_priority PARAMS ((rtx, int));
@@ -169,10 +170,15 @@ static int gr_saved, fr_saved;
 
 static rtx find_addr_reg PARAMS ((rtx));
 
-/* Keep track of the number of bytes we have output in the CODE subspaces
+/* Keep track of the number of bytes we have output in the CODE subspace
    during this compilation so we'll know when to emit inline long-calls.  */
 unsigned long total_code_bytes;
 
+/* The last address of the previous function plus the number of bytes in
+   associated thunks that have been output.  This is used to determine if
+   a thunk can use an IA-relative branch to reach its target function.  */
+static int last_address;
+
 /* Variables to handle plabels that we discover are necessary at assembly
    output time.  They are output after the current function.  */
 struct deferred_plabel GTY(())
@@ -3292,8 +3298,8 @@ compute_frame_size (size, fregs_live)
     size += TARGET_64BIT ? 48 : 32;
 
   /* Finally, round to the preferred stack boundary.  */
-  return ((size + PREFERRED_STACK_BOUNDARY / 8 - 1)
-	  & ~(PREFERRED_STACK_BOUNDARY / 8 - 1));
+  return ((size + PREFERRED_STACK_BOUNDARY / BITS_PER_UNIT - 1)
+	  & ~(PREFERRED_STACK_BOUNDARY / BITS_PER_UNIT - 1));
 }
 
 /* Generate the assembly code for function entry.  FILE is a stdio
@@ -3681,6 +3687,30 @@ load_reg (reg, disp, base)
     }
 }
 
+/* Update the total code bytes output to the text section.  */
+
+static void
+update_total_code_bytes (nbytes)
+     int nbytes;
+{
+  if ((TARGET_PORTABLE_RUNTIME || !TARGET_GAS || !TARGET_SOM)
+      && in_text_section ())
+    {
+      if (INSN_ADDRESSES_SET_P ())
+	{
+	  unsigned long old_total = total_code_bytes;
+
+	  total_code_bytes += nbytes;
+
+	  /* Be prepared to handle overflows.  */
+	  if (old_total > total_code_bytes)
+	    total_code_bytes = -1;
+	}
+      else
+	total_code_bytes = -1;
+    }
+}
+
 /* This function generates the assembly code for function exit.
    Args are as for output_function_prologue ().
 
@@ -3694,9 +3724,10 @@ pa_output_function_epilogue (file, size)
      FILE *file;
      HOST_WIDE_INT size ATTRIBUTE_UNUSED;
 {
-  int last_address = 0;
   rtx insn = get_last_insn ();
 
+  last_address = 0;
+
   /* hppa_expand_epilogue does the dirty work now.  We just need
      to output the assembler directives which denote the end
      of a function.
@@ -3724,29 +3755,18 @@ pa_output_function_epilogue (file, size)
 
   fputs ("\t.EXIT\n\t.PROCEND\n", file);
 
-  /* Finally, update the total number of code bytes output so far.  */
-  if ((TARGET_PORTABLE_RUNTIME || !TARGET_GAS || !TARGET_SOM)
-      && !flag_function_sections)
+  if (INSN_ADDRESSES_SET_P ())
     {
-      if (INSN_ADDRESSES_SET_P ())
-	{
-	  unsigned long old_total = total_code_bytes;
-
-	  insn = get_last_nonnote_insn ();
-	  last_address += INSN_ADDRESSES (INSN_UID (insn));
-	  if (INSN_P (insn))
-	    last_address += insn_default_length (insn);
-
-	  total_code_bytes += last_address;
-	  total_code_bytes += FUNCTION_BOUNDARY / BITS_PER_UNIT;
-
-	  /* Be prepared to handle overflows.  */
-	  if (old_total > total_code_bytes)
-	    total_code_bytes = -1;
-	}
-      else
-	total_code_bytes = -1;
+      insn = get_last_nonnote_insn ();
+      last_address += INSN_ADDRESSES (INSN_UID (insn));
+      if (INSN_P (insn))
+	last_address += insn_default_length (insn);
+      last_address = ((last_address + FUNCTION_BOUNDARY / BITS_PER_UNIT - 1)
+		      & ~(FUNCTION_BOUNDARY / BITS_PER_UNIT - 1));
     }
+
+  /* Finally, update the total number of code bytes output so far.  */
+  update_total_code_bytes (last_address);
 }
 
 void
@@ -5904,7 +5924,13 @@ output_lbranch (dest, insn)
 	output_asm_insn ("stw %%r1,-12(%%r30)", xoperands);
     }
 
-  if (flag_pic)
+  if (TARGET_PORTABLE_RUNTIME)
+    {
+      output_asm_insn ("ldil L'%0,%%r1", xoperands);
+      output_asm_insn ("ldo R'%0(%%r1),%%r1", xoperands);
+      output_asm_insn ("bv %%r0(%%r1)", xoperands);
+    }
+  else if (flag_pic)
     {
       output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
       if (TARGET_SOM || !TARGET_GAS)
@@ -6545,11 +6571,12 @@ attr_length_millicode_call (insn)
      rtx insn;
 {
   unsigned long distance = -1;
+  unsigned long total = in_text_section () ? total_code_bytes : 0;
 
   if (INSN_ADDRESSES_SET_P ())
     {
-      distance = (total_code_bytes + insn_current_reference_address (insn));
-      if (distance < total_code_bytes)
+      distance = (total + insn_current_reference_address (insn));
+      if (distance < total)
 	distance = -1;
     }
 
@@ -6741,11 +6768,12 @@ attr_length_call (insn, sibcall)
      int sibcall;
 {
   unsigned long distance = -1;
+  unsigned long total = in_text_section ()? total_code_bytes : 0;
 
   if (INSN_ADDRESSES_SET_P ())
     {
-      distance = (total_code_bytes + insn_current_reference_address (insn));
-      if (distance < total_code_bytes)
+      distance = (total + insn_current_reference_address (insn));
+      if (distance < total)
 	distance = -1;
     }
 
@@ -6813,12 +6841,15 @@ output_call (insn, call_dest, sibcall)
   int delay_insn_deleted = 0;
   int delay_slot_filled = 0;
   int seq_length = dbr_sequence_length ();
+  tree call_decl = SYMBOL_REF_DECL (call_dest);
+  int local_call = call_decl && !TREE_PUBLIC (call_decl);
   rtx xoperands[2];
 
   xoperands[0] = call_dest;
 
   /* Handle the common case where we're sure that the branch will reach
-     the beginning of the $CODE$ subspace.  */
+     the beginning of the "$CODE$" subspace.  This is the beginning of
+     the current function if we are in a named section.  */
   if (!TARGET_LONG_CALLS && attr_length_call (insn, sibcall) == 8)
     {
       xoperands[1] = gen_rtx_REG (word_mode, sibcall ? 0 : 2);
@@ -6826,7 +6857,7 @@ output_call (insn, call_dest, sibcall)
     }
   else
     {
-      if (TARGET_64BIT)
+      if (TARGET_64BIT && !local_call)
 	{
 	  /* ??? As far as I can tell, the HP linker doesn't support the
 	     long pc-relative sequence described in the 64-bit runtime
@@ -6878,9 +6909,10 @@ output_call (insn, call_dest, sibcall)
 	  /* Emit a long call.  There are several different sequences
 	     of increasing length and complexity.  In most cases,
              they don't allow an instruction in the delay slot.  */
-	  if (!(TARGET_LONG_ABS_CALL && !flag_pic)
+	  if (!((TARGET_LONG_ABS_CALL || local_call) && !flag_pic)
 	      && !(TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
-	      && !(TARGET_GAS && TARGET_LONG_PIC_PCREL_CALL))
+	      && !(TARGET_GAS && (TARGET_LONG_PIC_PCREL_CALL || local_call))
+	      && !TARGET_64BIT)
 	    indirect_call = 1;
 
 	  if (seq_length != 0
@@ -6900,12 +6932,13 @@ output_call (insn, call_dest, sibcall)
 	      delay_insn_deleted = 1;
 	    }
 
-	  if (TARGET_LONG_ABS_CALL && !flag_pic)
+	  if ((TARGET_LONG_ABS_CALL || local_call) && !flag_pic)
 	    {
 	      /* This is the best sequence for making long calls in
 		 non-pic code.  Unfortunately, GNU ld doesn't provide
 		 the stub needed for external calls, and GAS's support
-		 for this with the SOM linker is buggy.  */
+		 for this with the SOM linker is buggy.  It is safe
+		 to use this for local calls.  */
 	      output_asm_insn ("ldil L'%0,%%r1", xoperands);
 	      if (sibcall)
 		output_asm_insn ("be R'%0(%%sr4,%%r1)", xoperands);
@@ -6923,7 +6956,8 @@ output_call (insn, call_dest, sibcall)
 	    }
 	  else
 	    {
-	      if (TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
+	      if ((TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
+		  || (TARGET_64BIT && !TARGET_GAS))
 		{
 		  /* The HP assembler and linker can handle relocations
 		     for the difference of two symbols.  GAS and the HP
@@ -6936,7 +6970,7 @@ output_call (insn, call_dest, sibcall)
 					     CODE_LABEL_NUMBER (xoperands[1]));
 		  output_asm_insn ("ldo R'%0-%l1(%%r1),%%r1", xoperands);
 		}
-	      else if (TARGET_GAS && TARGET_LONG_PIC_PCREL_CALL)
+	      else if (TARGET_GAS && (TARGET_LONG_PIC_PCREL_CALL || local_call))
 		{
 		  /*  GAS currently can't generate the relocations that
 		      are needed for the SOM linker under HP-UX using this
@@ -7075,11 +7109,9 @@ output_call (insn, call_dest, sibcall)
 					     CODE_LABEL_NUMBER (xoperands[1]));
 	}
       else
-	/* ??? This branch may not reach its target.  */
 	output_asm_insn ("nop\n\tb,n %0", xoperands);
     }
   else
-    /* ??? This branch may not reach its target.  */
     output_asm_insn ("b,n %0", xoperands);
 
   /* Delete the jump.  */
@@ -7101,11 +7133,12 @@ attr_length_indirect_call (insn)
      rtx insn;
 {
   unsigned long distance = -1;
+  unsigned long total = in_text_section () ? total_code_bytes : 0;
 
   if (INSN_ADDRESSES_SET_P ())
     {
-      distance = (total_code_bytes + insn_current_reference_address (insn));
-      if (distance < total_code_bytes)
+      distance = (total + insn_current_reference_address (insn));
+      if (distance < total)
 	distance = -1;
     }
 
@@ -7280,81 +7313,239 @@ pa_asm_output_mi_thunk (file, thunk_fnde
      HOST_WIDE_INT vcall_offset ATTRIBUTE_UNUSED;
      tree function;
 {
-  const char *target_name = XSTR (XEXP (DECL_RTL (function), 0), 0);
+  const char *fname = XSTR (XEXP (DECL_RTL (function), 0), 0);
+  const char *tname = XSTR (XEXP (DECL_RTL (thunk_fndecl), 0), 0);
+  int val_14 = VAL_14_BITS_P (delta);
+  int nbytes = 0;
   static unsigned int current_thunk_number;
   char label[16];
-  const char *lab;
-  ASM_GENERATE_INTERNAL_LABEL (label, "LTHN", current_thunk_number);
-  lab = (*targetm.strip_name_encoding) (label);
-  target_name = (*targetm.strip_name_encoding) (target_name);
-  /* FIXME: total_code_bytes is not handled correctly in files with
-     mi thunks.  */
-  pa_output_function_prologue (file, 0);
-  if (VAL_14_BITS_P (delta))
-    {
-      if (!TARGET_64BIT && !TARGET_PORTABLE_RUNTIME && flag_pic)
-	{
-	  fprintf (file, "\taddil LT'%s,%%r19\n", lab);
-	  fprintf (file, "\tldw RT'%s(%%r1),%%r22\n", lab);
-	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
-	  fprintf (file, "\tbb,>=,n %%r22,30,.+16\n");
-	  fprintf (file, "\tdepi 0,31,2,%%r22\n");
-	  fprintf (file, "\tldw 4(%%sr0,%%r22),%%r19\n");
-	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
+
+  ASM_OUTPUT_LABEL (file, tname);
+  fprintf (file, "\t.PROC\n\t.CALLINFO FRAME=0,NO_CALLS\n\t.ENTRY\n");
+
+  fname = (*targetm.strip_name_encoding) (fname);
+  tname = (*targetm.strip_name_encoding) (tname);
+
+  /* Output the thunk.  We know that the function is in the same
+     translation unit (i.e., the same space) as the thunk, and that
+     thunks are output after their method.  Thus, we don't need an
+     external branch to reach the function.  With SOM and GAS,
+     functions and thunks are effectively in different sections.
+     Thus, we can always use a IA-relative branch and the linker
+     will add a long branch stub if necessary.
+
+     However, we have to be careful when generating PIC code on the
+     SOM port to ensure that the sequence does not transfer to an
+     import stub for the target function as this could clobber the
+     return value saved at SP-24.  This would also apply to the
+     32-bit linux port if the multi-space model is implemented.  */
+  if ((!TARGET_LONG_CALLS && TARGET_SOM && !TARGET_PORTABLE_RUNTIME
+       && !(flag_pic && TREE_PUBLIC (function))
+       && (TARGET_GAS || last_address < 262132))
+      || (!TARGET_LONG_CALLS && !TARGET_SOM && !TARGET_PORTABLE_RUNTIME
+	  && ((targetm.have_named_sections
+	       && DECL_SECTION_NAME (thunk_fndecl) != NULL
+	       /* The GNU 64-bit linker has rather poor stub management.
+		  So, we use a long branch from thunks that aren't in
+		  the same section as the target function.  */
+	       && ((!TARGET_64BIT
+		    && (DECL_SECTION_NAME (thunk_fndecl)
+			!= DECL_SECTION_NAME (function)))
+		   || ((DECL_SECTION_NAME (thunk_fndecl)
+			== DECL_SECTION_NAME (function))
+		       && last_address < 262132)))
+	      || (!targetm.have_named_sections && last_address < 262132))))
+    {
+      if (val_14)
+	{
+	  fprintf (file, "\tb %s\n\tldo " HOST_WIDE_INT_PRINT_DEC
+			 "(%%r26),%%r26\n", fname, delta);
+	  nbytes += 8;
+	}
+      else
+	{
+	  fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
+			 ",%%r26\n", delta);
+	  fprintf (file, "\tb %s\n\tldo R'" HOST_WIDE_INT_PRINT_DEC
+			 "(%%r1),%%r26\n", fname, delta);
+	  nbytes += 12;
+	}
+    }
+  else if (TARGET_64BIT)
+    {
+      /* We only have one call-clobbered scratch register, so we can't
+         make use of the delay slot if delta doesn't fit in 14 bits.  */
+      if (!val_14)
+	fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
+		       ",%%r26\n\tldo R'" HOST_WIDE_INT_PRINT_DEC
+		       "(%%r1),%%r26\n", delta, delta);
+
+      fprintf (file, "\tb,l .+8,%%r1\n");
+
+      if (TARGET_GAS)
+	{
+	  fprintf (file, "\taddil L'%s-$PIC_pcrel$0+4,%%r1\n", fname);
+	  fprintf (file, "\tldo R'%s-$PIC_pcrel$0+8(%%r1),%%r1\n", fname);
+	}
+      else
+	{
+	  int off = val_14 ? 8 : 16;
+	  fprintf (file, "\taddil L'%s-%s-%d,%%r1\n", fname, tname, off);
+	  fprintf (file, "\tldo R'%s-%s-%d(%%r1),%%r1\n", fname, tname, off);
+	}
+
+      if (val_14)
+	{
+	  fprintf (file, "\tbv %%r0(%%r1)\n\tldo ");
+	  fprintf (file, HOST_WIDE_INT_PRINT_DEC "(%%r26),%%r26\n", delta);
+	  nbytes += 20;
+	}
+      else
+	{
+	  fprintf (file, "\tbv,n %%r0(%%r1)\n");
+	  nbytes += 24;
+	}
+    }
+  else if (TARGET_PORTABLE_RUNTIME)
+    {
+      fprintf (file, "\tldil L'%s,%%r1\n", fname);
+      fprintf (file, "\tldo R'%s(%%r1),%%r22\n", fname);
+
+      if (val_14)
+	{
+	  fprintf (file, "\tbv %%r0(%%r22)\n\tldo ");
+	  fprintf (file, HOST_WIDE_INT_PRINT_DEC "(%%r26),%%r26\n", delta);
+	  nbytes += 16;
+	}
+      else
+	{
+	  fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
+			 ",%%r26\n", delta);
+	  fprintf (file, "\tbv %%r0(%%r22)\n\tldo ");
+	  fprintf (file, "R'" HOST_WIDE_INT_PRINT_DEC "(%%r1),%%r26\n", delta);
+	  nbytes += 20;
+	}
+    }
+  else if (TARGET_SOM && flag_pic && TREE_PUBLIC (function))
+    {
+      /* The function is accessible from outside this module.  The only
+	 way to avoid an import stub between the thunk and function is to
+	 call the function directly with an indirect sequence similar to
+	 that used by $$dyncall.  This is possible because $$dyncall acts
+	 as the import stub in an indirect call.  */
+      const char *lab;
+
+      ASM_GENERATE_INTERNAL_LABEL (label, "LTHN", current_thunk_number);
+      lab = (*targetm.strip_name_encoding) (label);
+
+      fprintf (file, "\taddil LT'%s,%%r19\n", lab);
+      fprintf (file, "\tldw RT'%s(%%r1),%%r22\n", lab);
+      fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
+      fprintf (file, "\tbb,>=,n %%r22,30,.+16\n");
+      fprintf (file, "\tdepi 0,31,2,%%r22\n");
+      fprintf (file, "\tldw 4(%%sr0,%%r22),%%r19\n");
+      fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
+      if (!val_14)
+	{
+	  fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
+			 ",%%r26\n", delta);
+	  nbytes += 4;
+	}
+      if (TARGET_PA_20)
+	{
+          fprintf (file, "\tbve (%%r22)\n\tldo ");
+	  nbytes += 36;
+	}
+      else
+	{
 	  if (TARGET_NO_SPACE_REGS)
-	    fprintf (file, "\tbe 0(%%sr4,%%r22)\n\tldo ");
+	    {
+	      fprintf (file, "\tbe 0(%%sr4,%%r22)\n\tldo ");
+	      nbytes += 36;
+	    }
 	  else
 	    {
 	      fprintf (file, "\tldsid (%%sr0,%%r22),%%r1\n");
-	      fprintf (file, "\tmtsp %%r1,%%sr0\n");
+	      fprintf (file, "\tmtsp %%r21,%%sr0\n");
 	      fprintf (file, "\tbe 0(%%sr0,%%r22)\n\tldo ");
+	      nbytes += 44;
 	    }
+	}
+
+      if (val_14)
+	fprintf (file, HOST_WIDE_INT_PRINT_DEC "(%%r26),%%r26\n", delta);
+      else
+	fprintf (file, "R'" HOST_WIDE_INT_PRINT_DEC "(%%r1),%%r26\n", delta);
+    }
+  else if (flag_pic)
+    {
+      if (TARGET_PA_20)
+	fprintf (file, "\tb,l .+8,%%r1\n");
+      else
+	fprintf (file, "\tbl .+8,%%r1\n");
+
+      if (TARGET_SOM || !TARGET_GAS)
+	{
+	  fprintf (file, "\taddil L'%s-%s-8,%%r1\n", fname, tname);
+	  fprintf (file, "\tldo R'%s-%s-8(%%r1),%%r22\n", fname, tname);
+	}
+      else
+	{
+	  fprintf (file, "\taddil L'%s-$PIC_pcrel$0+4,%%r1\n", fname);
+	  fprintf (file, "\tldo R'%s-$PIC_pcrel$0+8(%%r1),%%r22\n", fname);
+	}
+
+      if (val_14)
+	{
+	  fprintf (file, "\tbv %%r0(%%r22)\n\tldo ");
 	  fprintf (file, HOST_WIDE_INT_PRINT_DEC "(%%r26),%%r26\n", delta);
+	  nbytes += 20;
 	}
       else
-	fprintf (file, "\tb %s\n\tldo " HOST_WIDE_INT_PRINT_DEC
-		 "(%%r26),%%r26\n",
-		 target_name, delta);
+	{
+	  fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
+			 ",%%r26\n", delta);
+	  fprintf (file, "\tbv %%r0(%%r22)\n\tldo ");
+	  fprintf (file, "R'" HOST_WIDE_INT_PRINT_DEC "(%%r1),%%r26\n", delta);
+	  nbytes += 24;
+	}
     }
   else
     {
-      if (!TARGET_64BIT && !TARGET_PORTABLE_RUNTIME && flag_pic)
+      if (!val_14)
+	fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC ",%%r26\n", delta);
+
+      fprintf (file, "\tldil L'%s,%%r22\n", fname);
+      fprintf (file, "\tbe R'%s(%%sr4,%%r22)\n\tldo ", fname);
+
+      if (val_14)
 	{
-	  fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
-		   ",%%r26\n\tldo R'" HOST_WIDE_INT_PRINT_DEC "(%%r1),%%r26\n",
-		   delta, delta);
-	  fprintf (file, "\taddil LT'%s,%%r19\n", lab);
-	  fprintf (file, "\tldw RT'%s(%%r1),%%r22\n", lab);
-	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
-	  fprintf (file, "\tbb,>=,n %%r22,30,.+16\n");
-	  fprintf (file, "\tdepi 0,31,2,%%r22\n");
-	  fprintf (file, "\tldw 4(%%sr0,%%r22),%%r19\n");
-	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
-	  if (TARGET_NO_SPACE_REGS)
-	    fprintf (file, "\tbe 0(%%sr4,%%r22)");
-	  else
-	    {
-	      fprintf (file, "\tldsid (%%sr0,%%r22),%%r1\n");
-	      fprintf (file, "\tmtsp %%r1,%%sr0\n");
-	      fprintf (file, "\tbe,n 0(%%sr0,%%r22)\n");
-	    }
+	  fprintf (file, HOST_WIDE_INT_PRINT_DEC "(%%r26),%%r26\n", delta);
+	  nbytes += 12;
 	}
       else
-	fprintf (file, "\taddil L'" HOST_WIDE_INT_PRINT_DEC
-		 ",%%r26\n\tb %s\n\tldo R'" HOST_WIDE_INT_PRINT_DEC
-		 "(%%r1),%%r26\n", delta, target_name, delta);
+	{
+	  fprintf (file, "R'" HOST_WIDE_INT_PRINT_DEC "(%%r1),%%r26\n", delta);
+	  nbytes += 16;
+	}
     }
-    
+
   fprintf (file, "\t.EXIT\n\t.PROCEND\n");
-  if (! TARGET_64BIT && ! TARGET_PORTABLE_RUNTIME && flag_pic)
+
+  if (TARGET_SOM && flag_pic && TREE_PUBLIC (function))
     {
       data_section ();
       fprintf (file, "\t.align 4\n");
-      (*targetm.asm_out.internal_label) (file, "LTHN", current_thunk_number);
-      fprintf (file, "\t.word P'%s\n", target_name);
+      ASM_OUTPUT_LABEL (file, label);
+      fprintf (file, "\t.word P'%s\n", fname);
       function_section (thunk_fndecl);
     }
+
   current_thunk_number++;
+  nbytes = ((nbytes + FUNCTION_BOUNDARY / BITS_PER_UNIT - 1)
+	    & ~(FUNCTION_BOUNDARY / BITS_PER_UNIT - 1));
+  last_address += nbytes;
+  update_total_code_bytes (nbytes);
 }
 
 /* Only direct calls to static functions are allowed to be sibling (tail)
