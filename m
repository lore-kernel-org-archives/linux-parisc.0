Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA30838
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 02:24:53 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA26035;
	Tue, 16 Jan 2001 20:28:12 +1100
Date: Tue, 16 Jan 2001 20:28:12 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Henderson <rth@redhat.com>
cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
In-Reply-To: <20010115215358.B27073@redhat.com>
Message-ID: <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 15 Jan 2001, Richard Henderson wrote:

> On Tue, Jan 16, 2001 at 12:20:19PM +1100, Alan Modra wrote:
> > 	* config/pa/pa.c (pa_init_machine_status, pa_free_machine_status,
> > 	pa_init_expanders): New functions.
> 
> You need a mark_machine_status function.  It is also much better
> to set the global variables once in override_options than for
> every function in init_expanders.

OK, here we go.

gcc/ChangeLog
	* config/pa/pa.h (PIC_OFFSET_TABLE_REGNUM_SAVED): Remove.
	(machine_function): Define.
	(PIC_OFFSET_TABLE_SAVE_RTX) : Define.
	* config/pa/pa.c (pa_init_machine_status, pa_mark_machine_status,
	pa_free_machine_status): New functions.
	(override_options): Set {init,mark,free}_machine_status to above.
	(hppa_expand_prologue): Use PIC_OFFSET_TABLE_SAVE_RTX instead of
	PIC_OFFSET_TABLE_REGNUM_SAVED.
	* config/pa/pa.md: Use PIC_OFFSET_TABLE_SAVE_RTX instead of
	PIC_OFFSET_TABLE_REGNUM_SAVED throughout.
	* config/pa/pa32-regs.h (CONDITIONAL_REGISTER_USAGE): Remove
	references to PIC_OFFSET_TABLE_REGNUM_SAVED.
	* config/pa/pa64-regs.h (CONDITIONAL_REGISTER_USAGE): Likewise.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

diff -urp -xCVS egcs/gcc/config/pa/pa.c newegcs/gcc/config/pa/pa.c
--- egcs/gcc/config/pa/pa.c	Thu Jan  4 15:22:58 2001
+++ newegcs/gcc/config/pa/pa.c	Tue Jan 16 18:12:37 2001
@@ -1,5 +1,5 @@
 /* Subroutines for insn-output.c for HPPA.
-   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000
+   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
    Free Software Foundation, Inc.
    Contributed by Tim Moore (moore@cs.utah.edu), based on sparc.c
 
@@ -43,6 +43,9 @@ Boston, MA 02111-1307, USA.  */
 #include "recog.h"
 #include "tm_p.h"
 
+static void pa_init_machine_status PARAMS ((struct function *));
+static void pa_mark_machine_status PARAMS ((struct function *));
+static void pa_free_machine_status PARAMS ((struct function *));
 static void pa_combine_instructions			PARAMS ((rtx));
 static int pa_can_combine_p	PARAMS ((rtx, rtx, rtx, int, rtx, rtx, rtx));
 static int forward_branch_p				PARAMS ((rtx));
@@ -186,6 +189,43 @@ override_options ()
 
   /* Register global variables with the garbage collector.  */
   pa_add_gc_roots ();
+
+  /* Arrange to save and restore machine status around nested functions.  */
+  init_machine_status = pa_init_machine_status;
+  mark_machine_status = pa_mark_machine_status;
+  free_machine_status = pa_free_machine_status;
+}
+
+/* Functions to initialize pic_offset_table_save_rtx.
+   These will be called, via pointer variables,
+   from push_function_context and pop_function_context.  */
+
+static void
+pa_init_machine_status (p)
+     struct function *p;
+{
+  p->machine = (machine_function *) xmalloc (sizeof (machine_function));
+
+  p->machine->pic_offset_table_save_rtx = gen_reg_rtx (Pmode);
+}
+
+static void
+pa_mark_machine_status (p)
+     struct function *p;
+{
+  if (p->machine)
+    ggc_mark_rtx (p->machine->pic_offset_table_save_rtx);
+}
+
+static void
+pa_free_machine_status (p)
+     struct function *p;
+{
+  if (p->machine == NULL)
+    return;
+
+  free (p->machine);
+  p->machine = NULL;
 }
 
 
@@ -2653,7 +2693,7 @@ remove_useless_addtr_insns (insns, check
 
 }
 
-/* You may have trouble believing this, but this is the HP-PA stack
+/* You may have trouble believing this, but this is the 32 bit HP-PA stack
    layout.  Wow.
 
    Offset		Contents
@@ -3153,19 +3193,17 @@ hppa_expand_prologue()
      made incorrect assumptions about using global variables to hold
      per-function rtl code generated in the backend.
 
-     So instead, we copy the PIC register into a reserved callee saved
-     register in the prologue.  Then after each call we reload the PIC
-     register from the callee saved register.  We also reload the PIC
-     register from the callee saved register in the epilogue ensure the
-     PIC register is valid at function exit.
-
-     This may (depending on the exact characteristics of the function)
-     even be more efficient. 
-
-     Avoid this if the callee saved register wasn't used (these are
-     leaf functions).  */
-  if (flag_pic && regs_ever_live[PIC_OFFSET_TABLE_REGNUM_SAVED])
-    emit_move_insn (gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED),
+     So instead, we copy the PIC register into a callee saved register
+     in the prologue.  Then after each call we reload the PIC register
+     from the callee saved register.
+
+     Avoid doing this if the register isn't used (eg. leaf functions)
+     as it's an error to delete an instruction from the prologue.  */
+
+  if (flag_pic
+      && (GET_CODE (PIC_OFFSET_TABLE_SAVE_RTX) != REG
+	  || HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX)))
+    emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
 		    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
 }
 
diff -urp -xCVS egcs/gcc/config/pa/pa.h newegcs/gcc/config/pa/pa.h
--- egcs/gcc/config/pa/pa.h	Thu Jan  4 15:22:58 2001
+++ newegcs/gcc/config/pa/pa.h	Tue Jan 16 18:02:14 2001
@@ -70,6 +70,14 @@ enum architecture_type
   ARCHITECTURE_20
 };
 
+struct rtx_def;
+/* A C structure for machine-specific, per-function data.
+   This is added to the cfun structure.  */
+typedef struct machine_function
+{
+  struct rtx_def *pic_offset_table_save_rtx;
+} machine_function;
+
 /* For -march= option.  */
 extern const char *pa_arch_string;
 extern enum architecture_type pa_arch;
@@ -493,8 +501,8 @@ extern int target_flags;
 #define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED 1
 
 /* Register into which we save the PIC_OFFEST_TABLE_REGNUM so that it
-   can be restore across function calls.  */
-#define PIC_OFFSET_TABLE_REGNUM_SAVED 4
+   can be restored across function calls.  */
+#define PIC_OFFSET_TABLE_SAVE_RTX (cfun->machine->pic_offset_table_save_rtx)
 
 #define DEFAULT_PCC_STRUCT_RETURN 0
 
diff -urp -xCVS egcs/gcc/config/pa/pa.md newegcs/gcc/config/pa/pa.md
--- egcs/gcc/config/pa/pa.md	Mon Jan  8 22:47:00 2001
+++ newegcs/gcc/config/pa/pa.md	Tue Jan 16 10:45:58 2001
@@ -5735,18 +5735,12 @@
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
-	       gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
       if (TARGET_64BIT)
 	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
 
       /* After each call we must restore the PIC register, even if it
-	 doesn't appear to be used.
-
-         This will set regs_ever_live for the callee saved register we
-	 stored the PIC register in.  */
-      emit_move_insn (pic_offset_table_rtx,
-		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
+	 doesn't appear to be used.  */
+      emit_move_insn (pic_offset_table_rtx, PIC_OFFSET_TABLE_SAVE_RTX);
     }
   DONE;
 }")
@@ -5915,18 +5909,12 @@
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
-	       gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
       if (TARGET_64BIT)
 	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
 
       /* After each call we must restore the PIC register, even if it
-	 doesn't appear to be used.
-
-         This will set regs_ever_live for the callee saved register we
-	 stored the PIC register in.  */
-      emit_move_insn (pic_offset_table_rtx,
-		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
+	 doesn't appear to be used.  */
+      emit_move_insn (pic_offset_table_rtx, PIC_OFFSET_TABLE_SAVE_RTX);
     }
   DONE;
 }")
@@ -6096,16 +6084,10 @@
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
-	       gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
 
       /* After each call we must restore the PIC register, even if it
-	 doesn't appear to be used.
-
-         This will set regs_ever_live for the callee saved register we
-	 stored the PIC register in.  */
-      emit_move_insn (pic_offset_table_rtx,
-		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
+	 doesn't appear to be used.  */
+      emit_move_insn (pic_offset_table_rtx, PIC_OFFSET_TABLE_SAVE_RTX);
     }
   DONE;
 }")
@@ -6158,16 +6140,10 @@
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
-      use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
-	       gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
 
       /* After each call we must restore the PIC register, even if it
-	 doesn't appear to be used.
-
-         This will set regs_ever_live for the callee saved register we
-	 stored the PIC register in.  */
-      emit_move_insn (pic_offset_table_rtx,
-		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
+	 doesn't appear to be used.  */
+      emit_move_insn (pic_offset_table_rtx, PIC_OFFSET_TABLE_SAVE_RTX);
     }
   DONE;
 }")
diff -urp -xCVS egcs/gcc/config/pa/pa32-regs.h newegcs/gcc/config/pa/pa32-regs.h
--- egcs/gcc/config/pa/pa32-regs.h	Thu Jan 11 16:10:48 2001
+++ newegcs/gcc/config/pa/pa32-regs.h	Mon Jan 15 18:22:39 2001
@@ -110,11 +110,7 @@
 	fixed_regs[i] = call_used_regs[i] = 1; 	\
     }						\
   if (flag_pic)					\
-    {						\
-      fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
-      fixed_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
-      call_used_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
-    }						\
+    fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
 }
 
 /* Allocate the call used registers first.  This should minimize
diff -urp -xCVS egcs/gcc/config/pa/pa64-regs.h newegcs/gcc/config/pa/pa64-regs.h
--- egcs/gcc/config/pa/pa64-regs.h	Thu Jan 11 16:10:48 2001
+++ newegcs/gcc/config/pa/pa64-regs.h	Mon Jan 15 18:22:40 2001
@@ -109,11 +109,7 @@ Boston, MA 02111-1307, USA.  */
 	fixed_regs[i] = call_used_regs[i] = 1; 	\
     }						\
   if (flag_pic)					\
-    {						\
-      fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
-      fixed_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
-      call_used_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
-    }						\
+    fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
 }
 
 /* Allocate the call used registers first.  This should minimize
