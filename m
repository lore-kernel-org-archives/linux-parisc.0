Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA06529
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 12:40:57 -0700
Date: Sat, 2 Dec 2000 11:43:27 -0800
From: Richard Henderson <rth@redhat.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-patches@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001202114327.C27671@redhat.com>
References: <200012020733.CAA24227@hiauly1.hia.nrc.ca> <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au>; from Alan Modra on Sat, Dec 02, 2000 at 11:35:19PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 02, 2000 at 11:35:19PM +1100, Alan Modra wrote:
> 	* flow.c (mark_regs_live_at_end): Set PIC_OFFSET_TABLE_REGNUM even
> 	when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.

I can't believe this makes a difference.  We already have

#ifdef PIC_OFFSET_TABLE_REGNUM
              /* Before reload, do not allow sets of the pic register
                 to be deleted.  Reload can insert references to
                 constant pool memory anywhere in the function, making
                 the PIC register live where it wasn't before.  */
              if (regno == PIC_OFFSET_TABLE_REGNUM && fixed_regs[regno]
                  && ! reload_completed)
                return 0;
#endif

in insn_dead_p.  Although one could argue keeping the register
live rather than avoiding deaths is a cleaner solution.


r~
