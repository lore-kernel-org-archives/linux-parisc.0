Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA19482
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 10:47:03 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA06814
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 09:50:43 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Mon, 15 Jan 2001 22:09:30 +1100.
             <Pine.LNX.4.21.0101151430350.21322-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 15 Jan 2001 10:46:59 -0700
Message-ID: <9023.979580819@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0101151430350.21322-100000@front.linuxcare.com.au>y
ou write:
  > This patch rids us of PIC_OFFSET_TABLE_REGNUM_SAVED, and the problems that
  > go with it.  Additionally, I reload the pic offset table register before
  > calls to guard against asm trashing r27/r19.  Hasn't bootstrapped yet, but
  > looks promising.  One possible fly in the ointment is whether any ABI
  > requires that r4 always be used to save the pic offset table reg.
  > 
  > 	* config/pa/pa.h (PIC_OFFSET_TABLE_REGNUM_SAVED): Remove.
  > 	(machine_function): Define.
  > 	(PIC_OFFSET_TABLE_SAVE_RTX) : Define.
  > 	(INIT_EXPANDERS): Define.
  > 	* config/pa/pa.c (pa_init_machine_status, pa_free_machine_status,
  > 	pa_init_expanders): New functions.
  > 	(hppa_expand_prologue): Use PIC_OFFSET_TABLE_SAVE_RTX instead of
  > 	PIC_OFFSET_TABLE_REGNUM_SAVED.
  > 	* config/pa/pa.md: Use PIC_OFFSET_TABLE_SAVE_RTX instead of
  > 	PIC_OFFSET_TABLE_REGNUM_SAVED throughout.  Restore pic offset
  > 	table register before all calls as well as after.
  > 	* config/pa/pa32-regs.h (CONDITIONAL_REGISTER_USAGE): Remove
  > 	references to PIC_OFFSET_TABLE_REGNUM_SAVED.
  > 	* config/pa/pa64-regs.h (CONDITIONAL_REGISTER_USAGE): Likewise.
First, if an ASM trashes a fixed register, then it is the ASM's responsibility
to restore it.  So that part of this patch is wrong.

The rest of it looks pretty reasonable and can be installed.

jeff
