From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [parisc-linux] Re: Fw: Another problem with making things static
Date: Sat, 10 Feb 2007 23:44:24 -0800
Message-ID: <20070210234424.500ed1c9.akpm__5988.99827241457$1416624282$gmane$org@linux-foundation.org>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
	<20070210201911.7a16b5f3.akpm@linux-foundation.org>
	<20070211072552.GC22248@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070211072552.GC22248@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 11 Feb 2007 00:25:52 -0700 Grant Grundler <grundler@parisc-linux.org> wrote:

> > My attempt to build a working parisc cross-compiler failed, which doesn't help.
> 
> I appreciate your attempt to build parisc-linux.
> Could you post which source tree and which build command line you used?

It was maybe a year back - I spent a couple of days wrestling with
crosstool, ended up with _some_ useful crosscompilers (alpha, arm, i386,
ia64, m68k, mips, s390, sparc, sparc64 and x86_64).  parisc was one of the
ones which I gave up on but I do not have a record of what the problem was,
sorry.  It would have been a toolchain problem, not a kernel problem.

The most usual failure mode was simply inability to find any combination of
gcc/binutils/glibc which could be compiled.

> I'm pretty sure this can be fixed.
> We've used cross compilers in the past so I know it's worked before.

I say this a lot, but...  It is in the interests of arch maintainers to
help others to build cross-compilers.  If someone were to prepare a web
page (or even a script) which could be used to generate a kernel
cross-compilation environment for parisc then the parisc maintainers would
see a lot less breakage.

For one, I do allmodconfig on all architectures on all patches I get (and
that includes all the git trees).  If stuff breaks, the breaker gets to
hear about it, before it gets merged.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
