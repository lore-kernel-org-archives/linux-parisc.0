Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA17142
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 22:56:29 -0700
Message-Id: <200101170559.AAA24936@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: law@redhat.com
Date: Wed, 17 Jan 2001 00:59:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rth@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <22207.979709436@upchuck.cygnus.com> from "Jeffrey A Law" at Jan 16, 2001 10:30:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
>  In message <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>yo
> u write:
>   > +  if (flag_pic
>   > +      && (GET_CODE (PIC_OFFSET_TABLE_SAVE_RTX) != REG
>   > +	  || HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX)))
>   > +    emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
>   >  		    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
> I do have a question about this particular hunk of code.
> 
> I can't think of a condition where PIC_OFFSET_TABLE_SAVE_RTX would not be
> a reg when this code was executed.  Simlarly I can't think of a case where
> it would be a hard reg.
> 
> I think we should just emit the insn unconditionally unless you're aware
> of some reason we can't shouldn't.

I am fairly certain that it is being emitted (see email from a couple
hours ago about ICE warning).  As I understand it, the reason we don't
emit it unconditionally is that insns can't be deleted in the prologue,
so we try not to emit it if it isn't needed.

> We're probably also going to need to emit a use of the %r19 and maybe %r27
> on the return insns to ensure the pic register is restored after the
> final call in any given function.

Yup.

I am currently running a bootstrap with the following additional patch.
I reverted to EPILOGUE_USES because I have the feeling that there are
problems with putting the use in the return insn.  See the last test
results which I posted yesterday at
<http://gcc.gnu.org/ml/gcc-testresults/2001-01/msg00204.html>.

The results were done with a stock built except for reverting the call
used patch for the PIC_OFFSET_TABLE_REGNUM_SAVED register.  A previous
run using EPILOGUE_USES rather than the use in the trivial return had
much better results.  However, it is possible the problem is elsewhere.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2001-01-17  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.h (EPILOGUE_USES): Define.  The epilogue uses the return pointer
	and when generating pic code the pic offset table register.
	* pa.md (return, return_internal): Rework.

--- pa.h.save	Tue Jan 16 18:08:18 2001
+++ pa.h	Tue Jan 16 23:44:08 2001
@@ -500,7 +500,7 @@
 #define PIC_OFFSET_TABLE_REGNUM (TARGET_64BIT ? 27 : 19)
 #define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED 1
 
-/* Register into which we save the PIC_OFFEST_TABLE_REGNUM so that it
+/* Register into which we save the PIC_OFFSET_TABLE_REGNUM so that it
    can be restored across function calls.  */
 #define PIC_OFFSET_TABLE_SAVE_RTX (cfun->machine->pic_offset_table_save_rtx)
 
@@ -918,6 +918,9 @@
 #define FUNCTION_EPILOGUE(FILE, SIZE)			\
   output_function_epilogue (FILE, SIZE)
 
+#define EPILOGUE_USES(REGNO) \
+  ((REGNO) == 2 || (flag_pic && (REGNO) == PIC_OFFSET_TABLE_REGNUM))
+
 /* Output assembler code for a block containing the constant parts
    of a trampoline, leaving space for the variable parts.\
 
--- pa.md.save	Tue Jan 16 18:08:21 2001
+++ pa.md	Tue Jan 16 18:11:02 2001
@@ -5467,9 +5467,7 @@
 ;; Unconditional and other jump instructions.
 
 (define_insn "return"
-  [(return)
-   (use (reg:SI 2))
-   (const_int 0)]
+  [(return)]
   "hppa_can_use_return_insn_p ()"
   "*
 {
@@ -5485,7 +5483,7 @@
 (define_insn "return_internal"
   [(return)
    (use (reg:SI 2))
-   (const_int 1)]
+   (const_int 0)]
   ""
   "*
 {
