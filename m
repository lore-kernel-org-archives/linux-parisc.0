From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Fw: Another problem with making things static
Date: Sun, 11 Feb 2007 00:25:52 -0700
Message-ID: <20070211072552.GC22248__32083.6295643405$1416624282$gmane$org@colo.lackof.org>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
	<20070210201911.7a16b5f3.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Andrew Morton <akpm@linux-foundation.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070210201911.7a16b5f3.akpm@linux-foundation.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 10, 2007 at 08:19:11PM -0800, Andrew Morton wrote:
> On Sat, 10 Feb 2007 19:47:16 -0600 James Bottomley <James.Bottomley@SteelEye.com> wrote:
> 
> > The life of a non-x86 architecture maintainer is hard ... it involves
> > having lots of volunteers tirelessly chasing down things that broke
> > during the big two week merge frenzy.
> 
> They should test -mm kernels and report any problems so those problems
> don't get into mainline.

We probably could start doing that for some of the build flavors (32 bit).
Kyle/Willy have done a great job of reducing the diff between kernel.org
and parisc-linux.org trees.


> My attempt to build a working parisc cross-compiler failed, which doesn't help.

I appreciate your attempt to build parisc-linux.
Could you post which source tree and which build command line you used?

I'm pretty sure this can be fixed.
We've used cross compilers in the past so I know it's worked before.

thanks,
grant

> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
