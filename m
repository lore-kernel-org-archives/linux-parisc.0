Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA25620
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 11:09:58 -0700
Message-Id: <199911221811.NAA27290@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Mon, 22 Nov 1999 13:11:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991122083023.B1310@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 22, 99 08:30:23 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I tried this and it didn't work.  It looks like __delay() is broken.  The
> > ".balignl" is clearly bogus.
> 
> Oh.  Why ?  The way it is intended is to align the following code to a 64-byte
> boundary (cache lines on current PA2.0 CPUs are 64 bytes, I think) using nops.

Missed this point because of the strange nop.  The current addib loop is 3
instructions.  Alignment to a multiple of 16 should be good enough to
ensure that the loop lies within a cache line.  This would insert a maximum
of 3 nops before the loop.  This would provide a slightly more deterministic
result.

Also, re the BogoMIPS number, I think this should be (loops_per_sec*3)/2000000
(i.e., there is one addib and 0.5 nop instructions per loop when the
number of iterations is large.  The number that is currently printed is
loops_per_sec*2/1000000.

The simple loop "addib,NUV,n .;nop" is slower but more deterministic.  It
only needs an alignment of 8 (at most one nop).  The number of instructions
per loop is 2*N-1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
