From: Andrew Morton <akpm@linux-foundation.org>
Subject: [parisc-linux] Re: Fw: Another problem with making things static
Date: Sat, 10 Feb 2007 20:19:11 -0800
Message-ID: <20070210201911.7a16b5f3.akpm__3207.10690361938$1416624281$gmane$org@linux-foundation.org>
References: <20070210130136.9538498b.akpm@linux-foundation.org>
	<20070210214309.GP12958@stusta.de>
	<1171158436.3373.51.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Parisc List <parisc-linux@lists.parisc-linux.org>,
 Adrian Bunk <bunk@stusta.de>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171158436.3373.51.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 10 Feb 2007 19:47:16 -0600 James Bottomley <James.Bottomley@SteelEye.com> wrote:

> The life of a non-x86 architecture maintainer is hard ... it involves
> having lots of volunteers tirelessly chasing down things that broke
> during the big two week merge frenzy.

They should test -mm kernels and report any problems so those problems
don't get into mainline.

My attempt to build a working parisc cross-compiler failed, which doesn't help.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
