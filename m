Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA17181
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 22:31:38 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 05:33:58 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA29228;
	Tue, 5 Dec 2000 16:33:29 +1100
Date: Tue, 5 Dec 2000 16:33:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <200012050050.TAA07749@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012051609230.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 4 Dec 2000, John David Anglin wrote:

> > Getting back on topic, the reload problem _does_ affect 32 bit hppa code.
> > Compiling my testcase with -O2 -fPIC -S, gives
> > 
> >         copy %r19,%r4
> >         bl foo,%r2
> >         stw %r19,-32(%r30)
> >         addil LT'cpu_hz,%r4
> >         copy %r1,%r21
> >         addil LT'.LC0,%r19		! oops
> 
> For some reason, I only saw this with the 64 bit version.

Probably because it only appears with -fpic (or -fPIC), which you get for
free on pa64

> There is one other bit of code in rtlanal.c related to the patch which
> bothers me.  I am wondering if it is ok or needs changing:
> 
> #ifndef PIC_OFFSET_TABLE_REG_CALL_CLOBBERED
>       /* ??? When call-clobbered, the value is stable modulo the restore
>          that must happen after a call.  This currently screws up local-alloc
>          into believing that the restore is not needed.  */
>       if (x == pic_offset_table_rtx)
>         return 0;
> #endif
> 
> This is in rtx_unstable_p and rtx_varies_p.  Possibly, now that there is
> a use until reload is complete, this problem is fixed and the
> pic_offset_table_rtx should be stable even when
> PIC_OFFSET_TABLE_REG_CALL_CLOBBERED?  See comment at beginning of
> rtx_varies_p.

Likely so.  With rth's latest patch to calculate_global_regs_live, it's
possibile that I can remove some of the ARG_POINTER_INVARIANT patch too.

-- 
Linuxcare.  Support for the Revolution.
