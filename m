Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03468
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 09:17:50 -0700
Message-Id: <199911231619.LAA03531@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Tue, 23 Nov 1999 11:19:17 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991123124718.D1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 23, 99 12:47:18 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > My timing tests on a 735 indicate that the loop with two addib instructions
> > is only 25% faster than a loop with one addib and one nop.
> 
> Who cares about how fast the loop is, actually ?

You get better control of the number of delay instructions executed.  This
is the definition of __delay() that I like:

/* 
 * __delay(N) executes N+2 or N+3 instructions without any pipeline stalls
 * depending on whether it is aligned on an eight byte boundary or not.
 */

extern __inline__ void __delay(unsigned long loops) {
	asm volatile(
	"	.balignl	8,0x34000034
		addib,UV        -1,%0,.
		addi,NUV        -1,%0,%0"
		: "=r" (loops) : "0" (loops));
}

Increase your BogoMIPS!

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
