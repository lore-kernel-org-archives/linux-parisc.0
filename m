Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA05298
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 11:06:43 -0700
Date: Tue, 23 Nov 1999 19:03:39 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991123190339.H1009@mathe.stud.uni-erlangen.de>
References: <19991123124718.D1009@mathe.stud.uni-erlangen.de> <199911231619.LAA03531@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911231619.LAA03531@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> /* 
>  * __delay(N) executes N+2 or N+3 instructions without any pipeline stalls
>  * depending on whether it is aligned on an eight byte boundary or not.
>  */
> 
> extern __inline__ void __delay(unsigned long loops) {
> 	asm volatile(
> 	"	.balignl	8,0x34000034
> 		addib,UV        -1,%0,.
> 		addi,NUV        -1,%0,%0"
> 		: "=r" (loops) : "0" (loops));
> }

I'd agree this loop is the nicest of the "real" delay loops so far, but I'm
still unconvinced there's any advantage to using a "real" delay loop over a
CR16-based one.

	Philipp Rumpf
