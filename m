Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA09359
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 15:59:38 -0700
Message-Id: <200012022301.SAA04377@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Sat, 2 Dec 2000 18:01:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-patches@gcc.gnu.org
In-Reply-To: <20001202114327.C27671@redhat.com> from "Richard Henderson" at Dec 2, 2000 11:43:27 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Sat, Dec 02, 2000 at 11:35:19PM +1100, Alan Modra wrote:
> > 	* flow.c (mark_regs_live_at_end): Set PIC_OFFSET_TABLE_REGNUM even
> > 	when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.
> 
> I can't believe this makes a difference.  We already have
> 
> #ifdef PIC_OFFSET_TABLE_REGNUM
>               /* Before reload, do not allow sets of the pic register
>                  to be deleted.  Reload can insert references to
>                  constant pool memory anywhere in the function, making
>                  the PIC register live where it wasn't before.  */
>               if (regno == PIC_OFFSET_TABLE_REGNUM && fixed_regs[regno]
>                   && ! reload_completed)
>                 return 0;
> #endif

I saw this but for some reason it didn't stop the set after the call from being
deleted in the combine pass.  Maybe this needs to be looked at in more detail
to determine why it doesn't work in this circumstance.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
