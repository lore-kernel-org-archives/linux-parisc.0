Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0548B4830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:36:27 -0600 (MDT)
Message-Id: <200210221536.g9MFaIjM020404@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
To: mszick@goquest.com (Michael S.Zick)
Date: Tue, 22 Oct 2002 11:36:17 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, grundler@dsl2.external.hp.com,
	joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
In-Reply-To: <02102210021702.00736@localhost.localdomain> from "Michael S.Zick" at Oct 22, 2002 10:02:17 am
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

> On Monday 21 October 2002 11:46 am, John David Anglin wrote:
> > > it sounds like a gcc bug:
> >
> > What does a gcc bug sound like ;-)
> >
> > Dave
> It is an indirect call (Telepathic) -
> You have to listen for its echo from the programmer's mouth.

Ah, something I have been working on ...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Index: config/pa/pa-64.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa-64.h,v
retrieving revision 1.12
diff -u -3 -p -r1.12 pa-64.h
--- config/pa/pa-64.h	17 Sep 2002 03:30:37 -0000	1.12
+++ config/pa/pa-64.h	22 Oct 2002 14:04:18 -0000
@@ -1,6 +1,6 @@
 /* Definitions of target machine for GNU compiler, for HPs using the
    64bit runtime model.
-   Copyright (C) 1999, 2000 Free Software Foundation, Inc.
+   Copyright (C) 1999, 2000, 2002 Free Software Foundation, Inc.
 
 This file is part of GNU CC.
 
@@ -76,17 +76,24 @@ Boston, MA 02111-1307, USA.  */
    ?!? This may not work reliably.  Keep an eye out for problems.  */
 #undef SECONDARY_MEMORY_NEEDED_RTX
 
-
 /* ?!? This needs to be made compile-time selectable.
 
    The PA64 runtime model has arguments that grow to higher addresses
    (like most other targets).  The older runtime model has arguments
    that grow to lower addresses.  What fun.  */
 #undef ARGS_GROW_DOWNWARD
-#undef ARG_POINTER_REGNUM
-#define ARG_POINTER_REGNUM 29
-#undef STATIC_CHAIN_REGNUM
-#define STATIC_CHAIN_REGNUM 31
+
+/* Sibling calls should be ok.  They appear to provide a small performance
+   improvement.
+
+   FIXME: There are problems with out-of-range sibcalls using GNU ld.
+   As a temporary workaround, only enable sibcalls when not using GNU
+   ld or when TARGET_LONG_CALLS is true.  GNU ld needs to be fixed to
+   check the distance from the call site to the stub.  It also needs
+   to do a better job placing stubs.  The same problem applies to
+   regular calls but is less severe.  */
+#undef FUNCTION_OK_FOR_SIBCALL
+#define FUNCTION_OK_FOR_SIBCALL(DECL) (!TARGET_GNU_LD || TARGET_LONG_CALLS)
 
 /* If defined, a C expression which determines whether the default
    implementation of va_arg will attempt to pad down before reading the
Index: config/pa/pa-linux.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa-linux.h,v
retrieving revision 1.26
diff -u -3 -p -r1.26 pa-linux.h
--- config/pa/pa-linux.h	3 Oct 2002 04:05:54 -0000	1.26
+++ config/pa/pa-linux.h	22 Oct 2002 14:04:18 -0000
@@ -196,6 +196,19 @@ Boston, MA 02111-1307, USA.  */
     }								\
   while (0)
 
+/* As well as globalizing the label, we need to encode the label
+   to ensure a plabel is generated in an indirect call.  */
+
+#undef ASM_OUTPUT_EXTERNAL_LIBCALL
+#define ASM_OUTPUT_EXTERNAL_LIBCALL(FILE, FUN)  		\
+  do								\
+    {								\
+      if (!FUNCTION_NAME_P (XSTR (FUN, 0)))			\
+	hppa_encode_label (FUN);				\
+      (*targetm.asm_out.globalize_label) (FILE, XSTR (FUN, 0));	\
+    }								\
+  while (0)
+
 /* Linux always uses gas.  */
 #undef TARGET_GAS
 #define TARGET_GAS 1
Index: config/pa/pa-protos.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa-protos.h,v
retrieving revision 1.18
diff -u -3 -p -r1.18 pa-protos.h
--- config/pa/pa-protos.h	20 Oct 2002 22:37:12 -0000	1.18
+++ config/pa/pa-protos.h	22 Oct 2002 14:04:18 -0000
@@ -105,6 +105,8 @@ extern int jump_in_call_delay PARAMS ((r
 extern enum reg_class secondary_reload_class PARAMS ((enum reg_class,
 						      enum machine_mode, rtx));
 extern int hppa_fpstore_bypass_p PARAMS ((rtx, rtx));
+extern int attr_length_millicode_call PARAMS ((rtx, int));
+extern int attr_length_call PARAMS ((rtx, int));
 
 /* Declare functions defined in pa.c and used in templates.  */
 
Index: config/pa/pa.c
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa.c,v
retrieving revision 1.183
diff -u -3 -p -r1.183 pa.c
--- config/pa/pa.c	20 Oct 2002 22:37:12 -0000	1.183
+++ config/pa/pa.c	22 Oct 2002 14:04:19 -0000
@@ -95,6 +95,7 @@ hppa_fpstore_bypass_p (out_insn, in_insn
 #endif
 #endif
 
+static struct machine_function * pa_init_machine_status PARAMS ((void));
 static inline rtx force_mode PARAMS ((enum machine_mode, rtx));
 static void pa_combine_instructions PARAMS ((rtx));
 static int pa_can_combine_p PARAMS ((rtx, rtx, rtx, int, rtx, rtx, rtx));
@@ -120,7 +121,16 @@ static const char *pa_strip_name_encodin
 static void pa_globalize_label PARAMS ((FILE *, const char *))
      ATTRIBUTE_UNUSED;
 static void pa_asm_output_mi_thunk PARAMS ((FILE *, tree, HOST_WIDE_INT, tree));
+static void copy_fp_args PARAMS ((rtx))
+     ATTRIBUTE_UNUSED;
+static int length_fp_args PARAMS ((rtx))
+     ATTRIBUTE_UNUSED;
+static struct deferred_plabel *get_plabel PARAMS ((const char *))
+     ATTRIBUTE_UNUSED;
 
+/* Unique rtx for the incoming arg pointer register.  */
+
+rtx arg_pointer_incoming_rtx;
 
 /* Save the operands last given to a compare for use when we
    generate a scc or bcc insn.  */
@@ -149,7 +159,7 @@ static rtx find_addr_reg PARAMS ((rtx));
 /* Keep track of the number of bytes we have output in the CODE subspaces
    during this compilation so we'll know when to emit inline long-calls.  */
 
-unsigned int total_code_bytes;
+unsigned long total_code_bytes;
 
 /* Variables to handle plabels that we discover are necessary at assembly
    output time.  They are output after the current function.  */
@@ -202,6 +212,16 @@ static size_t n_deferred_plabels = 0;
 
 struct gcc_target targetm = TARGET_INITIALIZER;
 
+static struct machine_function *
+pa_init_machine_status ()
+{
+  if (arg_pointer_incoming_rtx == 0)
+    arg_pointer_incoming_rtx
+      = gen_rtx_REG (Pmode, ARG_POINTER_INCOMING_REGNUM);
+
+  return NULL;
+}
+
 void
 override_options ()
 {
@@ -286,7 +306,7 @@ override_options ()
       warning ("PIC code generation is not compatible with fast indirect calls\n");
    }
 
-  if (! TARGET_GAS && write_symbols != NO_DEBUG)
+  if (!TARGET_GAS && write_symbols != NO_DEBUG)
     {
       warning ("-g is only supported when using GAS on this processor,");
       warning ("-g option disabled");
@@ -309,6 +329,9 @@ override_options ()
       targetm.asm_out.unaligned_op.si = NULL;
       targetm.asm_out.unaligned_op.di = NULL;
     }
+
+  if (TARGET_64BIT)
+    init_machine_status = pa_init_machine_status;
 }
 
 /* Return nonzero only if OP is a register of mode MODE,
@@ -3105,7 +3128,7 @@ compute_frame_size (size, fregs_live)
 
   /* Account for space used by the callee general register saves.  */
   for (i = 18; i >= 3; i--)
-    if (regs_ever_live[i])
+    if (regs_ever_live[i] && !call_really_used_regs[i])
       fsize += UNITS_PER_WORD;
 
   /* Round the stack.  */
@@ -3194,14 +3217,14 @@ pa_output_function_prologue (file, size)
   fputs ("\n\t.ENTRY\n", file);
 
   /* If we're using GAS and SOM, and not using the portable runtime model,
-     then we don't need to accumulate the total number of code bytes.  */
+     or function sections, then we don't need to accumulate the total number
+     of code bytes.  */
   if ((TARGET_GAS && TARGET_SOM && ! TARGET_PORTABLE_RUNTIME)
-      /* FIXME: we can't handle long calls for TARGET_64BIT.  */
-      || TARGET_64BIT)
+      || flag_function_sections)
     total_code_bytes = 0;
   else if (INSN_ADDRESSES_SET_P ())
     {
-      unsigned int old_total = total_code_bytes;
+      unsigned long old_total = total_code_bytes;
 
       total_code_bytes += INSN_ADDRESSES (INSN_UID (get_last_nonnote_insn ()));
       total_code_bytes += FUNCTION_BOUNDARY / BITS_PER_UNIT;
@@ -3344,7 +3367,7 @@ hppa_expand_prologue ()
 	}
 
       for (i = 18; i >= 4; i--)
-	if (regs_ever_live[i] && ! call_used_regs[i])
+	if (regs_ever_live[i] && !call_really_used_regs[i])
 	  {
 	    store_reg (i, offset, FRAME_POINTER_REGNUM);
 	    offset += UNITS_PER_WORD;
@@ -3384,7 +3407,7 @@ hppa_expand_prologue ()
 	}
 
       for (i = 18; i >= 3; i--)
-      	if (regs_ever_live[i] && ! call_used_regs[i])
+	if (regs_ever_live[i] && !call_really_used_regs[i])
 	  {
 	    /* If merge_sp_adjust_with_store is nonzero, then we can
 	       optimize the first GR save.  */
@@ -3485,6 +3508,14 @@ hppa_expand_prologue ()
 	}
     }
 
+#ifdef ARG_POINTER_INCOMING_REGNUM
+  if (ARG_POINTER_REGNUM != ARG_POINTER_INCOMING_REGNUM
+      && regs_ever_live[ARG_POINTER_REGNUM])
+    {
+      emit_move_insn (arg_pointer_rtx, arg_pointer_incoming_rtx);
+    }
+#endif
+
   /* FIXME: expand_call and expand_millicode_call need to be fixed to
      prevent insns with frame notes being scheduled in the delay slot
      of calls.  This causes problems because the dwarf2 output code
@@ -3617,7 +3648,7 @@ hppa_expand_epilogue ()
 	}
 
       for (i = 18; i >= 4; i--)
-	if (regs_ever_live[i] && ! call_used_regs[i])
+	if (regs_ever_live[i] && !call_really_used_regs[i])
 	  {
 	    load_reg (i, offset, FRAME_POINTER_REGNUM);
 	    offset += UNITS_PER_WORD;
@@ -3654,7 +3685,7 @@ hppa_expand_epilogue ()
 
       for (i = 18; i >= 3; i--)
 	{
-	  if (regs_ever_live[i] && ! call_used_regs[i])
+	  if (regs_ever_live[i] && !call_really_used_regs[i])
 	    {
 	      /* Only for the first load.
 	         merge_sp_adjust_with_load holds the register load
@@ -3755,7 +3786,7 @@ hppa_profile_hook (label_no)
   begin_label_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (begin_label_name));
 
   if (TARGET_64BIT)
-    emit_move_insn (arg_pointer_rtx,
+    emit_move_insn (arg_pointer_incoming_rtx,
 		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
 				  GEN_INT (64)));
 
@@ -3798,7 +3829,8 @@ hppa_profile_hook (label_no)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
       if (TARGET_64BIT)
-	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
+	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
+		 arg_pointer_incoming_rtx);
 
       emit_move_insn (pic_offset_table_rtx, hppa_pic_save_rtx ());
     }
@@ -4723,6 +4755,47 @@ output_global_address (file, x, round_co
     output_addr_const (file, x);
 }
 
+static struct deferred_plabel *
+get_plabel (fname)
+     const char *fname;
+{
+  size_t i;
+
+  /* See if we have already put this function on the list of deferred
+     plabels.  This list is generally small, so a liner search is not
+     too ugly.  If it proves too slow replace it with something faster.  */
+  for (i = 0; i < n_deferred_plabels; i++)
+    if (strcmp (fname, deferred_plabels[i].name) == 0)
+      break;
+
+  /* If the deferred plabel list is empty, or this entry was not found
+     on the list, create a new entry on the list.  */
+  if (deferred_plabels == NULL || i == n_deferred_plabels)
+    {
+      const char *real_name;
+
+      if (deferred_plabels == 0)
+	deferred_plabels = (struct deferred_plabel *)
+	  ggc_alloc (sizeof (struct deferred_plabel));
+      else
+	deferred_plabels = (struct deferred_plabel *)
+	  ggc_realloc (deferred_plabels,
+		       ((n_deferred_plabels + 1)
+			* sizeof (struct deferred_plabel)));
+
+      i = n_deferred_plabels++;
+      deferred_plabels[i].internal_label = gen_label_rtx ();
+      deferred_plabels[i].name = ggc_strdup (fname);
+
+      /* Gross.  We have just implicitly taken the address of this function,
+	 mark it as such.  */
+      real_name = (*targetm.strip_name_encoding) (fname);
+      TREE_SYMBOL_REFERENCED (get_identifier (real_name)) = 1;
+    }
+
+  return &deferred_plabels[i];
+}
+
 void
 output_deferred_plabels (file)
      FILE *file;
@@ -4734,7 +4807,7 @@ output_deferred_plabels (file)
   if (n_deferred_plabels)
     {
       data_section ();
-      ASM_OUTPUT_ALIGN (file, 2);
+      ASM_OUTPUT_ALIGN (file, TARGET_64BIT ? 3 : 2);
     }
 
   /* Now output the deferred plabels.  */
@@ -5141,13 +5214,9 @@ hppa_builtin_saveregs ()
 		       != void_type_node)))
 		? UNITS_PER_WORD : 0);
 
-  if (argadj)
-    offset = plus_constant (current_function_arg_offset_rtx, argadj);
-  else
-    offset = current_function_arg_offset_rtx;
-
   if (TARGET_64BIT)
     {
+      rtx pa64_arg_pointer_rtx = plus_constant (arg_pointer_rtx, -64);
       int i, off;
 
       /* Adjust for varargs/stdarg differences.  */
@@ -5163,19 +5232,24 @@ hppa_builtin_saveregs ()
 				     plus_constant (arg_pointer_rtx, off)),
 			gen_rtx_REG (word_mode, i));
 
+#if 0
       /* The incoming args pointer points just beyond the flushback area;
 	 normally this is not a serious concern.  However, when we are doing
 	 varargs/stdargs we want to make the arg pointer point to the start
 	 of the incoming argument area.  */
-      emit_move_insn (virtual_incoming_args_rtx,
-		      plus_constant (arg_pointer_rtx, -64));
+      emit_move_insn (virtual_incoming_args_rtx, pa64_arg_pointer_rtx);
+#endif
 
       /* Now return a pointer to the first anonymous argument.  */
-      return copy_to_reg (expand_binop (Pmode, add_optab,
-					virtual_incoming_args_rtx,
+      return copy_to_reg (expand_binop (Pmode, add_optab, pa64_arg_pointer_rtx,
 					offset, 0, 0, OPTAB_LIB_WIDEN));
     }
 
+  if (argadj)
+    offset = plus_constant (current_function_arg_offset_rtx, argadj);
+  else
+    offset = current_function_arg_offset_rtx;
+
   /* Store general registers on the stack.  */
   dest = gen_rtx_MEM (BLKmode,
 		      plus_constant (current_function_internal_arg_pointer,
@@ -5320,9 +5394,9 @@ hppa_va_arg (valist, type)
 
 const char *
 output_cbranch (operands, nullify, length, negated, insn)
-  rtx *operands;
-  int nullify, length, negated;
-  rtx insn;
+     rtx *operands;
+     int nullify, length, negated;
+     rtx insn;
 {
   static char buf[100];
   int useskip = 0;
@@ -5496,12 +5570,11 @@ output_cbranch (operands, nullify, lengt
 	  xoperands[1] = operands[1];
 	  xoperands[2] = operands[2];
 	  xoperands[3] = operands[3];
-	  if (TARGET_SOM || ! TARGET_GAS)
-	    xoperands[4] = gen_label_rtx ();
 
 	  output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
-	  if (TARGET_SOM || ! TARGET_GAS)
+	  if (!TARGET_GAS)
 	    {
+	      xoperands[4] = gen_label_rtx ();
 	      output_asm_insn ("addil L'%l0-%l4,%%r1", xoperands);
 	      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
 					 CODE_LABEL_NUMBER (xoperands[4]));
@@ -5533,10 +5606,10 @@ output_cbranch (operands, nullify, lengt
 
 const char *
 output_bb (operands, nullify, length, negated, insn, which)
-  rtx *operands ATTRIBUTE_UNUSED;
-  int nullify, length, negated;
-  rtx insn;
-  int which;
+     rtx *operands ATTRIBUTE_UNUSED;
+     int nullify, length, negated;
+     rtx insn;
+     int which;
 {
   static char buf[100];
   int useskip = 0;
@@ -5681,10 +5754,10 @@ output_bb (operands, nullify, length, ne
 
 const char *
 output_bvb (operands, nullify, length, negated, insn, which)
-  rtx *operands ATTRIBUTE_UNUSED;
-  int nullify, length, negated;
-  rtx insn;
-  int which;
+     rtx *operands ATTRIBUTE_UNUSED;
+     int nullify, length, negated;
+     rtx insn;
+     int which;
 {
   static char buf[100];
   int useskip = 0;
@@ -6040,442 +6113,594 @@ output_movb (operands, insn, which_alter
     }
 }
 
+/* Copy any FP arguments in INSN into integer registers.  */
+static void
+copy_fp_args (insn)
+     rtx insn;
+{
+  rtx link;
+  rtx xoperands[2];
 
-/* INSN is a millicode call.  It may have an unconditional jump in its delay
-   slot.
+  for (link = CALL_INSN_FUNCTION_USAGE (insn); link; link = XEXP (link, 1))
+    {
+      int arg_mode, regno;
+      rtx use = XEXP (link, 0);
 
-   CALL_DEST is the routine we are calling.  */
+      if (! (GET_CODE (use) == USE
+	  && GET_CODE (XEXP (use, 0)) == REG
+	  && FUNCTION_ARG_REGNO_P (REGNO (XEXP (use, 0)))))
+	continue;
 
-const char *
-output_millicode_call (insn, call_dest)
-  rtx insn;
-  rtx call_dest;
-{
-  int attr_length = get_attr_length (insn);
-  int seq_length = dbr_sequence_length ();
-  int distance;
-  rtx xoperands[4];
-  rtx seq_insn;
+      arg_mode = GET_MODE (XEXP (use, 0));
+      regno = REGNO (XEXP (use, 0));
+
+      /* Is it a floating point register?  */
+      if (regno >= 32 && regno <= 39)
+	{
+	  /* Copy the FP register into an integer register via memory.  */
+	  if (arg_mode == SFmode)
+	    {
+	      xoperands[0] = XEXP (use, 0);
+	      xoperands[1] = gen_rtx_REG (SImode, 26 - (regno - 32) / 2);
+	      output_asm_insn ("{fstws|fstw} %0,-16(%%sr0,%%r30)", xoperands);
+	      output_asm_insn ("ldw -16(%%sr0,%%r30),%1", xoperands);
+	    }
+	  else
+	    {
+	      xoperands[0] = XEXP (use, 0);
+	      xoperands[1] = gen_rtx_REG (DImode, 25 - (regno - 34) / 2);
+	      output_asm_insn ("{fstds|fstd} %0,-16(%%sr0,%%r30)", xoperands);
+	      output_asm_insn ("ldw -12(%%sr0,%%r30),%R1", xoperands);
+	      output_asm_insn ("ldw -16(%%sr0,%%r30),%1", xoperands);
+	    }
+	}
+    }
+}
 
-  xoperands[3] = gen_rtx_REG (Pmode, TARGET_64BIT ? 2 : 31);
+/* Compute length of the FP argument copy sequence for INSN.  */
+static int
+length_fp_args (insn)
+     rtx insn;
+{
+  int length = 0;
+  rtx link;
 
-  /* Handle common case -- empty delay slot or no jump in the delay slot,
-     and we're sure that the branch will reach the beginning of the $CODE$
-     subspace.  The within reach form of the $$sh_func_adrs call has
-     a length of 28 and attribute type of multi.  This length is the
-     same as the maximum length of an out of reach PIC call to $$div.  */
-  if ((seq_length == 0
-       && (attr_length == 8
-	   || (attr_length == 28 && get_attr_type (insn) == TYPE_MULTI)))
-      || (seq_length != 0
-	  && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
-	  && attr_length == 4))
+  for (link = CALL_INSN_FUNCTION_USAGE (insn); link; link = XEXP (link, 1))
     {
-      xoperands[0] = call_dest;
-      output_asm_insn ("{bl|b,l} %0,%3%#", xoperands);
-      return "";
+      int arg_mode, regno;
+      rtx use = XEXP (link, 0);
+
+      if (! (GET_CODE (use) == USE
+	  && GET_CODE (XEXP (use, 0)) == REG
+	  && FUNCTION_ARG_REGNO_P (REGNO (XEXP (use, 0)))))
+	continue;
+
+      arg_mode = GET_MODE (XEXP (use, 0));
+      regno = REGNO (XEXP (use, 0));
+
+      /* Is it a floating point register?  */
+      if (regno >= 32 && regno <= 39)
+	{
+	  if (arg_mode == SFmode)
+	    length += 8;
+	  else
+	    length += 12;
+	}
     }
 
-  /* This call may not reach the beginning of the $CODE$ subspace.  */
-  if (attr_length > 8)
+  return length;
+}
+
+/* We include the delay slot in the returned length as it is better to
+   over estimate the length than to under estimate it.  */
+
+int
+attr_length_millicode_call (insn, length)
+     rtx insn;
+     int length;
+{
+  unsigned long distance = total_code_bytes + INSN_ADDRESSES (INSN_UID (insn));
+
+  if (distance < total_code_bytes)
+    distance = -1;
+
+  if (TARGET_64BIT)
     {
-      int delay_insn_deleted = 0;
+      if (!TARGET_LONG_CALLS && distance < 7600000)
+	return length + 8;
 
-      /* We need to emit an inline long-call branch.  */
-      if (seq_length != 0
-	  && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN)
-	{
-	  /* A non-jump insn in the delay slot.  By definition we can
-	     emit this insn before the call.  */
-	  final_scan_insn (NEXT_INSN (insn), asm_out_file, optimize, 0, 0);
+      return length + 20;
+    }
+  else if (TARGET_PORTABLE_RUNTIME)
+    return length + 24;
+  else
+    {
+      if (!TARGET_LONG_CALLS && distance < 240000)
+	return length + 8;
 
-	  /* Now delete the delay insn.  */
-	  PUT_CODE (NEXT_INSN (insn), NOTE);
-	  NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
-	  NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
-	  delay_insn_deleted = 1;
-	}
+      if (TARGET_LONG_ABS_CALL && !flag_pic)
+	return length + 12;
 
-      /* PIC long millicode call sequence.  */
-      if (flag_pic)
-	{
-	  xoperands[0] = call_dest;
-	  if (TARGET_SOM || ! TARGET_GAS)
-	    xoperands[1] = gen_label_rtx ();
+      return length + 24;
+    }
+}
 
-	  /* Get our address + 8 into %r1.  */
-	  output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+/* INSN is a function call.  It may have an unconditional jump
+   in its delay slot.
 
-	  if (TARGET_SOM || ! TARGET_GAS)
-	    {
-	      /* Add %r1 to the offset of our target from the next insn.  */
-	      output_asm_insn ("addil L%%%0-%1,%%r1", xoperands);
-	      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
-					 CODE_LABEL_NUMBER (xoperands[1]));
-	      output_asm_insn ("ldo R%%%0-%1(%%r1),%%r1", xoperands);
-	    }
-	  else
-	    {
-	      output_asm_insn ("addil L%%%0-$PIC_pcrel$0+4,%%r1", xoperands);
-	      output_asm_insn ("ldo R%%%0-$PIC_pcrel$0+8(%%r1),%%r1",
-			       xoperands);
-	    }
+   CALL_DEST is the routine we are calling.  */
 
-	  /* Get the return address into %r31.  */
-	  output_asm_insn ("blr 0,%3", xoperands);
+const char *
+output_millicode_call (insn, call_dest)
+     rtx insn;
+     rtx call_dest;
+{
+  int attr_length = get_attr_length (insn);
+  int seq_length = dbr_sequence_length ();
+  int distance;
+  rtx seq_insn;
+  rtx xoperands[3];
 
-	  /* Branch to our target which is in %r1.  */
-	  output_asm_insn ("bv,n %%r0(%%r1)", xoperands);
+  xoperands[0] = call_dest;
+  xoperands[2] = gen_rtx_REG (Pmode, TARGET_64BIT ? 2 : 31);
 
-	  /* Empty delay slot.  Note this insn gets fetched twice and
-	     executed once.  To be safe we use a nop.  */
-	  output_asm_insn ("nop", xoperands);
+  /* Handle the common case where we are sure that the branch will
+     reach the beginning of the $CODE$ subspace.  The within reach
+     form of the $$sh_func_adrs call has a length of 28 and attribute
+     type of multi.  This length is the same length as certain
+     out of reach PIC calls to other routines.  The $$sh_func_adrs
+     call never has an insn in the delay slot.  */
+  if (!TARGET_LONG_CALLS
+      && ((seq_length == 0
+	   && (attr_length == 12
+	       || (attr_length == 32 && get_attr_type (insn) == TYPE_MULTI)))
+	  || (seq_length != 0 && attr_length == 8)))
+    {
+      output_asm_insn ("{bl|b,l} %0,%2", xoperands);
+    }
+  else
+    {
+      if (TARGET_64BIT)
+	{
+	  /* It might seem that one insn could be saved by accessing
+	     the millicode function using the linkage table.  However,
+	     this doesn't work in shared libraries and other dynamically
+	     loaded objects.  Using a pc-relative sequence also avoids
+	     problems related to the implicit use of the gp register.  */
+	  output_asm_insn ("b,l .+8,%%r1", xoperands);
+	  output_asm_insn ("addil L'%0-$PIC_pcrel$0+4,%%r1", xoperands);
+	  output_asm_insn ("ldo R'%0-$PIC_pcrel$0+8(%%r1),%%r1", xoperands);
+	  output_asm_insn ("bve,l (%%r1),%%r2", xoperands);
 	}
-      /* Pure portable runtime doesn't allow be/ble; we also don't have
-	 PIC support in the assembler/linker, so this sequence is needed.  */
       else if (TARGET_PORTABLE_RUNTIME)
 	{
-	  xoperands[0] = call_dest;
-	  /* Get the address of our target into %r29.  */
-	  output_asm_insn ("ldil L%%%0,%%r29", xoperands);
-	  output_asm_insn ("ldo R%%%0(%%r29),%%r29", xoperands);
+	  /* Pure portable runtime doesn't allow be/ble; we also don't
+	     have PIC support in the assembler/linker, so this sequence
+	     is needed.  */
+
+	  /* Get the address of our target into %r1.  */
+	  output_asm_insn ("ldil L'%0,%%r1", xoperands);
+	  output_asm_insn ("ldo R'%0(%%r1),%%r1", xoperands);
 
 	  /* Get our return address into %r31.  */
-	  output_asm_insn ("blr %%r0,%3", xoperands);
+	  output_asm_insn ("{bl|b,l} .+8,%%r31", xoperands);
+	  output_asm_insn ("addi 8,%%r31,%%r31", xoperands);
 
-	  /* Jump to our target address in %r29.  */
-	  output_asm_insn ("bv,n %%r0(%%r29)", xoperands);
-
-	  /* Empty delay slot.  Note this insn gets fetched twice and
-	     executed once.  To be safe we use a nop.  */
-	  output_asm_insn ("nop", xoperands);
+	  /* Jump to our target address in %r1.  */
+	  output_asm_insn ("bv %%r0(%%r1)", xoperands);
 	}
-      /* If we're allowed to use be/ble instructions, then this is the
-	 best sequence to use for a long millicode call.  */
-      else
+      else if (!flag_pic)
 	{
-	  xoperands[0] = call_dest;
-	  output_asm_insn ("ldil L%%%0,%3", xoperands);
+	  output_asm_insn ("ldil L'%0,%%r1", xoperands);
 	  if (TARGET_PA_20)
-	    output_asm_insn ("be,l R%%%0(%%sr4,%3),%%sr0,%%r31", xoperands);
+	    output_asm_insn ("be,l R'%0(%%sr4,%%r1),%%sr0,%%r31", xoperands);
 	  else
-	    output_asm_insn ("ble R%%%0(%%sr4,%3)", xoperands);
-	  output_asm_insn ("nop", xoperands);
+	    output_asm_insn ("ble R'%0(%%sr4,%%r1)", xoperands);
 	}
-
-      /* If we had a jump in the call's delay slot, output it now.  */
-      if (seq_length != 0 && !delay_insn_deleted)
+      else
 	{
-	  xoperands[0] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
-	  output_asm_insn ("b,n %0", xoperands);
+	  if (TARGET_SOM || !TARGET_GAS)
+	    {
+	      /* The HP assembler can generate relocations for the
+		 difference of two symbols.  GAS can do this for a
+		 millicode symbol but not an arbitrary external
+		 symbol when generating SOM output.  */
+	      xoperands[1] = gen_label_rtx ();
+	      output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+	      output_asm_insn ("addi 16,%%r1,%%r31", xoperands);
+	      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
+					 CODE_LABEL_NUMBER (xoperands[1]));
+	      output_asm_insn ("addil L'%0-%l1,%%r1", xoperands);
+	      output_asm_insn ("ldo R'%0-%l1(%%r1),%%r1", xoperands);
+	    }
+	  else
+	    {
+	      output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+	      output_asm_insn ("addi 16,%%r1,%%r31", xoperands);
+	      output_asm_insn ("addil L'%0-$PIC_pcrel$0+8,%%r1", xoperands);
+	      output_asm_insn ("ldo R'%0-$PIC_pcrel$0+12(%%r1),%%r1",
+			       xoperands);
+	    }
 
-	  /* Now delete the delay insn.  */
-	  PUT_CODE (NEXT_INSN (insn), NOTE);
-	  NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
-	  NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+	  /* Jump to our target address in %r1.  */
+	  output_asm_insn ("bv %%r0(%%r1)", xoperands);
 	}
-      return "";
     }
 
-  /* This call has an unconditional jump in its delay slot and the
-     call is known to reach its target or the beginning of the current
-     subspace.  */
-
-  /* Use the containing sequence insn's address.  */
-  seq_insn = NEXT_INSN (PREV_INSN (XVECEXP (final_sequence, 0, 0)));
+  if (seq_length == 0)
+    output_asm_insn ("nop", xoperands);
 
-  distance = INSN_ADDRESSES (INSN_UID (JUMP_LABEL (NEXT_INSN (insn))))
-	       - INSN_ADDRESSES (INSN_UID (seq_insn)) - 8;
+  /* We are done if there isn't a jump in the delay slot.  */
+  if (seq_length == 0 || GET_CODE (NEXT_INSN (insn)) != JUMP_INSN)
+    return "";
 
-  /* If the branch was too far away, emit a normal call followed
-     by a nop, followed by the unconditional branch.
+  /* This call has an unconditional jump in its delay slot.  */
+  xoperands[0] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
 
-     If the branch is close, then adjust %r2 from within the
-     call's delay slot.  */
+  /* See if the return address can be adjusted.  Use the containing
+     sequence insn's address.  */
+  seq_insn = NEXT_INSN (PREV_INSN (XVECEXP (final_sequence, 0, 0)));
+  distance = (INSN_ADDRESSES (INSN_UID (JUMP_LABEL (NEXT_INSN (insn))))
+	      - INSN_ADDRESSES (INSN_UID (seq_insn)) - 8);
 
-  xoperands[0] = call_dest;
-  xoperands[1] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
-  if (! VAL_14_BITS_P (distance))
-    output_asm_insn ("{bl|b,l} %0,%3\n\tnop\n\tb,n %1", xoperands);
-  else
+  if (VAL_14_BITS_P (distance))
     {
-      xoperands[2] = gen_label_rtx ();
-      output_asm_insn ("\n\t{bl|b,l} %0,%3\n\tldo %1-%2(%3),%3",
-		       xoperands);
+      xoperands[1] = gen_label_rtx ();
+      output_asm_insn ("ldo %0-%1(%2),%2", xoperands);
       ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
-				 CODE_LABEL_NUMBER (xoperands[2]));
+				 CODE_LABEL_NUMBER (xoperands[3]));
     }
+  else
+    /* ??? This branch may not reach its target.  */
+    output_asm_insn ("nop\n\tb,n %0", xoperands);
 
   /* Delete the jump.  */
   PUT_CODE (NEXT_INSN (insn), NOTE);
   NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
   NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+
   return "";
 }
 
-/* INSN is either a function call.  It may have an unconditional jump
+/* We include the delay slot in the returned length as it is better to
+   over estimate the length than to under estimate it.  */
+
+int
+attr_length_call (insn, sibcall)
+     rtx insn;
+     int sibcall;
+{
+  unsigned long distance = total_code_bytes + INSN_ADDRESSES (INSN_UID (insn));
+
+  if (distance < total_code_bytes)
+    distance = -1;
+
+  if (TARGET_64BIT)
+    {
+      if (!TARGET_LONG_CALLS
+	  && ((sibcall && distance < 240000) || distance < 7600000))
+	return 8;
+
+      return (sibcall ? 28 : 24);
+    }
+  else
+    {
+      if (!TARGET_LONG_CALLS
+	  && ((TARGET_PA_20 && !sibcall && distance < 7600000)
+	      || distance < 240000))
+	return 8;
+
+      if (TARGET_LONG_ABS_CALL && !flag_pic)
+	return 12;
+
+      if ((TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
+	  || (TARGET_GAS && TARGET_LONG_PIC_PCREL_CALL))
+	{
+	  if (TARGET_PA_20)
+	    return 20;
+
+	  return 28;
+	}
+      else
+	{
+	  int length = 0;
+
+	  if (TARGET_SOM)
+	    length += length_fp_args (insn);
+
+	  if (flag_pic)
+	    length += 4;
+
+	  if (TARGET_PA_20)
+	    return (length + 32);
+
+	  if (!sibcall)
+	    length += 8;
+
+	  return (length + 40);
+	}
+    }
+}
+
+/* INSN is a function call.  It may have an unconditional jump
    in its delay slot.
 
    CALL_DEST is the routine we are calling.  */
 
 const char *
 output_call (insn, call_dest, sibcall)
-  rtx insn;
-  rtx call_dest;
-  int sibcall;
+     rtx insn;
+     rtx call_dest;
+     int sibcall;
 {
+  int delay_insn_deleted = 0;
+  int delay_slot_filled = 0;
   int attr_length = get_attr_length (insn);
   int seq_length = dbr_sequence_length ();
-  int distance;
-  rtx xoperands[4];
-  rtx seq_insn;
+  rtx xoperands[2];
 
-  /* Handle common case -- empty delay slot or no jump in the delay slot,
-     and we're sure that the branch will reach the beginning of the $CODE$
-     subspace.  */
-  if ((seq_length == 0 && attr_length == 12)
-      || (seq_length != 0
-	  && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
-	  && attr_length == 8))
+  xoperands[0] = call_dest;
+
+  /* Handle the common case where we're sure that the branch will reach
+     the beginning of the $CODE$ subspace.  */
+  if (!TARGET_LONG_CALLS
+      && ((seq_length == 0 && attr_length == 12)
+	  || (seq_length != 0 && attr_length == 8)))
     {
-      xoperands[0] = call_dest;
       xoperands[1] = gen_rtx_REG (word_mode, sibcall ? 0 : 2);
-      output_asm_insn ("{bl|b,l} %0,%1%#", xoperands);
-      return "";
+      output_asm_insn ("{bl|b,l} %0,%1", xoperands);
     }
-
-  /* This call may not reach the beginning of the $CODE$ subspace.  */
-  if (attr_length > 12)
+  else
     {
-      int delay_insn_deleted = 0;
-      rtx xoperands[2];
-      rtx link;
-
-      /* We need to emit an inline long-call branch.  Furthermore,
-	 because we're changing a named function call into an indirect
-	 function call well after the parameters have been set up, we
-	 need to make sure any FP args appear in both the integer
-	 and FP registers.  Also, we need move any delay slot insn
-	 out of the delay slot.  And finally, we can't rely on the linker
-	 being able to fix the call to $$dyncall!  -- Yuk!.  */
-      if (seq_length != 0
-	  && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN)
-	{
-	  /* A non-jump insn in the delay slot.  By definition we can
-	     emit this insn before the call (and in fact before argument
-	     relocating.  */
-	  final_scan_insn (NEXT_INSN (insn), asm_out_file, optimize, 0, 0);
-
-	  /* Now delete the delay insn.  */
-	  PUT_CODE (NEXT_INSN (insn), NOTE);
-	  NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
-	  NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
-	  delay_insn_deleted = 1;
-	}
-
-      /* Now copy any FP arguments into integer registers.  */
-      for (link = CALL_INSN_FUNCTION_USAGE (insn); link; link = XEXP (link, 1))
-	{
-	  int arg_mode, regno;
-	  rtx use = XEXP (link, 0);
-	  if (! (GET_CODE (use) == USE
-		 && GET_CODE (XEXP (use, 0)) == REG
-		 && FUNCTION_ARG_REGNO_P (REGNO (XEXP (use, 0)))))
-	    continue;
-
-	  arg_mode = GET_MODE (XEXP (use, 0));
-	  regno = REGNO (XEXP (use, 0));
-	  /* Is it a floating point register?  */
-	  if (regno >= 32 && regno <= 39)
-	    {
-	      /* Copy from the FP register into an integer register
-		 (via memory).  */
-	      if (arg_mode == SFmode)
-		{
-		  xoperands[0] = XEXP (use, 0);
-		  xoperands[1] = gen_rtx_REG (SImode, 26 - (regno - 32) / 2);
-		  output_asm_insn ("{fstws|fstw} %0,-16(%%sr0,%%r30)",
-				    xoperands);
-		  output_asm_insn ("ldw -16(%%sr0,%%r30),%1", xoperands);
-		}
-	      else
-		{
-		  xoperands[0] = XEXP (use, 0);
-		  xoperands[1] = gen_rtx_REG (DImode, 25 - (regno - 34) / 2);
-		  output_asm_insn ("{fstds|fstd} %0,-16(%%sr0,%%r30)",
-				    xoperands);
-		  output_asm_insn ("ldw -12(%%sr0,%%r30),%R1", xoperands);
-		  output_asm_insn ("ldw -16(%%sr0,%%r30),%1", xoperands);
-		}
+      if (TARGET_64BIT)
+	{
+	  /* ??? As far as I can tell, the HP linker doesn't support the
+	     long pc-relative sequence described in the 64-bit runtime
+	     architecture.  So, we use a slightly longer indirect call.  */
+	  struct deferred_plabel *p = get_plabel (XSTR (call_dest, 0));
+
+	  xoperands[0] = p->internal_label;
+	  xoperands[1] = gen_label_rtx ();
+
+	  /* If this isn't a sibcall, we put the load of %r27 into the
+	     delay slot.  We can't do this in a sibcall as we don't
+	     have a second call-clobbered scratch register available.  */
+	  if (seq_length != 0
+	      && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
+	      && !sibcall)
+	    {
+	      final_scan_insn (NEXT_INSN (insn), asm_out_file,
+			       optimize, 0, 0);
+
+	      /* Now delete the delay insn.  */
+	      PUT_CODE (NEXT_INSN (insn), NOTE);
+	      NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
+	      NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+	      delay_insn_deleted = 1;
+	    }
+
+	  output_asm_insn ("addil LT'%0,%%r27", xoperands);
+	  output_asm_insn ("ldd RT'%0(%%r1),%%r1", xoperands);
+	  output_asm_insn ("ldd 0(%%r1),%%r1", xoperands);
+
+	  if (sibcall)
+	    {
+	      output_asm_insn ("ldd 24(%%r1),%%r27", xoperands);
+	      output_asm_insn ("ldd 16(%%r1),%%r1", xoperands);
+	      output_asm_insn ("bve (%%r1)", xoperands);
+	    }
+	  else
+	    {
+	      output_asm_insn ("ldd 16(%%r1),%%r2", xoperands);
+	      output_asm_insn ("bve,l (%%r2),%%r2", xoperands);
+	      output_asm_insn ("ldd 24(%%r1),%%r27", xoperands);
+	      delay_slot_filled = 1;
 	    }
 	}
-
-      /* Don't have to worry about TARGET_PORTABLE_RUNTIME here since
-	 we don't have any direct calls in that case.  */
+      else
 	{
-	  size_t i;
-	  const char *name = XSTR (call_dest, 0);
+	  int indirect_call = 0;
 
-	  /* See if we have already put this function on the list
-	     of deferred plabels.  This list is generally small,
-	     so a liner search is not too ugly.  If it proves too
-	     slow replace it with something faster.  */
-	  for (i = 0; i < n_deferred_plabels; i++)
-	    if (strcmp (name, deferred_plabels[i].name) == 0)
-	      break;
-
-	  /* If the deferred plabel list is empty, or this entry was
-	     not found on the list, create a new entry on the list.  */
-	  if (deferred_plabels == NULL || i == n_deferred_plabels)
-	    {
-	      const char *real_name;
-
-	      if (deferred_plabels == 0)
-		deferred_plabels = (struct deferred_plabel *)
-		  ggc_alloc (sizeof (struct deferred_plabel));
+	  /* Emit a long call.  There are several different sequences
+	     of increasing length and complexity.  In most cases,
+             they don't allow an instruction in the delay slot.  */
+	  if (!(TARGET_LONG_ABS_CALL && !flag_pic)
+	      && !(TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
+	      && !(TARGET_GAS && TARGET_LONG_PIC_PCREL_CALL))
+	    indirect_call = 1;
+
+	  if (seq_length != 0
+	      && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
+	      && !sibcall
+	      && (!TARGET_PA_20 || indirect_call))
+	    {
+	      /* A non-jump insn in the delay slot.  By definition we can
+		 emit this insn before the call (and in fact before argument
+		 relocating.  */
+	      final_scan_insn (NEXT_INSN (insn), asm_out_file, optimize, 0, 0);
+
+	      /* Now delete the delay insn.  */
+	      PUT_CODE (NEXT_INSN (insn), NOTE);
+	      NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
+	      NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+	      delay_insn_deleted = 1;
+	    }
+
+	  if (TARGET_LONG_ABS_CALL && !flag_pic)
+	    {
+	      /* This is the best sequence for making long calls in
+		 non-pic code.  Unfortunately, GNU ld doesn't provide
+		 the stub needed for external calls, and GAS's support
+		 for this with the SOM linker is buggy.  */
+	      output_asm_insn ("ldil L'%0,%%r1", xoperands);
+	      if (sibcall)
+		output_asm_insn ("be R'%0(%%sr4,%%r1)", xoperands);
 	      else
-		deferred_plabels = (struct deferred_plabel *)
-		  ggc_realloc (deferred_plabels,
-			    ((n_deferred_plabels + 1)
-			     * sizeof (struct deferred_plabel)));
-
-	      i = n_deferred_plabels++;
-	      deferred_plabels[i].internal_label = gen_label_rtx ();
-	      deferred_plabels[i].name = ggc_strdup (name);
-
-	      /* Gross.  We have just implicitly taken the address of this
-		 function, mark it as such.  */
-	      real_name = (*targetm.strip_name_encoding) (name);
-	      TREE_SYMBOL_REFERENCED (get_identifier (real_name)) = 1;
-	    }
-
-	  /* We have to load the address of the function using a procedure
-	     label (plabel).  Inline plabels can lose for PIC and other
-	     cases, so avoid them by creating a 32bit plabel in the data
-	     segment.  */
-	  if (flag_pic)
-	    {
-	      xoperands[0] = deferred_plabels[i].internal_label;
-	      if (TARGET_SOM || ! TARGET_GAS)
-		xoperands[1] = gen_label_rtx ();
-
-	      output_asm_insn ("addil LT%%%0,%%r19", xoperands);
-	      output_asm_insn ("ldw RT%%%0(%%r1),%%r22", xoperands);
-	      output_asm_insn ("ldw 0(%%r22),%%r22", xoperands);
-
-	      /* Get our address + 8 into %r1.  */
-	      output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+		{
+		  if (TARGET_PA_20)
+		    output_asm_insn ("be,l R'%0(%%sr4,%%r1),%%sr0,%%r31",
+				     xoperands);
+		  else
+		    output_asm_insn ("ble R'%0(%%sr4,%%r1)", xoperands);
 
-	      if (TARGET_SOM || ! TARGET_GAS)
+		  output_asm_insn ("copy %%r31,%%r2", xoperands);
+		  delay_slot_filled = 1;
+		}
+	    }
+	  else
+	    {
+	      if (TARGET_SOM && TARGET_LONG_PIC_SDIFF_CALL)
 		{
-		  /* Add %r1 to the offset of dyncall from the next insn.  */
-		  output_asm_insn ("addil L%%$$dyncall-%1,%%r1", xoperands);
+		  /* The HP assembler and linker can handle relocations
+		     for the difference of two symbols.  GAS and the HP
+		     linker can't do this when one of the symbols is
+		     external.  */
+		  xoperands[1] = gen_label_rtx ();
+		  output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+		  output_asm_insn ("addil L'%0-%l1,%%r1", xoperands);
 		  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
 					     CODE_LABEL_NUMBER (xoperands[1]));
-		  output_asm_insn ("ldo R%%$$dyncall-%1(%%r1),%%r1", xoperands);
-	        }
-	      else
+		  output_asm_insn ("ldo R'%0-%l1(%%r1),%%r1", xoperands);
+		}
+	      else if (TARGET_GAS && TARGET_LONG_PIC_PCREL_CALL)
 		{
-		  output_asm_insn ("addil L%%$$dyncall-$PIC_pcrel$0+4,%%r1",
+		  /*  GAS currently can't generate the relocations that
+		      are needed for the SOM linker under HP-UX using this
+		      sequence.  The GNU linker doesn't generate the stubs
+		      that are needed for external calls on TARGET_ELF32
+		      with this sequence.  For now, we have to use a
+		      longer plabel sequence when using GAS.  */
+		  output_asm_insn ("{bl|b,l} .+8,%%r1", xoperands);
+		  output_asm_insn ("addil L'%0-$PIC_pcrel$0+4,%%r1",
 				   xoperands);
-		  output_asm_insn ("ldo R%%$$dyncall-$PIC_pcrel$0+8(%%r1),%%r1",
+		  output_asm_insn ("ldo R'%0-$PIC_pcrel$0+8(%%r1),%%r1",
 				   xoperands);
 		}
+	      else
+		{
+		  /* Emit a long plabel-based call sequence.  This is
+		     essentially an inline implementation of $$dyncall.
+		     We don't actually try to call $$dyncall as this is
+		     as difficult as calling the function itself.  */
+		  struct deferred_plabel *p = get_plabel (XSTR (call_dest, 0));
+
+		  xoperands[0] = p->internal_label;
+		  xoperands[1] = gen_label_rtx ();
+
+		  /* Since the call is indirect, FP arguments in registers
+		     need to be copied to the general registers.  Then, the
+		     argument relocation stub will copy them back.  */
+		  if (TARGET_SOM)
+		    copy_fp_args (insn);
 
-	      /* Get the return address into %r31.  */
-	      output_asm_insn ("blr %%r0,%%r31", xoperands);
+		  if (flag_pic)
+		    {
+		      output_asm_insn ("addil LT'%0,%%r19", xoperands);
+		      output_asm_insn ("ldw RT'%0(%%r1),%%r1", xoperands);
+		      output_asm_insn ("ldw 0(%%r1),%%r1", xoperands);
+		    }
+		  else
+		    {
+		      output_asm_insn ("addil LR'%0-$global$,%%r27",
+				       xoperands);
+		      output_asm_insn ("ldw RR'%0-$global$(%%r1),%%r1",
+				       xoperands);
+		    }
 
-	      /* Branch to our target which is in %r1.  */
-	      output_asm_insn ("bv %%r0(%%r1)", xoperands);
+		  output_asm_insn ("bb,>=,n %%r1,30,.+16", xoperands);
+		  output_asm_insn ("depi 0,31,2,%%r1", xoperands);
+		  output_asm_insn ("ldw 4(%%sr0,%%r1),%%r19", xoperands);
+		  output_asm_insn ("ldw 0(%%sr0,%%r1),%%r1", xoperands);
 
-	      if (sibcall)
-		{
-		  /* This call never returns, so we do not need to fix the
-		     return pointer.  */
-		  output_asm_insn ("nop", xoperands);
-		}
-	      else
-		{
-		  /* Copy the return address into %r2 also.  */
-		  output_asm_insn ("copy %%r31,%%r2", xoperands);
+		  if (!sibcall && !TARGET_PA_20)
+		    {
+		      output_asm_insn ("{bl|b,l} .+8,%%r2", xoperands);
+		      output_asm_insn ("addi 16,%%r2,%%r2", xoperands);
+		    }
 		}
-	    }
-	  else
-	    {
-	      xoperands[0] = deferred_plabels[i].internal_label;
 
-	      /* Get the address of our target into %r22.  */
-	      output_asm_insn ("addil LR%%%0-$global$,%%r27", xoperands);
-	      output_asm_insn ("ldw RR%%%0-$global$(%%r1),%%r22", xoperands);
-
-	      /* Get the high part of the  address of $dyncall into %r2, then
-		 add in the low part in the branch instruction.  */
-	      output_asm_insn ("ldil L%%$$dyncall,%%r2", xoperands);
 	      if (TARGET_PA_20)
-		output_asm_insn ("be,l R%%$$dyncall(%%sr4,%%r2),%%sr0,%%r31",
-				 xoperands);
-	      else
-		output_asm_insn ("ble R%%$$dyncall(%%sr4,%%r2)", xoperands);
-
-	      if (sibcall)
 		{
-		  /* This call never returns, so we do not need to fix the
-		     return pointer.  */
-		  output_asm_insn ("nop", xoperands);
+		  if (sibcall)
+		    output_asm_insn ("bve (%%r1)", xoperands);
+		  else
+		    {
+		      if (indirect_call)
+			{
+			  output_asm_insn ("bve,l (%%r1),%%r2", xoperands);
+			  output_asm_insn ("stw %%r2,-24(%%sp)", xoperands);
+			  delay_slot_filled = 1;
+			}
+		      else
+			output_asm_insn ("bve,l (%%r1),%%r2", xoperands);
+		    }
 		}
 	      else
 		{
-		  /* Copy the return address into %r2 also.  */
-		  output_asm_insn ("copy %%r31,%%r2", xoperands);
-		}
-	    }
-	}
+	          output_asm_insn ("ldsid (%%r1),%%r31\n\tmtsp %%r31,%%sr0",
+				   xoperands);
 
-      /* If we had a jump in the call's delay slot, output it now.  */
-      if (seq_length != 0 && !delay_insn_deleted)
-	{
-	  xoperands[0] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
-	  output_asm_insn ("b,n %0", xoperands);
+		  if (sibcall)
+		    output_asm_insn ("be 0(%%sr0,%%r1)", xoperands);
+		  else
+		    {
+		      output_asm_insn ("ble 0(%%sr0,%%r1)", xoperands);
 
-	  /* Now delete the delay insn.  */
-	  PUT_CODE (NEXT_INSN (insn), NOTE);
-	  NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
-	  NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+		      if (indirect_call)
+			output_asm_insn ("stw %%r31,-24(%%sp)", xoperands);
+		      else
+			output_asm_insn ("copy %%r31,%%r2", xoperands);
+		      delay_slot_filled = 1;
+		    }
+		}
+	    }
 	}
-      return "";
     }
 
-  /* This call has an unconditional jump in its delay slot and the
-     call is known to reach its target or the beginning of the current
-     subspace.  */
+  if (seq_length == 0 || (delay_insn_deleted && !delay_slot_filled))
+    output_asm_insn ("nop", xoperands);
 
-  /* Use the containing sequence insn's address.  */
-  seq_insn = NEXT_INSN (PREV_INSN (XVECEXP (final_sequence, 0, 0)));
+  /* We are done if there isn't a jump in the delay slot.  */
+  if (seq_length == 0
+      || delay_insn_deleted
+      || GET_CODE (NEXT_INSN (insn)) != JUMP_INSN)
+    return "";
 
-  distance = INSN_ADDRESSES (INSN_UID (JUMP_LABEL (NEXT_INSN (insn))))
-	       - INSN_ADDRESSES (INSN_UID (seq_insn)) - 8;
+  /* A sibcall should never have a branch in the delay slot.  */
+  if (sibcall)
+    abort ();
 
-  /* If the branch is too far away, emit a normal call followed
-     by a nop, followed by the unconditional branch.  If the branch
-     is close, then adjust %r2 in the call's delay slot.  */
+  /* This call has an unconditional jump in its delay slot.  */
+  xoperands[0] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
 
-  xoperands[0] = call_dest;
-  xoperands[1] = XEXP (PATTERN (NEXT_INSN (insn)), 1);
-  if (! VAL_14_BITS_P (distance))
-    output_asm_insn ("{bl|b,l} %0,%%r2\n\tnop\n\tb,n %1", xoperands);
-  else
+  if (!delay_slot_filled)
     {
-      xoperands[3] = gen_label_rtx ();
-      output_asm_insn ("\n\t{bl|b,l} %0,%%r2\n\tldo %1-%3(%%r2),%%r2",
-		       xoperands);
-      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
-				 CODE_LABEL_NUMBER (xoperands[3]));
+      /* See if the return address can be adjusted.  Use the containing
+         sequence insn's address.  */
+      rtx seq_insn = NEXT_INSN (PREV_INSN (XVECEXP (final_sequence, 0, 0)));
+      int distance = (INSN_ADDRESSES (INSN_UID (JUMP_LABEL (NEXT_INSN (insn))))
+		      - INSN_ADDRESSES (INSN_UID (seq_insn)) - 8);
+
+      if (VAL_14_BITS_P (distance))
+	{
+	  xoperands[1] = gen_label_rtx ();
+	  output_asm_insn ("ldo %0-%1(%%r2),%%r2", xoperands);
+	  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, "L",
+				     CODE_LABEL_NUMBER (xoperands[3]));
+	}
+      else
+	/* ??? This branch may not reach its target.  */
+	output_asm_insn ("nop\n\tb,n %0", xoperands);
     }
+  else
+    /* ??? This branch may not reach its target.  */
+    output_asm_insn ("b,n %0", xoperands);
 
   /* Delete the jump.  */
   PUT_CODE (NEXT_INSN (insn), NOTE);
   NOTE_LINE_NUMBER (NEXT_INSN (insn)) = NOTE_INSN_DELETED;
   NOTE_SOURCE_FILE (NEXT_INSN (insn)) = 0;
+
   return "";
 }
 
@@ -6576,8 +6801,8 @@ pa_asm_output_mi_thunk (file, thunk_fnde
     {
       if (! TARGET_64BIT && ! TARGET_PORTABLE_RUNTIME && flag_pic)
 	{
-	  fprintf (file, "\taddil LT%%%s,%%r19\n", lab);
-	  fprintf (file, "\tldw RT%%%s(%%r1),%%r22\n", lab);
+	  fprintf (file, "\taddil LT'%s,%%r19\n", lab);
+	  fprintf (file, "\tldw RT'%s(%%r1),%%r22\n", lab);
 	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
 	  fprintf (file, "\tbb,>=,n %%r22,30,.+16\n");
 	  fprintf (file, "\tdepi 0,31,2,%%r22\n");
@@ -6599,13 +6824,13 @@ pa_asm_output_mi_thunk (file, thunk_fnde
     {
       if (! TARGET_64BIT && ! TARGET_PORTABLE_RUNTIME && flag_pic)
 	{
-	  fprintf (file, "\taddil L%%");
+	  fprintf (file, "\taddil L'");
 	  fprintf (file, HOST_WIDE_INT_PRINT_DEC, delta);
-	  fprintf (file, ",%%r26\n\tldo R%%");
+	  fprintf (file, ",%%r26\n\tldo R'");
 	  fprintf (file, HOST_WIDE_INT_PRINT_DEC, delta);
 	  fprintf (file, "(%%r1),%%r26\n");
-	  fprintf (file, "\taddil LT%%%s,%%r19\n", lab);
-	  fprintf (file, "\tldw RT%%%s(%%r1),%%r22\n", lab);
+	  fprintf (file, "\taddil LT'%s,%%r19\n", lab);
+	  fprintf (file, "\tldw RT'%s(%%r1),%%r22\n", lab);
 	  fprintf (file, "\tldw 0(%%sr0,%%r22),%%r22\n");
 	  fprintf (file, "\tbb,>=,n %%r22,30,.+16\n");
 	  fprintf (file, "\tdepi 0,31,2,%%r22\n");
@@ -6616,9 +6841,9 @@ pa_asm_output_mi_thunk (file, thunk_fnde
 	}
       else
 	{
-	  fprintf (file, "\taddil L%%");
+	  fprintf (file, "\taddil L'");
 	  fprintf (file, HOST_WIDE_INT_PRINT_DEC, delta);
-	  fprintf (file, ",%%r26\n\tb %s\n\tldo R%%", target_name);
+	  fprintf (file, ",%%r26\n\tb %s\n\tldo R'", target_name);
 	  fprintf (file, HOST_WIDE_INT_PRINT_DEC, delta);
 	  fprintf (file, "(%%r1),%%r26\n");
 	}
@@ -6630,7 +6855,7 @@ pa_asm_output_mi_thunk (file, thunk_fnde
       data_section ();
       fprintf (file, "\t.align 4\n");
       ASM_OUTPUT_INTERNAL_LABEL (file, "LTHN", current_thunk_number);
-      fprintf (file, "\t.word P%%%s\n", target_name);
+      fprintf (file, "\t.word P'%s\n", target_name);
       function_section (thunk_fndecl);
     }
   current_thunk_number++;
Index: config/pa/pa.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa.h,v
retrieving revision 1.173
diff -u -3 -p -r1.173 pa.h
--- config/pa/pa.h	20 Oct 2002 22:37:12 -0000	1.173
+++ config/pa/pa.h	22 Oct 2002 14:04:20 -0000
@@ -31,7 +31,7 @@ enum cmp_type				/* comparison type */
 };
 
 /* For long call handling.  */
-extern unsigned int total_code_bytes;
+extern unsigned long total_code_bytes;
 
 /* Which processor to schedule for.  */
 
@@ -152,6 +152,12 @@ extern int target_flags;
 #define TARGET_GNU_LD (target_flags & MASK_GNU_LD)
 #endif
 
+/* Force generation of long calls.  */
+#define MASK_LONG_CALLS 32768
+#ifndef TARGET_LONG_CALLS
+#define TARGET_LONG_CALLS (target_flags & MASK_LONG_CALLS)
+#endif
+
 #ifndef TARGET_PA_10
 #define TARGET_PA_10 (target_flags & (MASK_PA_11 | MASK_PA_20) == 0)
 #endif
@@ -179,6 +185,27 @@ extern int target_flags;
 #define TARGET_SOM 0
 #endif
 
+/* The following three defines are potential target switches.  The current
+   defines are optimal given the current capabilities of GAS and GNU ld.  */
+
+/* Define to a C expression evaluating to true to use long absolute calls.
+   Currently, only the HP assembler and SOM linker support long absolute
+   calls.  They are used only in non-pic code.  */
+#define TARGET_LONG_ABS_CALL (TARGET_SOM && !TARGET_GAS)
+
+/* Define to a C expression evaluating to true to use long pic symbol
+   difference calls.  This is a call variant similar to the long pic
+   pc-relative call.  Long pic symbol difference calls are only used with
+   the HP SOM linker.  Currently, only the HP assembler supports these
+   calls.  GAS doesn't allow an arbritrary difference of two symbols.  */
+#define TARGET_LONG_PIC_SDIFF_CALL (!TARGET_GAS)
+
+/* Define to a C expression evaluating to true to use long pic
+   pc-relative calls.  Long pic pc-relative calls are only used with
+   GAS.  Currently, they are usable for calls within a module but
+   not for external calls.  */
+#define TARGET_LONG_PIC_PCREL_CALL 0
+
 /* Macro to define tables used to set the flags.  This is a
    list in braces of target switches with each switch being
    { "NAME", VALUE, "HELP_STRING" }.  VALUE is the bits to set,
@@ -237,6 +264,10 @@ extern int target_flags;
      N_("Generate code for huge switch statements") },			\
    { "no-big-switch",		-MASK_BIG_SWITCH,			\
      N_("Do not generate code for huge switch statements") },		\
+   { "long-calls",		 MASK_LONG_CALLS,			\
+     N_("Always generate long calls") },				\
+   { "no-long-calls",		-MASK_LONG_CALLS,			\
+     N_("Generate long calls only when needed") },			\
    { "linker-opt",		 0,					\
      N_("Enable linker optimizations") },				\
    SUBTARGET_SWITCHES							\
@@ -497,15 +528,34 @@ do {								\
 #define INITIAL_FRAME_POINTER_OFFSET(VAR) \
   do {(VAR) = - compute_frame_size (get_frame_size (), 0);} while (0)
 
-/* Base register for access to arguments of the function.  */
-#define ARG_POINTER_REGNUM 3
+/* Base register for access to arguments of the function.
+
+   For TARGET_64BIT, the incoming argument pointer is in GR (29).
+   This register is also used for millicode returns and can't be
+   fixed.  We can't use the frame pointer for the argument pointer
+   because both the stack and arguments grow upward.  The offset
+   between the argument pointer and the stack pointer varies from
+   one caller to another.  This makes it impossible to eliminate
+   the argument pointer.  If we use GR (29) as the arg pointer
+   register, then it is copied to a pseudo in assign_parms because
+   it isn't fixed.  This copy inhibits tail and sibcall optimization.
+   Thus, we need to dedicate a fixed register for the argument
+   pointer and copy the incoming value to it in the function prologue.
+
+   ??? The tail and sibcall optimization problem might be avoided
+   if virtual_incoming_args_rtx were instantiated using the
+   functions's internal argument pointer.
+
+   For !TARGET_64BIT, we can use the frame pointer for the argument
+   pointer as args grow downward.  */
+#define ARG_POINTER_REGNUM (TARGET_64BIT ? 4 : 3)
+#define ARG_POINTER_INCOMING_REGNUM (TARGET_64BIT ? 29 : 3)
 
 /* Register in which static-chain is passed to a function.  */
-#define STATIC_CHAIN_REGNUM 29
+#define STATIC_CHAIN_REGNUM (TARGET_64BIT ? 31 : 29)
 
 /* Register which holds offset table for position-independent
    data references.  */
-
 #define PIC_OFFSET_TABLE_REGNUM (TARGET_64BIT ? 27 : 19)
 #define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED 1
 
@@ -677,7 +727,7 @@ extern struct rtx_def *hppa_pic_save_rtx
    This is the difference between the logical top of stack and the
    actual sp.  */
 #define STACK_POINTER_OFFSET \
-  (TARGET_64BIT ? -(current_function_outgoing_args_size + 16): -32)
+  (TARGET_64BIT ? -(current_function_outgoing_args_size + 16) : -32)
 
 #define STACK_DYNAMIC_OFFSET(FNDECL)	\
   (TARGET_64BIT				\
@@ -893,6 +943,8 @@ struct hppa_args {int words, nargs_proto
   FUNCTION_ARG_PASS_BY_REFERENCE (CUM, MODE, TYPE, NAMED)
 
 
+extern GTY(()) rtx arg_pointer_incoming_rtx;
+
 extern GTY(()) rtx hppa_compare_op0;
 extern GTY(()) rtx hppa_compare_op1;
 extern enum cmp_type hppa_branch_type;
@@ -1888,7 +1940,6 @@ do { 									\
 #define FUNCTION_OK_FOR_SIBCALL(DECL) \
   (DECL \
    && ! TARGET_PORTABLE_RUNTIME \
-   && ! TARGET_64BIT \
    && ! TREE_PUBLIC (DECL))
 
 #define PREDICATE_CODES							\
Index: config/pa/pa.md
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa.md,v
retrieving revision 1.113
diff -u -3 -p -r1.113 pa.md
--- config/pa/pa.md	11 Sep 2002 02:45:09 -0000	1.113
+++ config/pa/pa.md	22 Oct 2002 14:04:22 -0000
@@ -105,12 +105,9 @@
 (define_delay (eq_attr "type" "call")
   [(eq_attr "in_call_delay" "true") (nil) (nil)])
 
-;; millicode call delay slot description.  Note it disallows delay slot
-;; when TARGET_PORTABLE_RUNTIME is true.
+;; Millicode call delay slot description.
 (define_delay (eq_attr "type" "milli")
-  [(and (eq_attr "in_call_delay" "true")
-	(eq (symbol_ref "TARGET_PORTABLE_RUNTIME") (const_int 0)))
-   (nil) (nil)])
+  [(eq_attr "in_call_delay" "true") (nil) (nil)])
 
 ;; Return and other similar instructions.
 (define_delay (eq_attr "type" "branch,parallel_branch")
@@ -4089,27 +4086,7 @@
   "!TARGET_64BIT"
   "* return output_mul_insn (0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 4)
-
-;; Out of reach PIC
-            (ne (symbol_ref "flag_pic")
-                (const_int 0))
-            (const_int 24)
-
-;; Out of reach PORTABLE_RUNTIME
-            (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                (const_int 0))
-            (const_int 20)]
-
-;; Out of reach, can use ble
-          (const_int 12)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_insn ""
   [(set (reg:SI 29) (mult:SI (reg:SI 26) (reg:SI 25)))
@@ -4120,7 +4097,7 @@
   "TARGET_64BIT"
   "* return output_mul_insn (0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length") (const_int 4))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_expand "muldi3"
   [(set (match_operand:DI 0 "register_operand" "")
@@ -4211,27 +4188,7 @@
   "*
    return output_div_insn (operands, 0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 4)
-
-;; Out of reach PIC
-            (ne (symbol_ref "flag_pic")
-                (const_int 0))
-            (const_int 24)
-
-;; Out of reach PORTABLE_RUNTIME
-            (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                (const_int 0))
-            (const_int 20)]
-
-;; Out of reach, can use ble
-          (const_int 12)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_insn ""
   [(set (reg:SI 29)
@@ -4245,7 +4202,7 @@
   "*
    return output_div_insn (operands, 0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length") (const_int 4))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_expand "udivsi3"
   [(set (reg:SI 26) (match_operand:SI 1 "move_operand" ""))
@@ -4261,6 +4218,7 @@
   "
 {
   operands[3] = gen_reg_rtx (SImode);
+
   if (TARGET_64BIT)
     {
       operands[5] = gen_rtx_REG (SImode, 2);
@@ -4287,27 +4245,7 @@
   "*
    return output_div_insn (operands, 1, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 4)
-
-;; Out of reach PIC
-            (ne (symbol_ref "flag_pic")
-                (const_int 0))
-            (const_int 24)
-
-;; Out of reach PORTABLE_RUNTIME
-            (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                (const_int 0))
-            (const_int 20)]
-
-;; Out of reach, can use ble
-          (const_int 12)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_insn ""
   [(set (reg:SI 29)
@@ -4321,7 +4259,7 @@
   "*
    return output_div_insn (operands, 1, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length") (const_int 4))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_expand "modsi3"
   [(set (reg:SI 26) (match_operand:SI 1 "move_operand" ""))
@@ -4360,27 +4298,7 @@
   "*
   return output_mod_insn (0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 4)
-
-;; Out of reach PIC
-            (ne (symbol_ref "flag_pic")
-                (const_int 0))
-            (const_int 24)
-
-;; Out of reach PORTABLE_RUNTIME
-            (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                (const_int 0))
-            (const_int 20)]
-
-;; Out of reach, can use ble
-          (const_int 12)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_insn ""
   [(set (reg:SI 29) (mod:SI (reg:SI 26) (reg:SI 25)))
@@ -4393,7 +4311,7 @@
   "*
   return output_mod_insn (0, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length") (const_int 4))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_expand "umodsi3"
   [(set (reg:SI 26) (match_operand:SI 1 "move_operand" ""))
@@ -4432,27 +4350,7 @@
   "*
   return output_mod_insn (1, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 4)
-
-;; Out of reach PIC
-            (ne (symbol_ref "flag_pic")
-                (const_int 0))
-            (const_int 24)
-
-;; Out of reach PORTABLE_RUNTIME
-            (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                (const_int 0))
-            (const_int 20)]
-
-;; Out of reach, can use ble
-          (const_int 12)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 (define_insn ""
   [(set (reg:SI 29) (umod:SI (reg:SI 26) (reg:SI 25)))
@@ -4465,7 +4363,7 @@
   "*
   return output_mod_insn (1, insn);"
   [(set_attr "type" "milli")
-   (set (attr "length") (const_int 4))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 0)"))])
 
 ;;- and instructions
 ;; We define DImode `and` so with DImode `not` we can get
@@ -6012,7 +5910,7 @@
     op = XEXP (operands[0], 0);
 
   if (TARGET_64BIT)
-    emit_move_insn (arg_pointer_rtx,
+    emit_move_insn (arg_pointer_incoming_rtx,
 		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
 				  GEN_INT (64)));
 
@@ -6036,11 +5934,12 @@
       call_insn = emit_call_insn (gen_call_internal_reg (operands[1]));
     }
 
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_incoming_rtx);
+
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      if (TARGET_64BIT)
-	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
 
       /* After each call we must restore the PIC register, even if it
 	 doesn't appear to be used.  */
@@ -6052,6 +5951,7 @@
 (define_insn "call_internal_symref"
   [(call (mem:SI (match_operand 0 "call_operand_address" ""))
 	 (match_operand 1 "" "i"))
+   (clobber (reg:SI 1))
    (clobber (reg:SI 2))
    (use (const_int 0))]
   "! TARGET_PORTABLE_RUNTIME"
@@ -6061,21 +5961,7 @@
   return output_call (insn, operands[0], 0);
 }"
   [(set_attr "type" "call")
-   (set (attr "length")
-;;       If we're sure that we can either reach the target or that the
-;;	 linker can use a long-branch stub, then the length is at most
-;;	 8 bytes.
-;;
-;;	 For long-calls the length will be at most 68 bytes (non-pic)
-;;	 or 84 bytes (pic).  */
-;;	 Else we have to use a long-call;
-      (if_then_else (lt (plus (symbol_ref "total_code_bytes") (pc))
-			(const_int 240000))
-		    (const_int 8)
-		    (if_then_else (eq (symbol_ref "flag_pic")
-				      (const_int 0))
-				  (const_int 68)
-				  (const_int 84))))])
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 0)"))])
 
 (define_insn "call_internal_reg_64bit"
   [(call (mem:SI (match_operand:DI 0 "register_operand" "r"))
@@ -6086,15 +5972,16 @@
   "*
 {
   /* ??? Needs more work.  Length computation, split into multiple insns,
-     do not use %r22 directly, expose delay slot.  */
-  return \"ldd 16(%0),%%r2\;ldd 24(%0),%%r27\;bve,l (%%r2),%%r2\;nop\";
+     expose delay slot.  */
+  return \"ldd 16(%0),%%r2\;bve,l (%%r2),%%r2\;ldd 24(%0),%%r27\";
 }"
   [(set_attr "type" "dyncall")
-   (set (attr "length") (const_int 16))])
+   (set (attr "length") (const_int 12))])
 
 (define_insn "call_internal_reg"
   [(call (mem:SI (reg:SI 22))
 	 (match_operand 0 "" "i"))
+   (clobber (reg:SI 1))
    (clobber (reg:SI 2))
    (use (const_int 1))]
   ""
@@ -6190,7 +6077,7 @@
     op = XEXP (operands[1], 0);
 
   if (TARGET_64BIT)
-    emit_move_insn (arg_pointer_rtx,
+    emit_move_insn (arg_pointer_incoming_rtx,
 		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
 				  GEN_INT (64)));
 
@@ -6218,11 +6105,13 @@
       call_insn = emit_call_insn (gen_call_value_internal_reg (operands[0],
 							       operands[2]));
     }
+
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_incoming_rtx);
+
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      if (TARGET_64BIT)
-	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
 
       /* After each call we must restore the PIC register, even if it
 	 doesn't appear to be used.  */
@@ -6235,6 +6124,7 @@
   [(set (match_operand 0 "" "=rf")
 	(call (mem:SI (match_operand 1 "call_operand_address" ""))
 	      (match_operand 2 "" "i")))
+   (clobber (reg:SI 1))
    (clobber (reg:SI 2))
    (use (const_int 0))]
   ;;- Don't use operand 1 for most machines.
@@ -6245,21 +6135,7 @@
   return output_call (insn, operands[1], 0);
 }"
   [(set_attr "type" "call")
-   (set (attr "length")
-;;       If we're sure that we can either reach the target or that the
-;;	 linker can use a long-branch stub, then the length is at most
-;;	 8 bytes.
-;;
-;;	 For long-calls the length will be at most 68 bytes (non-pic)
-;;	 or 84 bytes (pic).  */
-;;	 Else we have to use a long-call;
-      (if_then_else (lt (plus (symbol_ref "total_code_bytes") (pc))
-			(const_int 240000))
-		    (const_int 8)
-		    (if_then_else (eq (symbol_ref "flag_pic")
-				      (const_int 0))
-				  (const_int 68)
-				  (const_int 84))))])
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 0)"))])
 
 (define_insn "call_value_internal_reg_64bit"
   [(set (match_operand 0 "" "=rf")
@@ -6271,16 +6147,17 @@
   "*
 {
   /* ??? Needs more work.  Length computation, split into multiple insns,
-     do not use %r22 directly, expose delay slot.  */
-  return \"ldd 16(%1),%%r2\;ldd 24(%1),%%r27\;bve,l (%%r2),%%r2\;nop\";
+     expose delay slot.  */
+  return \"ldd 16(%1),%%r2\;bve,l (%%r2),%%r2\;ldd 24(%1),%%r27\";
 }"
   [(set_attr "type" "dyncall")
-   (set (attr "length") (const_int 16))])
+   (set (attr "length") (const_int 12))])
 
 (define_insn "call_value_internal_reg"
   [(set (match_operand 0 "" "=rf")
 	(call (mem:SI (reg:SI 22))
 	      (match_operand 1 "" "i")))
+   (clobber (reg:SI 1))
    (clobber (reg:SI 2))
    (use (const_int 1))]
   ""
@@ -6389,10 +6266,9 @@
 }")
 
 (define_expand "sibcall"
-  [(parallel [(call (match_operand:SI 0 "" "")
-		    (match_operand 1 "" ""))
-	      (clobber (reg:SI 0))])]
-  "! TARGET_PORTABLE_RUNTIME"
+  [(call (match_operand:SI 0 "" "")
+	 (match_operand 1 "" ""))]
+  "!TARGET_PORTABLE_RUNTIME"
   "
 {
   rtx op;
@@ -6400,8 +6276,19 @@
 
   op = XEXP (operands[0], 0);
 
-  /* We do not allow indirect sibling calls.  */
-  call_insn = emit_call_insn (gen_sibcall_internal_symref (op, operands[1]));
+  if (TARGET_64BIT)
+    emit_move_insn (arg_pointer_incoming_rtx, arg_pointer_rtx);
+
+  /* Indirect sibling calls are not allowed.  */
+  if (TARGET_64BIT)
+    call_insn = gen_sibcall_internal_symref_64bit (op, operands[1]);
+  else
+    call_insn = gen_sibcall_internal_symref (op, operands[1]);
+
+  call_insn = emit_call_insn (call_insn);
+
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_incoming_rtx);
 
   if (flag_pic)
     {
@@ -6417,38 +6304,39 @@
 (define_insn "sibcall_internal_symref"
   [(call (mem:SI (match_operand 0 "call_operand_address" ""))
 	 (match_operand 1 "" "i"))
-   (clobber (reg:SI 0))
+   (clobber (reg:SI 1))
    (use (reg:SI 2))
    (use (const_int 0))]
-  "! TARGET_PORTABLE_RUNTIME"
+  "!TARGET_PORTABLE_RUNTIME && !TARGET_64BIT"
   "*
 {
   output_arg_descriptor (insn);
   return output_call (insn, operands[0], 1);
 }"
   [(set_attr "type" "call")
-   (set (attr "length")
-;;       If we're sure that we can either reach the target or that the
-;;	 linker can use a long-branch stub, then the length is at most
-;;	 8 bytes.
-;;
-;;	 For long-calls the length will be at most 68 bytes (non-pic)
-;;	 or 84 bytes (pic).  */
-;;	 Else we have to use a long-call;
-      (if_then_else (lt (plus (symbol_ref "total_code_bytes") (pc))
-			(const_int 240000))
-		    (const_int 8)
-		    (if_then_else (eq (symbol_ref "flag_pic")
-				      (const_int 0))
-				  (const_int 68)
-				  (const_int 84))))])
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 1)"))])
+
+(define_insn "sibcall_internal_symref_64bit"
+  [(call (mem:SI (match_operand 0 "call_operand_address" ""))
+	 (match_operand 1 "" "i"))
+   (clobber (reg:SI 1))
+   (clobber (reg:SI 27))
+   (use (reg:SI 2))
+   (use (const_int 0))]
+  "TARGET_64BIT"
+  "*
+{
+  output_arg_descriptor (insn);
+  return output_call (insn, operands[0], 1);
+}"
+  [(set_attr "type" "call")
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 1)"))])
 
 (define_expand "sibcall_value"
-  [(parallel [(set (match_operand 0 "" "")
+  [(set (match_operand 0 "" "")
 		   (call (match_operand:SI 1 "" "")
-			 (match_operand 2 "" "")))
-	      (clobber (reg:SI 0))])]
-  "! TARGET_PORTABLE_RUNTIME"
+			 (match_operand 2 "" "")))]
+  "!TARGET_PORTABLE_RUNTIME"
   "
 {
   rtx op;
@@ -6456,10 +6344,22 @@
 
   op = XEXP (operands[1], 0);
 
-  /* We do not allow indirect sibling calls.  */
-  call_insn = emit_call_insn (gen_sibcall_value_internal_symref (operands[0],
-								 op,
-								 operands[2]));
+  if (TARGET_64BIT)
+    emit_move_insn (arg_pointer_incoming_rtx, arg_pointer_rtx);
+
+  /* Indirect sibling calls are not allowed.  */
+  if (TARGET_64BIT)
+    call_insn
+      = gen_sibcall_value_internal_symref_64bit (operands[0], op, operands[2]);
+  else
+    call_insn
+      = gen_sibcall_value_internal_symref (operands[0], op, operands[2]);
+
+  call_insn = emit_call_insn (call_insn);
+
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_incoming_rtx);
+
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
@@ -6475,32 +6375,34 @@
   [(set (match_operand 0 "" "=rf")
 	(call (mem:SI (match_operand 1 "call_operand_address" ""))
 	      (match_operand 2 "" "i")))
-   (clobber (reg:SI 0))
+   (clobber (reg:SI 1))
    (use (reg:SI 2))
    (use (const_int 0))]
-  ;;- Don't use operand 1 for most machines.
-  "! TARGET_PORTABLE_RUNTIME"
+  "!TARGET_PORTABLE_RUNTIME && !TARGET_64BIT"
   "*
 {
   output_arg_descriptor (insn);
   return output_call (insn, operands[1], 1);
 }"
   [(set_attr "type" "call")
-   (set (attr "length")
-;;       If we're sure that we can either reach the target or that the
-;;	 linker can use a long-branch stub, then the length is at most
-;;	 8 bytes.
-;;
-;;	 For long-calls the length will be at most 68 bytes (non-pic)
-;;	 or 84 bytes (pic).  */
-;;	 Else we have to use a long-call;
-      (if_then_else (lt (plus (symbol_ref "total_code_bytes") (pc))
-			(const_int 240000))
-		    (const_int 8)
-		    (if_then_else (eq (symbol_ref "flag_pic")
-				      (const_int 0))
-				  (const_int 68)
-				  (const_int 84))))])
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 1)"))])
+
+(define_insn "sibcall_value_internal_symref_64bit"
+  [(set (match_operand 0 "" "=rf")
+	(call (mem:SI (match_operand 1 "call_operand_address" ""))
+	      (match_operand 2 "" "i")))
+   (clobber (reg:SI 1))
+   (clobber (reg:SI 27))
+   (use (reg:SI 2))
+   (use (const_int 0))]
+  "TARGET_64BIT"
+  "*
+{
+  output_arg_descriptor (insn);
+  return output_call (insn, operands[1], 1);
+}"
+  [(set_attr "type" "call")
+   (set (attr "length") (symbol_ref "attr_length_call (insn, 1)"))])
 
 (define_insn "nop"
   [(const_int 0)]
@@ -7392,6 +7294,12 @@
   "!TARGET_64BIT"
   "*
 {
+  int length = get_attr_length (insn);
+  rtx xoperands[2];
+
+  xoperands[0] = GEN_INT (length - 8);
+  xoperands[1] = GEN_INT (length - 16);
+
   /* Must import the magic millicode routine.  */
   output_asm_insn (\".IMPORT $$sh_func_adrs,MILLICODE\", NULL);
 
@@ -7400,60 +7308,24 @@
      First, copy our input parameter into %r29 just in case we don't
      need to call $$sh_func_adrs.  */
   output_asm_insn (\"copy %%r26,%%r29\", NULL);
+  output_asm_insn (\"{extru|extrw,u} %%r26,31,2,%%r31\", NULL);
 
   /* Next, examine the low two bits in %r26, if they aren't 0x2, then
      we use %r26 unchanged.  */
-  if (get_attr_length (insn) == 32)
-    output_asm_insn (\"{extru|extrw,u} %%r26,31,2,%%r31\;{comib|cmpib},<>,n 2,%%r31,.+24\", NULL);
-  else if (get_attr_length (insn) == 40)
-    output_asm_insn (\"{extru|extrw,u} %%r26,31,2,%%r31\;{comib|cmpib},<>,n 2,%%r31,.+32\", NULL);
-  else if (get_attr_length (insn) == 44)
-    output_asm_insn (\"{extru|extrw,u} %%r26,31,2,%%r31\;{comib|cmpib},<>,n 2,%%r31,.+36\", NULL);
-  else
-    output_asm_insn (\"{extru|extrw,u} %%r26,31,2,%%r31\;{comib|cmpib},<>,n 2,%%r31,.+20\", NULL);
+  output_asm_insn (\"{comib|cmpib},<>,n 2,%%r31,.+%0\", xoperands);
+  output_asm_insn (\"ldi 4096,%%r31\", NULL);
 
   /* Next, compare %r26 with 4096, if %r26 is less than or equal to
-     4096, then we use %r26 unchanged.  */
-  if (get_attr_length (insn) == 32)
-    output_asm_insn (\"ldi 4096,%%r31\;{comb|cmpb},<<,n %%r26,%%r31,.+16\",
-		     NULL);
-  else if (get_attr_length (insn) == 40)
-    output_asm_insn (\"ldi 4096,%%r31\;{comb|cmpb},<<,n %%r26,%%r31,.+24\",
-		     NULL);
-  else if (get_attr_length (insn) == 44)
-    output_asm_insn (\"ldi 4096,%%r31\;{comb|cmpb},<<,n %%r26,%%r31,.+28\",
-		     NULL);
-  else
-    output_asm_insn (\"ldi 4096,%%r31\;{comb|cmpb},<<,n %%r26,%%r31,.+12\",
-		     NULL);
+     4096, then again we use %r26 unchanged.  */
+  output_asm_insn (\"{comb|cmpb},<<,n %%r26,%%r31,.+%1\", xoperands);
 
-  /* Else call $$sh_func_adrs to extract the function's real add24.  */
+  /* Finally, call $$sh_func_adrs to extract the function's real add24.  */
   return output_millicode_call (insn,
 				gen_rtx_SYMBOL_REF (SImode,
-					 \"$$sh_func_adrs\"));
+						    \"$$sh_func_adrs\"));
 }"
   [(set_attr "type" "multi")
-   (set (attr "length")
-     (cond [
-;; Target (or stub) within reach
-            (and (lt (plus (symbol_ref "total_code_bytes") (pc))
-                     (const_int 240000))
-                 (eq (symbol_ref "TARGET_PORTABLE_RUNTIME")
-                     (const_int 0)))
-            (const_int 28)
-
-;; Out of reach PIC
-	    (ne (symbol_ref "flag_pic")
-		(const_int 0))
-	    (const_int 44)
-
-;; Out of reach PORTABLE_RUNTIME
-	    (ne (symbol_ref "TARGET_PORTABLE_RUNTIME")
-		(const_int 0))
-	    (const_int 40)]
-
-;; Out of reach, can use ble
-          (const_int 32)))])
+   (set (attr "length") (symbol_ref "attr_length_millicode_call (insn, 20)"))])
 
 ;; On the PA, the PIC register is call clobbered, so it must
 ;; be saved & restored around calls by the caller.  If the call
Index: config/pa/pa32-regs.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa32-regs.h,v
retrieving revision 1.11
diff -u -3 -p -r1.11 pa32-regs.h
--- config/pa/pa32-regs.h	3 Sep 2002 18:01:23 -0000	1.11
+++ config/pa/pa32-regs.h	22 Oct 2002 14:04:22 -0000
@@ -95,6 +95,8 @@
   1, 1, 1, 1, 1, 1, 1, 1, \
   1}
 
+#define CALL_REALLY_USED_REGISTERS CALL_USED_REGISTERS
+
 #define CONDITIONAL_REGISTER_USAGE \
 {						\
   int i;					\
Index: config/pa/pa64-linux.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa64-linux.h,v
retrieving revision 1.3
diff -u -3 -p -r1.3 pa64-linux.h
--- config/pa/pa64-linux.h	22 Sep 2002 19:23:19 -0000	1.3
+++ config/pa/pa64-linux.h	22 Oct 2002 14:04:22 -0000
@@ -18,55 +18,3 @@ along with GNU CC; see the file COPYING.
 the Free Software Foundation, 59 Temple Place - Suite 330,
 Boston, MA 02111-1307, USA.  */
 
-#if 0 /* needs some work :-( */
-/* If defined, this macro specifies a table of register pairs used to
-   eliminate unneeded registers that point into the stack frame.  */
-
-#define ELIMINABLE_REGS							\
-{									\
-  {FRAME_POINTER_REGNUM, STACK_POINTER_REGNUM},				\
-  {ARG_POINTER_REGNUM,	 STACK_POINTER_REGNUM},				\
-  {ARG_POINTER_REGNUM,	 FRAME_POINTER_REGNUM},				\
-}
-
-/* A C expression that returns nonzero if the compiler is allowed to try to
-   replace register number FROM with register number TO.  The frame pointer
-   is automatically handled.  */
-
-#define CAN_ELIMINATE(FROM, TO) 1
-
-/* This macro is similar to `INITIAL_FRAME_POINTER_OFFSET'.  It
-   specifies the initial difference between the specified pair of
-   registers.  This macro must be defined if `ELIMINABLE_REGS' is
-   defined.  */
-#define INITIAL_ELIMINATION_OFFSET(FROM, TO, OFFSET) \
-  do								\
-    {								\
-      int fsize;						\
-								\
-      fsize = compute_frame_size (get_frame_size (), 0);	\
-      if ((TO) == FRAME_POINTER_REGNUM				\
-	  && (FROM) == ARG_POINTER_REGNUM)			\
-	{							\
-	  (OFFSET) = -16;					\
-	  break;						\
-	}							\
-								\
-      if ((TO) != STACK_POINTER_REGNUM)				\
-	abort ();						\
-								\
-      switch (FROM)						\
-	{							\
-	case FRAME_POINTER_REGNUM:				\
-	  (OFFSET) = - fsize;					\
-	  break;						\
-								\
-	case ARG_POINTER_REGNUM:				\
-	  (OFFSET) = - fsize - 16;				\
-	  break;						\
-								\
-	default:						\
-	  abort ();						\
-	}							\
-    } while (0)
-#endif
Index: config/pa/pa64-regs.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/pa64-regs.h,v
retrieving revision 1.10
diff -u -3 -p -r1.10 pa64-regs.h
--- config/pa/pa64-regs.h	4 Sep 2002 18:09:32 -0000	1.10
+++ config/pa/pa64-regs.h	22 Oct 2002 14:04:22 -0000
@@ -48,29 +48,27 @@ Boston, MA 02111-1307, USA.  */
    Reg 0	= 0 (hardware). However, 0 is used for condition code,
                   so is not fixed.
    Reg 1	= ADDIL target/Temporary (hardware).
-   Reg 2	= Return Pointer
+   Reg 2	= Return Pointer, Millicode Return Pointer
    Reg 3	= Frame Pointer
-   Reg 4	= Frame Pointer (>8k varying frame with HP compilers only)
+   Reg 4	= Internal Argument Pointer
    Reg 4-18	= Preserved Registers
-   Reg 19	= Linkage Table Register in HPUX 8.0 shared library scheme.
-   Reg 20-22	= Temporary Registers
-   Reg 23-26	= Temporary/Parameter Registers
+   Reg 19-26	= Temporary/Parameter Registers
    Reg 27	= Global Data Pointer (hp)
-   Reg 28	= Temporary/Return Value register
-   Reg 29	= Temporary/Static Chain/Return Value register #2
+   Reg 28	= Temporary/Return Value register #1
+   Reg 29	= Temporary/Arg Pointer register/Return Value register #2
    Reg 30	= stack pointer
-   Reg 31	= Temporary/Millicode Return Pointer (hp)
+   Reg 31	= Temporary/Static Chain/Millicode Return Pointer register (hp)
 
    Freg 0-3	= Status Registers	-- Not known to the compiler.
    Freg 4-7	= Arguments/Return Value
    Freg 8-11	= Temporary Registers
    Freg 12-21	= Preserved Registers
-   Freg 22-31 = Temporary Registers
+   Freg 22-31	= Temporary Registers
 
 */
 
 #define FIXED_REGISTERS  \
- {0, 0, 0, 0, 0, 0, 0, 0, \
+ {0, 0, 0, 0, 1, 0, 0, 0, \
   0, 0, 0, 0, 0, 0, 0, 0, \
   0, 0, 0, 0, 0, 0, 0, 0, \
   0, 0, 0, 1, 0, 0, 1, 0, \
@@ -89,6 +87,21 @@ Boston, MA 02111-1307, USA.  */
    and the register where structure-value addresses are passed.
    Aside from that, you can include as many other registers as you like.  */
 #define CALL_USED_REGISTERS  \
+ {1, 1, 1, 0, 1, 0, 0, 0, \
+  0, 0, 0, 0, 0, 0, 0, 0, \
+  0, 0, 0, 1, 1, 1, 1, 1, \
+  1, 1, 1, 1, 1, 1, 1, 1, \
+  /* fp registers */	  \
+  1, 1, 1, 1, 1, 1, 1, 1, \
+  0, 0, 0, 0, 0, 0, 0, 0, \
+  0, 0, 1, 1, 1, 1, 1, 1, \
+  1, 1, 1, 1, 		  \
+  /* shift register */    \
+  1}
+
+/* This differs from CALL_USED_REGISTERS only in that GR (4)
+   is not really call used.  */
+#define CALL_REALLY_USED_REGISTERS  \
  {1, 1, 1, 0, 0, 0, 0, 0, \
   0, 0, 0, 0, 0, 0, 0, 0, \
   0, 0, 0, 1, 1, 1, 1, 1, \
Index: config/pa/som.h
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/som.h,v
retrieving revision 1.38
diff -u -3 -p -r1.38 som.h
--- config/pa/som.h	29 Aug 2002 21:16:35 -0000	1.38
+++ config/pa/som.h	22 Oct 2002 14:04:23 -0000
@@ -371,3 +371,7 @@ do {						\
    on the location of the GCC tool directory.  The downside is GCC
    cannot be moved after installation using a symlink.  */
 #define ALWAYS_STRIP_DOTDOT 1
+
+/* Aggregates with a single float or double field should be passed and
+   returned in the general registers.  */
+#define MEMBER_TYPE_FORCES_BLK(FIELD, MODE) (MODE==SFmode || MODE==DFmode)
Index: config/pa/t-pa64
===================================================================
RCS file: /cvsroot/gcc/gcc/gcc/config/pa/t-pa64,v
retrieving revision 1.6
diff -u -3 -p -r1.6 t-pa64
--- config/pa/t-pa64	30 Apr 2002 19:47:38 -0000	1.6
+++ config/pa/t-pa64	22 Oct 2002 14:04:23 -0000
@@ -1,4 +1,4 @@
-TARGET_LIBGCC2_CFLAGS = -fPIC -Dpa64=1 -DELF=1
+TARGET_LIBGCC2_CFLAGS = -fPIC -Dpa64=1 -DELF=1 -mlong-calls
 
 LIB2FUNCS_EXTRA=quadlib.c
 
