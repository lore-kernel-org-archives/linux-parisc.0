Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA28038
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 13:54:00 -0700
Message-Id: <199911222055.PAA01550@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Mon, 22 Nov 1999 15:55:42 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991122193347.A1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 22, 99 07:33:47 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > Missed this point because of the strange nop.  The current addib loop is 3
> > instructions.
> 
> It is ?
> 
> The way it looks to me is it is two instructions in the main loop.

My timing tests on a 735 indicate that the loop with two addib instructions
is only 25% faster than a loop with one addib and one nop.  You are correct
that there are only two actual instructions in the loop.  However, the timing
measurements indicate that the two addib loop stalls for one instruction
time.  Thus, effectively there is an extra nop in your loop.  As a result,
my comments re the BogoMIPS calculation below are correct for a 735 PA7100.
I think the stall is on the second addib when the forward branch is not taken.

> 
> > Alignment to a multiple of 16 should be good enough to
> > ensure that the loop lies within a cache line.
> 
> I agree.  Still, I like the CR16 based loop so much better.
> 
> > Also, re the BogoMIPS number, I think this should be (loops_per_sec*3)/2000000
> > (i.e., there is one addib and 0.5 nop instructions per loop when the
> > number of iterations is large.
> 
> Again, I disagree.  It is two addibs per loop.
> 
> > The number that is currently printed is
> > loops_per_sec*2/1000000.
> 
> We cannot go around and change it either.  It is in architecture-independent
> code.  (It's right, too.  If you have "branch if > 0" and "subtract one"
> instructions, the number of MIPS is loops_per_sec*2 (2 instructions per
> iteration) / 1000000 (the M part).

[deleted]

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
