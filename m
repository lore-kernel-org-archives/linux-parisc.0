Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA30276
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 00:13:14 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Dec 2000 07:15:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA23742;
	Sat, 2 Dec 2000 18:15:14 +1100
Date: Sat, 2 Dec 2000 18:15:14 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
In-Reply-To: <20001201202613.E7166@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0012021658060.21742-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 1 Dec 2000, Richard Hirst wrote:

> Hi Alan,
>   I think I've found a case where it calls an external function with
> dp corrupt, sym53c8xx.c again, in ncr_setsync().  Don't know if this
> is relevant given what you now know about the bug.
> 
> .L2977:
>         ldh 66(%r3),%r28
>         extrw,u %r28,31,16,%r19
>         extrw,u %r19,30,31,%r26
>         copy %r19,%r25
>         add,l %r21,%r26,%r26
>         .IMPORT $$divU,MILLICODE
>         b,l $$divU,%r2			<< stub will corrupt dp
>         ldi 2000,%r20
>         cmpb,<< %r20,%r19,.L2978
>         extrd,u %r29,63,32,%r5
>         ldh 1688(%r6),%r20
>         ldi 32,%r19
>         cmpb,= %r19,%r20,.L2978
>         ldi 33,%r19
>         cmpb,=,n %r19,%r20,.L2978
>         ldd 1632(%r6),%r26
>         ldo -16(%r30),%r29
>         b,l _gsc_readb,%r2		<< enters stub with wrong dp
>         ldo 78(%r26),%r26
>         copy %r4,%r27
>         ldd 1632(%r6),%r25
> 
> I hope I'm not supposed to do anything special with that $$divU call,

Unfortunately, I think you are supposed to.  All the $$ routines are from
the millicode library, and are treated specially by the linker.  When
doing a final link, these functions are never supplied by a shared
library, but must come from a static lib like libgcc.a, or
libmilli.a.  This has the effect of never calling these routines via the
.plt, and so dp is preserved.  gcc isn't doing anything wrong here.

If you use a long branch stub that only trashes r1, you should be OK.
_Don't load dp for these routines!  (I hope all libmilli routines are
re-entrant - if not, we'd probably have weird kernel crashes...)

Note that all of the above applies to 32-bit modutils too.

cc:d to the mailing list in case any of the above needs correcting.

Alan
-- 
Linuxcare.  Support for the Revolution.
