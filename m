From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Sat, 5 Jun 2004 15:05:15 -0600
Message-ID: <20040605210515.GA8098@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1086444652.1999.20.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 05, 2004 at 09:10:51AM -0500, James Bottomley wrote:
> Your explanation is possible, but it's highly unlikely to be an existing
> problem.  PA currently uses the big hammer approach to cache coherency
> and flushes everything on virtually every large mmu changing operation. 
> If there's a caching problem in between the flushes it should have shown
> up on much smaller cache machines as well.
> 
> Also, when doing the no flushing updates to improve fork/exec, I removed
> the global flushing so now any cache mismanagement would become
> cumulative and should definitely have been seen.

Well, I can only point at the difference in cache size.

> My money would be on an additional architectural requirement of the
> PA8800 (maybe even an existing PA one that the <PA8800 just don't need)
> that we don't respect.

yes - and we've changed chipsets too.

Any good ideas on how to prove IO is coherent?

It might be the same problem that Naresh described as "SCSI DMA problems".
I just happen to be using NFS Root instead.

But I found one bug in Naresh's port that might explain his problem
(wasn't flushing IO TLB properly). It would be interesting to hear
if 2.6.7-rc2-pa3 works better for him.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
