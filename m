From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sun, 4 Jan 2009 11:41:57 -0500 (EST)
Message-ID: <20090104164157.A14AC4EF8@hiauly1.hia.nrc.ca>
References: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be> from "Guy Martin" at Jan 4, 2009 01:08:12 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Could you do the very same test with -fno-delayed-branch ?
> 
> Compiling without that optimization on my system makes the problem go
> away. It is really a problem with that part of the code and delayed
> branching.

That's useful information as it narrows the problem considerably.  The
problem might be in the PA backend delay slot handling for PA 2.0 32-bit
calls, or it might be a reorg problem.  The latter are very tricky.

> This has been tested with different versions of gcc (4.1.2, 4.2.4,
> 4.3.1). Both 4.2 and 4.3 exhibit the issue once you compile with
> -march=2.0 and -fdelayed-branch.
> 
> Also, compiling with -march=2.0 -O0 -fdelayed-branch doesn't produce a
> segv but produces the following error message :
> hope tests # ../src/lzma/lzma -c < in > out 
> ../src/lzma/lzma: SetCoderProperties() error
> 
> There is really a compiler issue here.

We need to find by debugging an example of code that is miscompiled.

> Also, not sure if you noticed but values printed in the gdb backtrace
> are completely wrong. But that is a different issue as binaries
> generated with any compilers shows the same thing.

Yes, it's a major problem for debugging and it has gotten worse with
each new GCC versions.  There have been some discussions on the list
about how to improve debugging information.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
