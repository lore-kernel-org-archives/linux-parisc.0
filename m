From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 11:46:29 -0500 (EST)
Message-ID: <20090227164630.642474EF8@hiauly1.hia.nrc.ca>
References: <119aab440902270756w4cceb56bq4c247d70e3e34786@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: a.beregalov@gmail.com, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440902270756w4cceb56bq4c247d70e3e34786@mail.gmail.com> from "Carlos O'Donell" at Feb 27, 2009 10:56:13 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Feb 27, 2009 at 10:40 AM, Alexander Beregalov
> <a.beregalov@gmail.com> wrote:
> > The same problem: ld segfaults:
> > do_page_fault() pid=15739 command='ld' type=15 address=0x00000c84
> 
> This is likely a bug in the static linker, or a miscompilation of the
> static linker by your toolchain.

If the problem is fully, reproducable, then I agree its likely
a toolchain issue.  However, as indicated multiple times on the list,
we get random segfaults in various programs.  In my experience,
this occurs more frequently with kernels after 2.6.22 but I'm sure
2.6.22 is affected.

I've tried many kernels after 2.6.22 but I haven't found one that
I like.  2.6.28 doesn't crash on PA 8800 (SMP 64-bit), but I get
too many random segfaults doing GCC builds.

The extract/deposit/shift bug that Helge found recently looks 
important as it causes undefined behavior that appears to vary
from processor to processor.  A patch to check for this was recently
applied to GAS.

I was hoping to try Helge's recent changes but I don't think they
are in Kyle's parisc tree.

If the problem is reproducible, try running gdb to get a backtrace
(e.g., gdb -c core /usr/bin/ld).

I am fairly certain the binutils testsuite for ld 2.19.1 is clean.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
