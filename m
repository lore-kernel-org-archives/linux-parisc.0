Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA16000
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 22:20:23 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id VAA07430
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 21:24:03 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Richard Henderson <rth@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Tue, 16 Jan 2001 20:28:12 +1100.
             <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Jan 2001 22:26:11 -0700
Message-ID: <22177.979709171@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>



  In message <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>yo
u write:
  > On Mon, 15 Jan 2001, Richard Henderson wrote:
  > 
  > > On Tue, Jan 16, 2001 at 12:20:19PM +1100, Alan Modra wrote:
  > > > 	* config/pa/pa.c (pa_init_machine_status, pa_free_machine_statu
  > s,
  > > > 	pa_init_expanders): New functions.
  > > 
  > > You need a mark_machine_status function.  It is also much better
  > > to set the global variables once in override_options than for
  > > every function in init_expanders.
Actually, just to be clear, we don't want to do this initialization
in the override_options since we're generating a register!  We need to
do that for each function!

  > gcc/ChangeLog
  > 	* config/pa/pa.h (PIC_OFFSET_TABLE_REGNUM_SAVED): Remove.
  > 	(machine_function): Define.
  > 	(PIC_OFFSET_TABLE_SAVE_RTX) : Define.
  > 	* config/pa/pa.c (pa_init_machine_status, pa_mark_machine_status,
  > 	pa_free_machine_status): New functions.
  > 	(override_options): Set {init,mark,free}_machine_status to above.
  > 	(hppa_expand_prologue): Use PIC_OFFSET_TABLE_SAVE_RTX instead of
  > 	PIC_OFFSET_TABLE_REGNUM_SAVED.
  > 	* config/pa/pa.md: Use PIC_OFFSET_TABLE_SAVE_RTX instead of
  > 	PIC_OFFSET_TABLE_REGNUM_SAVED throughout.
  > 	* config/pa/pa32-regs.h (CONDITIONAL_REGISTER_USAGE): Remove
  > 	references to PIC_OFFSET_TABLE_REGNUM_SAVED.
  > 	* config/pa/pa64-regs.h (CONDITIONAL_REGISTER_USAGE): Likewise.
I've installed this patch.

Jeff
