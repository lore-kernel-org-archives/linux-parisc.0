Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from patty.levels.unisa.edu.au (patty.levels.unisa.edu.au [130.220.36.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66FAB482B
	for <parisc-linux@parisc-linux.org>; Sun, 13 May 2001 07:15:10 -0600 (MDT)
Date: Sun, 13 May 2001 22:45:02 +0930 (CST)
From: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
Reply-To: <amodra@one.net.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] broken toolchain?
In-Reply-To: <200105130123.VAA25847@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.30.0105132221020.11674-100000@mullet.itr.unisa.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 12 May 2001, John David Anglin wrote:

> There still issues re the management of the PIC register.  These might
> cause the unaligned data accesses that you are seeing.  I know the
> mainline gcc was broken by a patch that Alan Modra added to add
> dwarf2 profiling support.  On the branch, things are better but I just
> discovered a new issue involving inline functions.  Don't know where
> things stand with the parisc-linux gcc source.

hppa-linux uses dwarf2 unwind for exceptions.  Since the particular
breakage you mention only affects setjmp/longjmp exception handling, it
shouldn't be a problem unless people specify -fsjlj-exceptions.

Something like the following as yet untested patch should fix the problem.

gcc/ChangeLog.puffin
	* config/pa/pa.c (hppa_init_pic_save): Revert back to saving pic
	register after last_parm_insn.
	(hppa_inline_pic_init): New function.
	* config/pa/pa.h (INLINE_PIC_INIT): Define.
	(hppa_inline_pic_init): Declare.
	* integrate.c (expand_inline_function): Call INLINE_PIC_INIT.

-- 
Alan

Index: gcc/integrate.c
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/integrate.c,v
retrieving revision 1.6
diff -u -p -r1.6 integrate.c
--- integrate.c	2001/04/16 06:33:11	1.6
+++ integrate.c	2001/05/13 12:56:36
@@ -827,7 +827,12 @@ expand_inline_function (fndecl, parms, t
   /* If the inline function needs to make PIC references, that means
      that this function's PIC offset table must be used.  */
   if (inl_f->uses_pic_offset_table)
-    current_function_uses_pic_offset_table = 1;
+    {
+      current_function_uses_pic_offset_table = 1;
+#ifdef INLINE_PIC_INIT
+      INLINE_PIC_INIT (inl_f);
+#endif
+    }

   /* If this function needs a context, set it up.  */
   if (inl_f->needs_context)
Index: gcc/config/pa/pa.c
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa.c,v
retrieving revision 1.21
diff -u -p -r1.21 pa.c
--- pa.c	2001/04/17 00:45:01	1.21
+++ pa.c	2001/05/13 12:57:07
@@ -3436,12 +3435,27 @@ hppa_init_pic_save ()
   RTX_UNCHANGING_P (PIC_OFFSET_TABLE_SAVE_RTX) = 1;
   insn = gen_rtx_SET (VOIDmode, PIC_OFFSET_TABLE_SAVE_RTX, picreg);

-  /* Emit the insn at the beginning of the function after the prologue.  */
-  if (tail_recursion_reentry)
-    emit_insn_before (insn, tail_recursion_reentry);
-  else
-    /* We must have been called via PROFILE_HOOK.  */
-    emit_insn (insn);
+  /* Emit the insn at the beginning of the function after the prologue.
+     The setjmp/longjmp exception handling code emits a call
+     immediately after last_parm_insn, and we need the pic save
+     register valid before the call.  That's why this insn must be
+     part of the parm insns.  */
+  push_topmost_sequence ();
+  last_parm_insn =
+    emit_insn_after (insn, last_parm_insn ? last_parm_insn : get_insns ());
+  pop_topmost_sequence ();
+}
+
+/* Unfortunately, parm insns are not copied for inline functions, so
+   we need to copy the initialization here.  */
+void
+hppa_inline_pic_init (inl_f)
+     struct function *inl_f;
+{
+  if (inl_f->machine->pic_offset_table_save_rtx)
+    emit_insn (gen_rtx_SET (VOIDmode,
+			    inl_f->machine->pic_offset_table_save_rtx,
+			    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM)));
 }

 void
Index: gcc/config/pa/pa.h
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa.h,v
retrieving revision 1.13
diff -u -p -r1.13 pa.h
--- pa.h	2001/05/01 12:40:14	1.13
+++ pa.h	2001/05/13 12:57:20
@@ -522,6 +522,12 @@ extern int target_flags;
 #define PIC_OFFSET_TABLE_SAVE_RTX (cfun->machine->pic_offset_table_save_rtx)
 extern void hppa_init_pic_save PARAMS ((void));

+/* Handle any special initialization needed for inline functions that
+   make PIC references.  */
+#define INLINE_PIC_INIT hppa_inline_pic_init
+struct function;
+extern void hppa_inline_pic_init PARAMS ((struct function *));
+
 #define DEFAULT_PCC_STRUCT_RETURN 0

 /* SOM ABI says that objects larger than 64 bits are returned in memory.
