From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Wed, 17 Aug 2005 00:37:29 -0600
Message-ID: <20050817063729.GB8761@colo.lackof.org>
References: <200508170132.j7H1W4Sq027309@hiauly1.hia.nrc.ca>
	<4302B277.40706@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4302B277.40706@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 16, 2005 at 09:43:51PM -0600, Kurt Fitzner wrote:
> > As far PA 2.0 versus 1.1, the main differences affecting 32-bit code
> > are some new branch instructions.  There are also some new FP instructions
> > but these are somewhat compromised by linker bugs.  In non floating-point
> > code, I would expect the PA 2.0 features to make their presence felt
> > in code with large functions.
> 
> Is there anything in PA 2.0 that you would expect to cause poorer
> performance in any circumstance when compared to PA 1.1?

No - PA2.0 HW will in general perform better.
I agree it's odd that it doesn't.
And it may not be true for HPUX acc compiler or other gcc versions.

> > 64-bit code isn't going to make your apps run faster.  There is more
> > overhead in data accesses in 64-bit code (i.e., they go through the DLT)
> > than in 32-bit apps.  Also, a lot more sign extensions are needed.  In
> > terms of a GCC build, the difference is about 15-20%.  The 64-bit tools
> > are less mature.  So generally, you only want to use 64-bit apps when
> > they can benefit from the larger address space.
> 
> I'm not strong on the PA architecture - I assumed on a 64 bit machine
> that the data bus would be 64 bits wide.

It's not. Compare "Runway" vs "GSC+" bus on URL below.

> Thus, I would have thought
> that 64-bit compiled apps on such a machine would run at least as fast
> as 32 bit ones, and be superior in some areas such as when they had to
> deal with 64 bit values like file offsets.  If less bit-width is better,
> shouldn't we all be going back to 6502? :)

No. What Dave didn't mention (but implied) was that data structures
get bigger (64 bit vs 32-bit for the same field) and thus require
more cachelines for the same data structure. Note that the CPU loads
*cachelines* from memory and not individual pointers or fields.
And thus must potentially load *more* cachelines when running 64-bit
mode than when running 32-bit (narrow) mode apps.

> In any case, if what I'm seeing isn't due to 32 vs 64 bit, then I am
> completely baffled by what I'm seeing.  Why would a C160 running at a
> 20% faster clock speed, having eight times the cache, and a design that
> should be superior in every sense run slower than B132L?

chipset was designed with different tradeoffs. C160 can take 1.5 or 2GB
of RAM. B132L maxes out at 768MB (and that might not even be supported).

> I'm not trying
> to blame my machine's poor performance on anyone, but I must admit that
> having read as much as I can on the C160 vs B132L that I can find no
> explanation in the hardware.

Try http://www.openpa.net/index.html
(That's the "The OpenPA Project" off the www.parisc-linux.org Nav Bar.)

The chipsets in the two boxes are very different.
It definitely a difference in the system, not just the CPU.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
