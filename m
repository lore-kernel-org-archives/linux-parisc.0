Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA01523
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 05:33:29 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Dec 2000 12:35:52 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA29889;
	Sat, 2 Dec 2000 23:35:19 +1100
Date: Sat, 2 Dec 2000 23:35:19 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-patches@gcc.gnu.org
Subject: Re: pa reload problem
In-Reply-To: <200012020733.CAA24227@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

For those reading this in gcc-patches, this thread starts with a testcase
distilled from the linux kernel at
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/11-Nov/0388.html
with Dave's analysis at
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/11-Nov/0391.html

On Sat, 2 Dec 2000, John David Anglin wrote:

> > Or is a better solution to simply ensure that r27 never dies?  I'm
> > thinking of ABI and (non-gnu) linker considerations.  eg. DLTIND21L relocs
> > not involving r27 may cause something to barf.
> 
> Here is a patch that I think resolves the problem.  The principal fix is
> not to define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.  The reason for not
> defining this is the call expander explicitly restores the pic offset register
> after each call.  Thus, I think we can lie about the register being
> clobbered.

Telling lies generally leads to being caught out. ;-)

I prefer this patch, which strikes at the heart of the problem, and
doesn't seem to cause any new problems.  (apart from an unnecessary
register transfer at the end of some functions)

	* flow.c (mark_regs_live_at_end): Set PIC_OFFSET_TABLE_REGNUM even
	when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.

Alan
-- 
Linuxcare.  Support for the Revolution.

--- gcc/flow.c~	Fri Dec  1 15:56:03 2000
+++ gcc/flow.c	Sat Dec  2 20:50:51 2000
@@ -3249,13 +3249,17 @@ mark_regs_live_at_end (set)
     }
 
 #ifdef PIC_OFFSET_TABLE_REGNUM
-#ifndef PIC_OFFSET_TABLE_REG_CALL_CLOBBERED
   /* Many architectures have a GP register even without flag_pic.
      Assume the pic register is not in use, or will be handled by
-     other means, if it is not fixed.  */
+     other means, if it is not fixed.
+     We need to mark PIC_OFFSET_TABLE_REGNUM live at the end of a
+     function even when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED because
+     reload may require it be valid.
+     ie. PIC_OFFSET_TABLE_REG_CALL_CLOBBERED should be viewed as
+     indicating what may happen during a call, not viewed as a
+     license allowing a register to die.  */
   if (fixed_regs[PIC_OFFSET_TABLE_REGNUM])
     SET_REGNO_REG_SET (set, PIC_OFFSET_TABLE_REGNUM);
-#endif
 #endif
 
   /* Mark all global registers, and all registers used by the epilogue
