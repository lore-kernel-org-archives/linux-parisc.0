Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA26185
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 11:30:42 -0700
Date: Mon, 22 Nov 1999 19:33:47 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991122193347.A1009@mathe.stud.uni-erlangen.de>
References: <19991122083023.B1310@mathe.stud.uni-erlangen.de> <199911221811.NAA27290@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911221811.NAA27290@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> Missed this point because of the strange nop.  The current addib loop is 3
> instructions.

It is ?

The way it looks to me is it is two instructions in the main loop.

> Alignment to a multiple of 16 should be good enough to
> ensure that the loop lies within a cache line.

I agree.  Still, I like the CR16 based loop so much better.

> Also, re the BogoMIPS number, I think this should be (loops_per_sec*3)/2000000
> (i.e., there is one addib and 0.5 nop instructions per loop when the
> number of iterations is large.

Again, I disagree.  It is two addibs per loop.

> The number that is currently printed is
> loops_per_sec*2/1000000.

We cannot go around and change it either.  It is in architecture-independent
code.  (It's right, too.  If you have "branch if > 0" and "subtract one"
instructions, the number of MIPS is loops_per_sec*2 (2 instructions per
iteration) / 1000000 (the M part).

> The simple loop "addib,NUV,n .;nop" is slower but more deterministic.  It

NUV means no unsigned overflow

-1 + N overflows for N != 0

So, what you really want is "addib,UV -1, %0, .; nop" (or, I think,
"addib,UV,n -1, %0, .") ?

> only needs an alignment of 8 (at most one nop).  The number of instructions
> per loop is 2*N-1.

Pardon me, why the "-1" part ?  For N==1, you execute

addib,UV -1, %0, .	; -1 + 1 overflows
nop			
addib,UV -1, %0, .	; -1 + 0 does not overflow
nop

, so this would imply 2*(N+1) as number of executed instructions.

	Philipp Rumpf
