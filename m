From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux]      Heads up,
Date: Fri, 18 Jun 2004 21:35:57 -0400 (EDT)
Message-ID: <200406190135.i5J1Zwww001680@hiauly1.hia.nrc.ca>
References: <20040619011714.GC23535@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040619011714.GC23535@colo.lackof.org> from "Grant Grundler" at
	Jun 18, 2004 07:17:14 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Jun 18, 2004 at 05:25:05PM -0400, Kyle McMartin wrote:
> > gcc-3.4-hppa (or gcc-3.3-hppa)
> 
> Should I be testing 64-bit kernels built with this toolchain
> or stick with my trusty gcc 3.0.4-hppa64 handmade debs?

>>From my perspective, the 3.4 branch is the best yet.  By this, I
mean it has the fewest bugs in the PA backend.  However, there are
lots of other changes that may bite ...

Randolph's PR (the one that started this thread) isn't fixed and
hasn't been seriously researched (too many other issues).  However,
it's obviously a serious issue for the kernel.  So, maybe you should
use 3.0.4 for kernel builds until it's resolved.  For other uses, I
suggest 3.3.4 (released?) or the soon to be released 3.4.1.  3.5 is
for Joel to test ;-)

If anyone out there wants to learn more than they really wanted
to know about GCC and binutils internals, let me know as there
are a number of projects that need working on.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
