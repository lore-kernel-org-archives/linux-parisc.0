From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: 11 Jun 2004 10:02:29 -0400
Message-ID: <1086962549.1949.23.camel@mulgrave>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
	<1086470366.1999.36.camel@mulgrave>
	<20040611055819.GA32005@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040611055819.GA32005@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Changing "4 + cnf.cc_shift" (stride=128) to "3 + cnf.cc_shift"
> (stride=64) didn't help. This implies the stride is not the problem.

The stride in the rest of the PA architecture is either 16 or 32; I'd be
surprised if the L1 stide in the 8800 were bigger (smaller stride is
actually more efficient since it gives finer control over caching).

Could you just hard code it to 32 to make assureances certain that the
stride value isn't the source of the segv's?

Thanks,

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
