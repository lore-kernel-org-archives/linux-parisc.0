Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 131D14829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Apr 2003 11:49:00 -0700 (MST)
Message-Id: <200304041848.h34Imwkv026421@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Applications in 64 bits userspace
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Fri, 4 Apr 2003 13:48:57 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030404180841.GP7542@systemhalted> from "Carlos O'Donell" at Apr 4, 2003 01:08:41 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I get random email from people who've seen my libc-alpha postings, and
> they want to know how to fix their busted gcc (hppa2.0w) + HPUX linker
> compiles... looks like floating point loads and stores with bad 
> relocations (the reason we disable fpregs in the rtld code for glibc).

This sounds like a configuration mixup but I would have to see
a real bug report to be sure.  Regarding disabling fpregs, this
might not be a good idea.  Integer multiplication uses the xmpyu
instruction.  There is millicode support for 32-bit multiplication
but not for 64-bit multiplication.  On the 64-bit port, loop
unrolling can cause a multiply instruction to emitted after
virtual registers are instantiated.  If fpregs are disabled,
the multiply requires a libcall.  Emitting a libcall, requires
setting the arg pointer using the virtual outgoing args register.
There is a small chance that we might not have reserved enough
space for the outgoing arguments when this is done after virtual
register instantiation.  You need -nostdlib when linking as
various functions in libgcc uses the xmpyu instruction.

> How so? -static and -nostdlib and add all the bits yourself?

No.  The dynamic loader is still required to resolve some special
symbols.  I also think the file format is not quite right for
a static executable.  I'm sure that it would be possible to generate
a truly static binary but I'm not sure how much work is involved.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
