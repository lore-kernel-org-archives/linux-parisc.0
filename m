From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Tue, 16 Aug 2005 21:43:51 -0600
Message-ID: <4302B277.40706@excelcia.org>
References: <200508170132.j7H1W4Sq027309@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200508170132.j7H1W4Sq027309@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:
>>>>When that produced even worse results, I tried -march=2.0 vs 1.1 and
>>>>-mschedule=8000 vs 7300 seperately.  Each one alone slows down the
>>>>benchmark and the effect is addititive.  It seems that in Linux, right
>>>>now at least, compiling with -march=2.0 or -mschedule=8000 is a Bad Thing.
>>>>
> 
> 
> In theory, -mschedule=8000 should only be used on machines with PA 2.0
> processors (i.e., not the B132L).

I must not have been clear.  Wanting to have as level a playing field as
possible for benchmarking, I fist used identical binaries for both the
PA 1.1 and PA 2.0 machines.  These binaries were build as
-march=1.1/-mschedule=7300.  When I first noticed that the B132L was
outperforming the C160, I then recompiled the C160 binaries as
-march=2.0/-mschedule=8000.  My thinking was that perhaps the 1.1/7300
binaries on the C160 were perhaps causing the poor results.  The
recompiled 2.0/8000 binaries had even /poorer/ results, on the order of
a consistent two percent reduction in performance over 1.1/7300.

> ...It is tweaked to the number of execution
> units, etc, in the PA 2.0 processor.  How much difference this makes in the
> real world is not clear.  I haven't seen any numbers.  As far as the
> models themselves, they haven't changed since they were added by Jeff
> Law somewhere around GCC 3.0.  It would be interesting to see how they
> compare on the same cpu, same os, etc.

In Linux 2.6.10-pa11 and 2.6.8.1-pa11 with a 32 bit kernel on a C160
(PA-8000 cpu)
 * -march=1.1 produces code that performs approximately one percent
faster than -march=2.0
 * -mschedule=7300 produces code that is approx. one percent faster than
-mschedule=8000
 * The two above are additive - 1.1/7300 is two percent faster than 2.0/8000
 * Code compiled as 1.1/7300 and also run on a C160 with its kernel
configured with the PA7300LC processor type (as opposed to configured as
PA8000) enjoys another ~2% speed boost that is additive.

So, to be completely clear, where the baseline is a C160, Linux
2.6.8.1-pa11 configured for PA8000 cpu and where the user binary is
compiled with -march=2.0 and -mschedule=8000:
- User binary compiled with -march=1.1 = +1% performance
- User binary compiled with -mschedule=8000 = +1% performance
- Kernel configured as PA7300LC = +2% performance

> As far PA 2.0 versus 1.1, the main differences affecting 32-bit code
> are some new branch instructions.  There are also some new FP instructions
> but these are somewhat compromised by linker bugs.  In non floating-point
> code, I would expect the PA 2.0 features to make their presence felt
> in code with large functions.

Is there anything in PA 2.0 that you would expect to cause poorer
performance in any circumstance when compared to PA 1.1?

> There have been a lot of optimization improvements in GCC since 3.3.
> It would be useful to see how effective they are in real applications
> and in benchmark performance.  As far as the PA backend goes, there
> haven't been any major performance improvements added since 3.3.  The
> changes mainly are bug fixes.

So, what I'm hearing is that I might expect to see better code across
the board with a post 3.3 compiler, but that there is unlikely to be a
change in what I am seeing with 1.1 vs 2.0, 7300 vs 8000?

> 64-bit code isn't going to make your apps run faster.  There is more
> overhead in data accesses in 64-bit code (i.e., they go through the DLT)
> than in 32-bit apps.  Also, a lot more sign extensions are needed.  In
> terms of a GCC build, the difference is about 15-20%.  The 64-bit tools
> are less mature.  So generally, you only want to use 64-bit apps when
> they can benefit from the larger address space.

I'm not strong on the PA architecture - I assumed on a 64 bit machine
that the data bus would be 64 bits wide.  Thus, I would have thought
that 64-bit compiled apps on such a machine would run at least as fast
as 32 bit ones, and be superior in some areas such as when they had to
deal with 64 bit values like file offsets.  If less bit-width is better,
shouldn't we all be going back to 6502? :)

In any case, if what I'm seeing isn't due to 32 vs 64 bit, then I am
completely baffled by what I'm seeing.  Why would a C160 running at a
20% faster clock speed, having eight times the cache, and a design that
should be superior in every sense run slower than B132L?  I'm not trying
to blame my machine's poor performance on anyone, but I must admit that
having read as much as I can on the C160 vs B132L that I can find no
explanation in the hardware.

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
