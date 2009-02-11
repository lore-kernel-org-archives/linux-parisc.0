From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Tue, 10 Feb 2009 21:43:08 -0500 (EST)
Message-ID: <20090211024309.D97334FA9@hiauly1.hia.nrc.ca>
References: <4991E9E3.2040404@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4991E9E3.2040404@gmx.de> from "Helge Deller" at Feb 10, 2009 09:56:03 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> John David Anglin wrote:
> >> It will currently only work with 64bit kernels, because the gcc options -pg
> >> and -ffunction-sections can't be enabled at the same time and -ffunction-sections
> >> is still needed to be able to link 32bit kernels.
> > 
> > I have done some testing.  As far as I can tell, -pg works with
> > -ffunction-sections on hppa-unknown-linux-gnu and hppa64-hp-hpux11.
> 
> That's great!
> Which gcc version did you tested?

4.4.0.

> For me, (cross-compiler) hppa-linux-gcc 3.3.4 didn't linked without -ffunction-sections.

There's been quite a few change since 3.3.4.  In principle, -ffunction-sections
shouldn't be needed to compile and link the kernel although it may produce
better code.  Long calls should be generated automatically if a pc-relative
branch can't reach the stub table.  As I said, ld -r is not supposed to merge
.text sections.

If I remember correctly from some previous discussions, 3.3.4 is too
old.  There was a bug in the handling of weak functions affecting kernel
builds.

Currently, the only supported GCC branches are 4.3 and 4.4.  The 4.2
branch will be closed soon and no further releases will be done with
this branch.  4.4 will be forked when the number of P1 bugs reaches
zero.  From my standpoint, it would be best to test with 4.3 or 4.4.
I think the major linux vendors are using 4.3 for their current
releases.

> Did you tested modules (on 32bit) as well, e.g. the xfs module which had the
> relocation problems?

No, I just did a build and check of gcc, and tested a testsuite program
to see that it ran correctly with -pg and -ffunctions-sections (i.e., I
ran gprof using the gmon.out).  I also visually inspected the generated
assembly code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
