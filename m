Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14129
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 13:37:10 -0700
Message-Id: <200012162038.PAA25535@hiauly1.hia.nrc.ca>
To: law@redhat.com
Date: Sat, 16 Dec 2000 15:38:02 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20289.976765412@upchuck> from "Jeffrey A Law" at Dec 13, 2000 08:43:32 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] PATCH: Adjust label usage count for new insns [was Re: pa reload problem]
List-ID: <linux-parisc.vger.kernel.org>

>   > Here is the rtl after loop:

>   > (insn 1531 1528 1532 (set (reg/f:SI 337)
>   >         (high:SI (label_ref:SI 1158))) -1 (nil)
>   >     (expr_list:REG_LABEL (code_label/v 1158 1268 1439 124 "" "" [0 uses])
>   >         (nil)))
>   > 
>   > (insn 1532 1531 1535 (set (reg/f:SI 208)
>   >         (lo_sum:SI (reg/f:SI 337)
>   >             (label_ref:SI 1158))) -1 (nil)
>   >     (expr_list:REG_EQUAL (label_ref:SI 1158)
>   >         (expr_list:REG_LABEL (code_label/v 1158 1268 1439 124 "" "" [0 uses
>   > ])
>   >             (nil))))
>   > 
>   > The code_label 1158 is deleted by delete_trivially_dead_insns apparently 
>   > because the preceding call to loop_optimize in toplev.c has reduced the
>   > number of uses to 1.  Maybe somebody can see how this occurs.
> Seems to me we have a reference counting problem.  There is clearly 
> a reference to label 1158 (insn 1531/1532), but it's reference count
> is zero.

These insns result from "moving" insns with label_ref's out of a loop.  The
old insns are deleted by delete_insn which reduces the LABEL_NUSES count.
However, the LABEL_NUSES count is not incremented when the new insns
are created.  This leaves the number of uses of the label at 1 and
delete_trivially_dead_insns deletes the code_label after loop_optimize
completes.

The simplest solution is to modify add_label_notes to increment the usage
count for CODE_LABEL's.  As far as I can tell, add_label_notes is only
used in loop.c when a new insn is created and an old one deleted.  An
alternative solution might be to actually move the old insn in the list
rather than deleting it.

There appears to be a similar situation in gcse.c.

I have run a complete bootstrap and check at -O3 under hpux 10.20 with this
patch and the patch previously posted at
<http://gcc.gnu.org/ml/gcc-bugs/2000-12/msg00156.html>.  It fixes register
rename walking over the return pointer.  The test results are here
<http://gcc.gnu.org/ml/gcc-testresults/2000-12/msg00172.html>.  I have also
run a complete bootstrap and check under i686 linux.

Please review and install if OK.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-12-14  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* loop.c (add_label_notes): Increment the label usage count when
	a note is added to an insn which refers to a CODE_LABEL.
	* gcse.c (add_label_notes): Likewise.

--- loop.c.orig	Thu Nov 30 12:22:29 2000
+++ loop.c	Fri Dec 15 17:25:46 2000
@@ -1589,7 +1589,8 @@
 }
 
 /* If X contains any LABEL_REF's, add REG_LABEL notes for them to all
-  insns in INSNS which use the reference.  */
+   insns in INSNS which use the reference.  LABEL_NUSES for CODE_LABEL
+   references is incremented once for each added note. */
 
 static void
 add_label_notes (x, insns)
@@ -1610,8 +1611,12 @@
          mark_jump_label for additional information).  */
       for (insn = insns; insn; insn = NEXT_INSN (insn))
 	if (reg_mentioned_p (XEXP (x, 0), insn))
-	  REG_NOTES (insn) = gen_rtx_EXPR_LIST (REG_LABEL, XEXP (x, 0),
-						REG_NOTES (insn));
+	  {
+	    REG_NOTES (insn) = gen_rtx_EXPR_LIST (REG_LABEL, XEXP (x, 0),
+						  REG_NOTES (insn));
+	    if (LABEL_P (XEXP (x, 0)))
+	      LABEL_NUSES (XEXP (x, 0))++;
+	  }
     }
 
   fmt = GET_RTX_FORMAT (code);
--- gcse.c.orig	Wed Dec  6 16:16:30 2000
+++ gcse.c	Fri Dec 15 17:23:06 2000
@@ -4839,8 +4839,9 @@
 }
 
 /* If X contains any LABEL_REF's, add REG_LABEL notes for them to INSN.
-   We have to add REG_LABEL notes, because the following loop optimization
-   pass requires them.  */
+   If notes are added to an insn which references a CODE_LABEL, the
+   LABEL_NUSES count is incremented.  We have to add REG_LABEL notes,
+   because the following loop optimization pass requires them.  */
 
 /* ??? This is very similar to the loop.c add_label_notes function.  We
    could probably share code here.  */
@@ -4868,6 +4869,8 @@
 
       REG_NOTES (insn) = gen_rtx_EXPR_LIST (REG_LABEL, XEXP (x, 0),
 					    REG_NOTES (insn));
+      if (LABEL_P (XEXP (x, 0)))
+        LABEL_NUSES (XEXP (x, 0))++;
       return;
     }
 
