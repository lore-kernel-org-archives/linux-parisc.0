Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA03402
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 02:39:33 -0700
Date: Mon, 22 Nov 1999 09:24:12 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991122092412.C1310@mathe.stud.uni-erlangen.de>
References: <199911212307.SAA11686@hiauly1.hia.nrc.ca> <199911220112.UAA05614@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911220112.UAA05614@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> __delay() in delay.h is ok except for ".balignl".  The .balignl inserts
> a bunch of "ldi 1a,%r0" instructions which do nothing.  I just didn't specify
> enough cycles before.

Yup.  They are intended to do nothing to get the following code nicely aligned.
Actually I wonder now whether the best way to implement __delay(x) is:

	mfctl	16, %0		; current interval timer value
	addl	%0, %1, %1	; interval timer value we want to reach

	subl	%1, %0, %0	; want-is
	comb,>	%0,  0, .-4	; while((want-is)>0)
	mfctl	16, %0		; current interval timer value
	
I actually like this quite a lot;

 - should be shorter than the old loop (5 instructions instead of 3
   instructions plus alignment)
 - should work well for low values (mfctl is quite fast and the rest
   is just arithmetic operations - and we don't have any nops in there)
 - more exact than other __delays (interrupts, cache effects,
   alignment, and, at least in theory, power-saving modes can make
   other __delays inexact)
 - more exact wrt our timer source (as CR16 actually _is_ our timer
   source).  This might be a bad thing as it means we don't have a sanity
   check for our timer anymore.

>  extern __inline__ void __delay(unsigned long loops) {
>  	asm volatile(
> -	"	.balignl	64,0x34000034
> -		addib,UV,n      -1,%0,.
> +	"	addib,UV,n      -1,%0,.
>  		addib,NUV,n     -1,%0,.+8
>  		nop"
>  		: "=r" (loops) : "0" (loops));

Just to scare you a bit, have a look at the PCXL ERS, Section 6.4 "Instruction
Lookaside Buffer".  This is basically a one-entry TLB that gets set from the
real TLB and takes some time to do so.

Now picture the page boundary happes between the two addibs.  This loop will
execute at about a third of the speed of a normal delay loop.  The code is
inlined, so only one loop gives you bogus results - if it is the BogoMIPS
calibration loop, udelay(N) will actually only delay for N/3 us, which can
have unexpected effects on hardware we use udelay() for.

	Philipp Rumpf
