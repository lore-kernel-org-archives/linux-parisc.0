Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA10564
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Nov 2000 10:38:48 -0700
Message-Id: <200011091739.MAA07483@hiauly1.hia.nrc.ca>
Subject: Re: testcase for hppa64 gcc bug
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Thu, 9 Nov 2000 12:39:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com, law@cygnus.com
In-Reply-To: <no.id> from "John David Anglin" at Nov 3, 2000 03:01:17 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > So I went down the path of trying to fix things properly by defining
> > ELIMINABLE_REGS and so on, but I ended in a maze of twisty little passages
> > labelled "Unrecognizable instruction", like this one:
> > 
> > /src/parisc/gcc/gcc/libgcc2.c: In function `__moddi3':
> > /src/parisc/gcc/gcc/libgcc2.c:601: Unrecognizable insn:
> > (insn 1289 209 1298 (set (reg:SI 50 %fr22)
> >         (subreg:SI (plus:DI (reg:DI 30 %r30)
> >                 (const_int -272 [0xfffffef0])) 0)) -1 (nil)
> >     (nil))
> > /src/parisc/gcc/gcc/libgcc2.c:601: Internal compiler error in
> > extract_insn, at recog.c:2134
> 
> I am making progress in trying to make the arg_pointer register eliminable.
> I have fixed the above problem.  What was happening was that reload_as_needed
> was incorrectly trying to eliminate the return from millicode calls which
> is also register r29.  I have figured out how to hide it from reload with
> unspec.
> 
> However, the compiler is now too good at eliminating the arg_pointer.  At
> -O3, it completely eliminates the arg_pointer.  However, as I read the ABI,
> the call must always set the arg_pointer before calls.

For the record, here is my final patch regarding making the arg_pointer
eliminable for TARGET_64BIT.  I think the code it generates is correct but
it hasn't been extensively tested.  However, I don't recommend it for
installation since in comparing the assembler code generated with and
without elimination for a couple of test cases, I didn't observe any
significant improvement in the code with the patch.  Possibly, the patch
implicitly disables elimination when the arg_pointer is needed.

I do find that Alan Modra's ARG_POINTER_INVARIANT patch needs to be installed
to get correct code with his test case.

There is one part of the patch below which I think needs to be installed.
That is

	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.

The use for the arg_pointer needs to be pulled out of the `if (flag_pic)'.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-11-07  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa-linux64.h (ARG_POINTER_INVARIANT): Define even when the
	arg_pointer is being eliminated.
	(ELIMINABLE_REGS): Enable elimination of the arg_pointer.
	(INITIAL_ELIMINATION_OFFSET): Revise offsets for arg_pointer.
	* pa.md (mulsi3, divsi3, udivsi3, modsi3, umodsi3 and
	canonicalize_funcptr_for_compare): Put "(reg:SI 26)" inside
	unspec to prevent elimination.
	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.
	Use the new addmovdi3 insn to load the arg_pointer register.
	(addmovdi3 and mov_from_r29_si): New insn and expand which prevent
	r29 from being eliminated in call setups and millicode returns.

--- pa-linux64.h.orig	Tue Oct 31 18:38:24 2000
+++ pa-linux64.h	Tue Nov  7 12:17:12 2000
@@ -209,21 +209,18 @@
    that grow to lower addresses.  What fun.  */
 #undef ARGS_GROW_DOWNWARD
 #undef ARG_POINTER_REGNUM
-#define ARG_POINTER_INVARIANT 0
 #define ARG_POINTER_REGNUM 29
+#define ARG_POINTER_INVARIANT 0
 #undef STATIC_CHAIN_REGNUM
 #define STATIC_CHAIN_REGNUM 31
 
-#if 1
-#define ARG_POINTER_INVARIANT 0
-#else
-/* If defined, this macro specifies a table of register pairs used to eliminate
-   unneeded registers that point into the stack frame.  */
+/* If defined, this macro specifies a table of register pairs used to
+   eliminate unneeded registers that point into the stack frame.  */
 
 #define ELIMINABLE_REGS							\
 {									\
-  {ARG_POINTER_REGNUM,	 STACK_POINTER_REGNUM},				\
   {FRAME_POINTER_REGNUM, STACK_POINTER_REGNUM},				\
+  {ARG_POINTER_REGNUM,	 STACK_POINTER_REGNUM},				\
   {ARG_POINTER_REGNUM,	 FRAME_POINTER_REGNUM},				\
 }
 
@@ -240,19 +237,18 @@
 #define INITIAL_ELIMINATION_OFFSET(FROM, TO, OFFSET) \
   do								\
     {								\
-      int fsize;						\
+      int fsize = compute_frame_size (get_frame_size (), 0);	\
 								\
       if ((TO) == FRAME_POINTER_REGNUM				\
 	  && (FROM) == ARG_POINTER_REGNUM)			\
 	{							\
-	  (OFFSET) = - current_function_pretend_args_size - 16;	\
+	  (OFFSET) = fsize + 48 - current_function_outgoing_args_size;	\
 	  break;						\
 	}							\
 								\
       if ((TO) != STACK_POINTER_REGNUM)				\
 	abort ();						\
 								\
-      fsize = compute_frame_size (get_frame_size (), 0);	\
       switch (FROM)						\
 	{							\
 	case FRAME_POINTER_REGNUM:				\
@@ -260,14 +256,13 @@
 	  break;						\
 								\
 	case ARG_POINTER_REGNUM:				\
-	  (OFFSET) = - fsize - current_function_pretend_args_size - 16;	\
+	  (OFFSET) = 48 - current_function_outgoing_args_size;  \
 	  break;						\
 								\
 	default:						\
 	  abort ();						\
 	}							\
     } while (0)
-#endif
 
 #undef SELECT_RTX_SECTION
 #define SELECT_RTX_SECTION(MODE,RTX)	\
--- pa.md.orig	Tue Nov  7 13:50:34 2000
+++ pa.md.work	Wed Nov  8 14:06:05 2000
@@ -3993,7 +3993,7 @@
 	      (clobber (reg:SI 26))
 	      (clobber (reg:SI 25))
 	      (clobber (reg:SI 31))])
-   (set (match_operand:SI 0 "general_operand" "") (reg:SI 29))]
+   (set (match_operand:SI 0 "general_operand" "") (unspec:SI [(reg:SI 29)] 0))]
   ""
   "
 {
@@ -4139,7 +4139,7 @@
 	      (clobber (reg:SI 26))
 	      (clobber (reg:SI 25))
 	      (clobber (reg:SI 31))])
-   (set (match_operand:SI 0 "general_operand" "") (reg:SI 29))]
+   (set (match_operand:SI 0 "general_operand" "") (unspec:SI [(reg:SI 29)] 0))]
   ""
   "
 {
@@ -4197,7 +4197,7 @@
 	      (clobber (reg:SI 26))
 	      (clobber (reg:SI 25))
 	      (clobber (reg:SI 31))])
-   (set (match_operand:SI 0 "general_operand" "") (reg:SI 29))]
+   (set (match_operand:SI 0 "general_operand" "") (unspec:SI [(reg:SI 29)] 0))]
   ""
   "
 {
@@ -4255,7 +4255,7 @@
 	      (clobber (reg:SI 26))
 	      (clobber (reg:SI 25))
 	      (clobber (reg:SI 31))])
-   (set (match_operand:SI 0 "general_operand" "") (reg:SI 29))]
+   (set (match_operand:SI 0 "general_operand" "") (unspec:SI [(reg:SI 29)] 0))]
   ""
   "
 {
@@ -4310,7 +4310,7 @@
 	      (clobber (reg:SI 26))
 	      (clobber (reg:SI 25))
 	      (clobber (reg:SI 31))])
-   (set (match_operand:SI 0 "general_operand" "") (reg:SI 29))]
+   (set (match_operand:SI 0 "general_operand" "") (unspec:SI [(reg:SI 29)] 0))]
   ""
   "
 {
@@ -5785,9 +5785,9 @@
     op = XEXP (operands[0], 0);
 
   if (TARGET_64BIT)
-    emit_move_insn (arg_pointer_rtx,
-		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
-				  GEN_INT (64)));
+    emit_insn (gen_addmovdi3 (arg_pointer_rtx,
+			      virtual_outgoing_args_rtx,
+			      GEN_INT (64)));
 
   /* Use two different patterns for calls to explicitly named functions
      and calls through function pointers.  This is necessary as these two
@@ -5809,13 +5809,14 @@
       call_insn = emit_call_insn (gen_call_internal_reg (operands[1]));
     }
 
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
+
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn),
 	       gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM_SAVED));
-      if (TARGET_64BIT)
-	use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
 
       /* After each call we must restore the PIC register, even if it
 	 doesn't appear to be used.
@@ -5961,9 +5962,9 @@
     op = XEXP (operands[1], 0);
 
   if (TARGET_64BIT)
-    emit_move_insn (arg_pointer_rtx,
-		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
-				  GEN_INT (64)));
+    emit_insn (gen_addmovdi3 (arg_pointer_rtx,
+			      virtual_outgoing_args_rtx,
+			      GEN_INT (64)));
 
   /* Use two different patterns for calls to explicitly named functions
      and calls through function pointers.  This is necessary as these two
@@ -5989,6 +5990,10 @@
       call_insn = emit_call_insn (gen_call_value_internal_reg (operands[0],
 							       operands[2]));
     }
+
+  if (TARGET_64BIT)
+    use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), arg_pointer_rtx);
+
   if (flag_pic)
     {
       use_reg (&CALL_INSN_FUNCTION_USAGE (call_insn), pic_offset_table_rtx);
@@ -7124,7 +7129,7 @@
 	      (clobber (reg:SI 22))
 	      (clobber (reg:SI 31))])
    (set (match_operand:SI 0 "register_operand" "")
-	(reg:SI 29))]
+	(unspec:SI [(reg:SI 29)] 0))]
   "! TARGET_PORTABLE_RUNTIME && !TARGET_64BIT && !TARGET_ELF32"
   "
 {
@@ -7236,3 +7241,48 @@
   emit_insn (gen_blockage ());
   DONE;
 }")
+
+;; For TARGET_64BIT, the arg_pointer register is also used for millicode
+;; returns.  The ABI requires that the arg_pointer be set for all calls.
+;; When the arg_pointer is made an eliminable register, eliminate_regs
+;; will eliminate the arg_pointer register from the function call setup and
+;; millicode returns unless the arg_pointer is hidden in a use, clobber or
+;; unspec.
+
+;; This is for loading the arg_pointer in function calls.
+(define_insn "addmovdi3"
+  [(set (unspec:DI [(match_operand:DI 0 "register_operand" "=r,r")] 0)
+        (plus:DI (match_operand:DI 1 "register_operand" "r,r")
+		 (match_operand 2 "const_int_operand" "J,i")))
+   (set (match_dup 0) (match_dup 0))]
+  "TARGET_64BIT"
+  "@
+  ldo %2(%1),%0
+  ldil L'%G2,%0\;add,l %0,%1,%0"
+  [(set_attr "type" "binary,binary")
+   (set_attr "pa_combine_type" "addmove,none")
+   (set_attr "length" "4,8")])
+
+;; This is for millicode return.
+(define_expand "mov_from_r29_si"
+  [(set (match_operand:SI 0 "" "")
+        (unspec:SI [(reg:SI 29)] 0))]
+  ""
+  "
+{
+  if (!TARGET_64BIT)
+    {
+      rtx tmp = gen_rtx_REG (SImode, 29);
+      emit_insn (gen_movsi (operands[0], tmp));
+      DONE;
+    }
+}")
+
+(define_insn ""
+  [(set (match_operand:SI 0 "register_operand" "=r")
+	(unspec:SI [(reg:SI 29)] 0))]
+  ""
+  "copy %%r29,%0"
+  [(set_attr "type" "multi")
+   (set_attr "length" "4")])
+
