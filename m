From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: 05 Jun 2004 09:10:51 -0500
Message-ID: <1086444652.1999.20.camel@mulgrave>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040605065126.GA28343@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2004-06-05 at 01:51, Grant Grundler wrote:
> To me, it all suggest the PA8800 32M L2 cache isn't being
> flushed when it might need to be. I don't think it's a new
> problem. Just an old one that's easier to reproduce with
> the bigger cache.

Your explanation is possible, but it's highly unlikely to be an existing
problem.  PA currently uses the big hammer approach to cache coherency
and flushes everything on virtually every large mmu changing operation. 
If there's a caching problem in between the flushes it should have shown
up on much smaller cache machines as well.

Also, when doing the no flushing updates to improve fork/exec, I removed
the global flushing so now any cache mismanagement would become
cumulative and should definitely have been seen.

My money would be on an additional architectural requirement of the
PA8800 (maybe even an existing PA one that the <PA8800 just don't need)
that we don't respect.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
