Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA02861
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 23:00:46 -0700
Message-Id: <200101180604.BAA18964@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: law@redhat.com
Date: Thu, 18 Jan 2001 01:04:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rth@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <25409.979767732@upchuck.cygnus.com> from "Jeffrey A Law" at Jan 17, 2001 02:42:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <200101171622.LAA13215@hiauly1.hia.nrc.ca>you write:
>   > I think all these problems can be resolved by emitting the insn at the
>   > first call.  We just have to keep track of whether it has been emitted
>   > or not.
> I'm not entirely sure what you mean by this.
> 
> We must emit the code to restore the PIC register after each call when
> generating PIC code.  There are no known exceptions to this rule.
> 
> You might be talking about saving the PIC register into the stack or
> pseudo during the prologue.  Yes, we could arrange to do that if and
> only if we had a call in PIC mode.  That's fairly easy to do.

I think this will make what I was saying clearer.  This doesn't suffer
from the problem that the original implementation had because it doesn't
use a global variable.  Bootstrap is now in the latter part of stage 2.
I looked at the assembly code generated for a function with one call
and it seemed fine.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2001-01-17  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.c (pa_init_machine_status): Initialize
	p->machine->pic_offset_table_reg_saved.
	(hppa_expand_prologue): Remove code to save pic offset table register.
	* pa.h (machine_function): Add member pic_offset_table_reg_saved.
	(PIC_OFFSET_TABLE_SAVE_RTX): Correct typo in comment.
	(PIC_OFFSET_TABLE_REG_SAVED): Define.
	(EPILOGUE_USES): Define to keep the pic offset table register live.
	* pa.md (call, call_value): Add code to save the pic offset table
	register when necessary.

--- pa.c.orig	Wed Jan 17 01:46:52 2001
+++ pa.c	Wed Jan 17 19:09:38 2001
@@ -207,6 +207,7 @@
   p->machine = (machine_function *) xmalloc (sizeof (machine_function));
 
   p->machine->pic_offset_table_save_rtx = gen_reg_rtx (Pmode);
+  p->machine->pic_offset_table_reg_saved = 0;
 }
 
 static void
@@ -3186,25 +3187,6 @@
 	    }
 	}
     }
-
-  /* When generating PIC code it is necessary to save/restore the
-     PIC register around each function call.  We used to do this
-     in the call patterns themselves, but that implementation
-     made incorrect assumptions about using global variables to hold
-     per-function rtl code generated in the backend.
-
-     So instead, we copy the PIC register into a callee saved register
-     in the prologue.  Then after each call we reload the PIC register
-     from the callee saved register.
-
-     Avoid doing this if the register isn't used (eg. leaf functions)
-     as it's an error to delete an instruction from the prologue.  */
-
-  if (flag_pic
-      && (GET_CODE (PIC_OFFSET_TABLE_SAVE_RTX) != REG
-	  || HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX)))
-    emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
-		    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
 }
 
 
--- pa.h.orig	Wed Jan 17 18:52:09 2001
+++ pa.h	Wed Jan 17 19:05:02 2001
@@ -76,6 +76,7 @@
 typedef struct machine_function
 {
   struct rtx_def *pic_offset_table_save_rtx;
+  int pic_offset_table_reg_saved;
 } machine_function;
 
 /* For -march= option.  */
@@ -500,10 +501,14 @@
 #define PIC_OFFSET_TABLE_REGNUM (TARGET_64BIT ? 27 : 19)
 #define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED 1
 
-/* Register into which we save the PIC_OFFEST_TABLE_REGNUM so that it
+/* Register into which we save the PIC_OFFSET_TABLE_REGNUM so that it
    can be restored across function calls.  */
 #define PIC_OFFSET_TABLE_SAVE_RTX (cfun->machine->pic_offset_table_save_rtx)
 
+/* Flag to indicate whether the pic offset table register has been saved
+   in a function.  */
+#define PIC_OFFSET_TABLE_REG_SAVED (cfun->machine->pic_offset_table_reg_saved)
+
 #define DEFAULT_PCC_STRUCT_RETURN 0
 
 /* SOM ABI says that objects larger than 64 bits are returned in memory.
@@ -918,6 +923,12 @@
 #define FUNCTION_EPILOGUE(FILE, SIZE)			\
   output_function_epilogue (FILE, SIZE)
 
+/* Define this macro as a C expression that is nonzero for registers
+   used by the epilogue or the `return' pattern.  */
+
+#define EPILOGUE_USES(REGNO) \
+  ((REGNO) == 2 || (flag_pic && (REGNO) == PIC_OFFSET_TABLE_REGNUM))
+
 /* Output assembler code for a block containing the constant parts
    of a trampoline, leaving space for the variable parts.\
 
--- pa.md.orig	Wed Jan 17 01:46:53 2001
+++ pa.md	Wed Jan 17 19:31:57 2001
@@ -5712,6 +5712,13 @@
 		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
 				  GEN_INT (64)));
 
+  if (flag_pic && ! PIC_OFFSET_TABLE_REG_SAVED)
+    {
+      emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
+		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
+      PIC_OFFSET_TABLE_REG_SAVED = 1;
+    }
+
   /* Use two different patterns for calls to explicitly named functions
      and calls through function pointers.  This is necessary as these two
      types of calls use different calling conventions, and CSE might try
@@ -5882,6 +5889,13 @@
 		    gen_rtx_PLUS (word_mode, virtual_outgoing_args_rtx,
 				  GEN_INT (64)));
 
+  if (flag_pic && ! PIC_OFFSET_TABLE_REG_SAVED)
+    {
+      emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
+		      gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
+      PIC_OFFSET_TABLE_REG_SAVED = 1;
+    }
+
   /* Use two different patterns for calls to explicitly named functions
      and calls through function pointers.  This is necessary as these two
      types of calls use different calling conventions, and CSE might try
