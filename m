From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 18:18:21 -0400 (EDT)
Message-ID: <20090621221822.1E9414FC5@hiauly1.hia.nrc.ca>
References: <119aab440906211437y60ad647ax6ec4d1d9890fe997@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906211437y60ad647ax6ec4d1d9890fe997@mail.gmail.com> from "Carlos O'Donell" at Jun 21, 2009 05:37:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> There is an on-and-off-again bug in glibc's vfprintf.c implementation
> that causes DBR to miscompile that file, but it comes and goes
> depending on the gcc version. I filed a bug once, but because I
> couldn't produce a reduced testcase Pinski closed it. If I see it
> again I'll try again to produce a reduced testcase.

That one is a reorg bug.  There have been some fixes in that area.  If
you can reproduce with 4.3 or later, I will look at it.  Don't worry
about reproducing a testcase.  Just attached the entire preprocessed
source (compressed if necessary).  You can reopen old bug.

In PR40468, the generated assembler code looked like this:

0x000104e4 <f+56>:      cmpb,<>,n ret0,r19,0x104e8 <f+60>
0x000104e8 <f+60>:      b,l 0x104a8 <ff>,rp
0x000104ec <f+64>:      ldi 1,r26

I don't really understand how the hardware handles the above, but
the b,l didn't correctly update rp, and ff returned to f.  I would
have thought the instruction sequence would go:

f+56, f+60 nullified, f+60, f+64, ff, ..., f+68.

> How's 4.4 on hppa?

Probably as good as any other version (few bugs fixed, a few new
ones).  It has better error checking, but that may be annoying.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
