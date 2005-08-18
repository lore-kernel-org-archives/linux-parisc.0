From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Wed, 17 Aug 2005 23:27:24 -0600
Message-ID: <43041C3C.2080704@excelcia.org>
References: <4301B090.9040405@excelcia.org>
	<20050817061913.GA8761@colo.lackof.org> <430384FE.6080105@excelcia.org>
	<20050817194058.GA3378@netfall.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050817194058.GA3378@netfall.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Andrew Sharp wrote:
> So stop ignoring that difference.  Cache thrashing is
> a real, and sad, international problem.  Take those benchmarks that
> produce slower results on a P4/2MB cache processor than they do on a
> P4/512KB processor.  Same motherboard, OS, benchmark.  Only difference,
> 4x bigger cache.  If the processor is spending more time loading cache
> lines, it's spending less time computating.  Cache systems are designed to
> improve the performance of general computing tasks, and many benchmarks
> fall outside that realm.

Andrew Sharp wrote:

Ok, I bit the bullet.  I took an image of the hard drive to restore
later, and installed HPUX.  I then obtained gcc 3.4.3 from the HPUX
software porting archive and recompiled the benchmark with that.  Raw
data is at the end.

Next off, for nbench running on a C160/HPUX I see a memory throughput
increase of 2.67X, integer calc increase of 1.4X, and floating point
increase of 2.24X when compared to the C160/Linux.

The data show exactly the sort of performance increase that I originally
expected to see when comparing a B132L and C160.  Strongly improved
integer and vastly improved memory performance.

The performance issue on my C160/Linux was not due cache line
loading/thrashing.  It's not due to slower memory, nor due to some odd
conflaguration of C160 architecture changes and an old benchmark
program.  I am convinced that there is some problem in Linux - probably
some otherwise minor thing.  Whatever it is, it's sucking performance
from PA8000 systems - and perhaps other PA8x00 ones.

What really locked it in for me that it's an OS issue, aside from the
dramatic results below, is what happened when I changed optimization
switches in HPUX.  I see the exact same 2% drop in performance when I go
from binaries compiled as 1.1/7300 to 2.0/8000 that I saw in Linux.
Same compiler on both OSes producing code that reacts exactly the same
way when optimizations are changed.

I'm convinced - how can I convince the group?  I'm quite willing to give
ssh access to my machines for the results to be verified.  I should be
able to swap between HPUX/Linux fairly quickly now that I have images of
both.

	Kurt.

p.s.  I installed HPUX in 64-bit mode.  Which, so I'm told, should have
decreased my performance.  I'd like to get my C160 running Linux in
64-bit mode, but I can't. :(


------------------------------------------------------------------
TEST                : Iterations/sec.  : Old Index   : New Index
                    :                  : Pentium 90* : AMD K6/233*
--------------------:------------------:-------------:------------
NUMERIC SORT        :           99.68  :       2.56  :       0.84
STRING SORT         :          14.104  :       6.30  :       0.98
BITFIELD            :      2.1599e+07  :       3.70  :       0.77
FP EMULATION        :          8.8339  :       4.24  :       0.98
FOURIER             :          2660.2  :       3.03  :       1.70
ASSIGNMENT          :          1.8832  :       7.17  :       1.86
IDEA                :          116.73  :       1.79  :       0.53
HUFFMAN             :           121.4  :       3.37  :       1.08
NEURAL NET          :            2.81  :       4.51  :       1.90
LU DECOMPOSITION    :           116.6  :       6.04  :       4.36
==================================================================
OS                  : HP-UX B.11.11
C compiler          : gcc version 3.4.3
MEMORY INDEX        : 1.120
INTEGER INDEX       : 0.827
FLOATING-POINT INDEX: 2.414
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
