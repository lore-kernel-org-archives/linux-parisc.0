Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56451482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 18:00:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vpUu-0001tl-00; Sat, 05 May 2001 01:00:32 +0100
Date: Sat, 5 May 2001 01:00:32 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010505010032.N32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk> <200105042151.RAA19009@hiauly1.hia.nrc.ca> <20010504235711.M32445@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010504235711.M32445@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Fri, May 04, 2001 at 11:57:11PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 04, 2001 at 11:57:11PM +0100, Matthew Wilcox wrote:
> 
> taking a somewhat different approach:
> 
>     ea44:       e8 42 11 d4     b,l 14334 <_setjmp>,rp
> 
> 00014334 <_setjmp>:
>    14334:       6b c2 3f d9     stw rp,-14(sr0,sp)
>    14338:       34 19 00 00     ldi 0,r25
>    1433c:       37 de 00 80     ldo 40(sp),sp
>    14340:       6b d3 3f c1     stw r19,-20(sr0,sp)
>    14344:       e8 41 00 d8     b,l 163b8 <__sigsetjmp>,rp
>    14348:       6b d3 3f 91     stw r19,-38(sr0,sp)
>    1434c:       4b d3 3f 91     ldw -38(sr0,sp),r19
>    14350:       4b c2 3f 59     ldw -54(sr0,sp),rp
>    14354:       e8 40 c0 00     bv r0(rp)
>    14358:       37 de 3f 81     ldo -40(sp),sp

> oh.  wait.  1434F is exactly where it should be.  *sigh*.  So why the hell
> is it returning to the wrong place?

OK, got it.  the first time we call _setjmp, everything is fine.
But when we return to it through longjmp, the `rp' which got stored has
changed, and now its the rp for the last function we called.  Which is
what happens using `step' through gdb (now that i have a working gdb,
thanks for the deb, matt).

Ugh.  I guess we can't use _setjmp then, at least in its current form.
Oh well, at least the problem's found.

-- 
Revolutions do not require corporate support.
