Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA08874
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 23:58:46 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 1 Dec 2000 07:01:14 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA20177;
	Fri, 1 Dec 2000 18:00:38 +1100
Date: Fri, 1 Dec 2000 18:00:38 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: law@cygnus.com, rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <200012010612.BAA17871@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012011737510.2814-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 1 Dec 2000, John David Anglin wrote:

> >         b,l foo,%r2
> >         copy %r27,%r4
> >         addil LT'cpu_hz,%r4	! know r27 trashed in call, so use r4
> >         ldd RT'cpu_hz(%r1),%r1
> >         ldd -144(%r30),%r2
> >         ldw 0(%r1),%r19
> >         addil LT'L$C0000,%r27	! oops, should be using r4
> >         ldd RT'L$C0000(%r1),%r1
> 
> It looks to me like this happens because the register life analysis in
> pass 13 decides that r27 (dp) is dead.  This causes combine to delete the
> insn that restores r27 after the call to foo and use the value saved
> in r4 as a proxy for dp.

Yes.

> (insn 16 14 21 (set (reg:DI 27 %r27)
>         (reg:DI 4 %r4)) 123 {movstrsi_internal+11} (nil)
>     (expr_list:REG_DEAD (reg:DI 4 %r4)
> 	(nil)))
> 
> (insn 21 16 23 (set (reg:DI 68)
> 	(plus:DI (reg:DI 27 %r27)
> 	    (high:DI (symbol_ref:DI ("cpu_hz"))))) 81 {post_std+3} (insn_list 16 (nil))
>      (expr_list:REG_DEAD (reg:DI 27 %r27)
> 	(nil)))
> 
> The const_int's which follow haven't been expanded at this point.  Thus,
> the life analysis can't tell that r27 is still needed.

Exactly.  So how is the code in pa.c to know that PIC_OFFSET_TABLE_REGNUM 
has been clobbered - and should use PIC_OFFSET_TABLE_REGNUM_SAVED instead?
Using the saved version should be safe as it is a fixed reg.

Or is a better solution to simply ensure that r27 never dies?  I'm
thinking of ABI and (non-gnu) linker considerations.  eg. DLTIND21L relocs
not involving r27 may cause something to barf.

Alan
-- 
Linuxcare.  Support for the Revolution.
