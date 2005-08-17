From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Wed, 17 Aug 2005 10:16:43 -0400 (EDT)
Message-ID: <200508171416.j7HEGh9B029860@hiauly1.hia.nrc.ca>
References: <4302B277.40706@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: kfitzner@excelcia.org (Kurt Fitzner)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4302B277.40706@excelcia.org> from "Kurt Fitzner" at Aug 16,
	2005 09:43:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > ...It is tweaked to the number of execution
> > units, etc, in the PA 2.0 processor.  How much difference this makes in the
> > real world is not clear.  I haven't seen any numbers.  As far as the
> > models themselves, they haven't changed since they were added by Jeff
> > Law somewhere around GCC 3.0.  It would be interesting to see how they
> > compare on the same cpu, same os, etc.
> 
> In Linux 2.6.10-pa11 and 2.6.8.1-pa11 with a 32 bit kernel on a C160
> (PA-8000 cpu)
>  * -march=1.1 produces code that performs approximately one percent
> faster than -march=2.0
>  * -mschedule=7300 produces code that is approx. one percent faster than
> -mschedule=8000
>  * The two above are additive - 1.1/7300 is two percent faster than 2.0/8000
>  * Code compiled as 1.1/7300 and also run on a C160 with its kernel
> configured with the PA7300LC processor type (as opposed to configured as
> PA8000) enjoys another ~2% speed boost that is additive.
> 
> So, to be completely clear, where the baseline is a C160, Linux
> 2.6.8.1-pa11 configured for PA8000 cpu and where the user binary is
> compiled with -march=2.0 and -mschedule=8000:
> - User binary compiled with -march=1.1 = +1% performance
> - User binary compiled with -mschedule=8000 = +1% performance
> - Kernel configured as PA7300LC = +2% performance
> 
> > As far PA 2.0 versus 1.1, the main differences affecting 32-bit code
> > are some new branch instructions.  There are also some new FP instructions
> > but these are somewhat compromised by linker bugs.  In non floating-point
> > code, I would expect the PA 2.0 features to make their presence felt
> > in code with large functions.
> 
> Is there anything in PA 2.0 that you would expect to cause poorer
> performance in any circumstance when compared to PA 1.1?

The only thing that comes to mind is that some PA 2.0 floating-point
instructions require assist from the kernel.  It might be beneficial
to avoid these exceptions.

The numbers suggest that there may be issues with PA 8000 scheduling
and PA 2.0 code generation, but I think more testing is needed.  It
would very useful if the actual problem could be identified.

> > There have been a lot of optimization improvements in GCC since 3.3.
> > It would be useful to see how effective they are in real applications
> > and in benchmark performance.  As far as the PA backend goes, there
> > haven't been any major performance improvements added since 3.3.  The
> > changes mainly are bug fixes.
> 
> So, what I'm hearing is that I might expect to see better code across
> the board with a post 3.3 compiler, but that there is unlikely to be a
> change in what I am seeing with 1.1 vs 2.0, 7300 vs 8000?

That's the current situation.  There's certainly improvements
that could be made to the PA backend in GCC.  Some issues are:

1) Long offsets in PA 2.0 floating-point loads and stores.  This is
   a 32-bit linker bug.

2) The PA has many integer conditions that aren't exploited.  If these
   could be exploited, we might save an insn in some loops.  This might
   yield a significant performance increase in some loops.

3) We need to look at improving the load sequence for self data when
   generating PIC code.  Currently, I believe that we always load data 
   through the DLT.  This requires three instructions, with two being
   memory accesses.  For self data, this can be shortened to two insns
   and one memory access.  When self data can be accessed using a 16-bit
   offset, data can be accessed in one memory access.  So, it might be
   useful to have a code generation option for tiny data.

4) There have been reports that utilizing the left/right addressibility
   of the floating-point registers in 32-bit code causes unnecessary
   processor stalls.

> > 64-bit code isn't going to make your apps run faster.  There is more
> > overhead in data accesses in 64-bit code (i.e., they go through the DLT)
> > than in 32-bit apps.  Also, a lot more sign extensions are needed.  In
> > terms of a GCC build, the difference is about 15-20%.  The 64-bit tools
> > are less mature.  So generally, you only want to use 64-bit apps when
> > they can benefit from the larger address space.
> 
> I'm not strong on the PA architecture - I assumed on a 64 bit machine
> that the data bus would be 64 bits wide.  Thus, I would have thought
> that 64-bit compiled apps on such a machine would run at least as fast
> as 32 bit ones, and be superior in some areas such as when they had to
> deal with 64 bit values like file offsets.  If less bit-width is better,
> shouldn't we all be going back to 6502? :)

That's true.  However, there's only a benefit when an application uses
a lot of 64-bit data, and/or benefits from the 64-bit address space.
Integer applications still typically use a lot of 32-bit signed integers
for saving space and portability.  When the PA does an 32-bit load in
wide mode, the value is zero extended.  However, in many cases the value
needs to be sign extended.  Thus, in many cases you pay a penalty when
64-bit registers are needed.

> In any case, if what I'm seeing isn't due to 32 vs 64 bit, then I am
> completely baffled by what I'm seeing.  Why would a C160 running at a
> 20% faster clock speed, having eight times the cache, and a design that
> should be superior in every sense run slower than B132L?  I'm not trying
> to blame my machine's poor performance on anyone, but I must admit that
> having read as much as I can on the C160 vs B132L that I can find no
> explanation in the hardware.

I really don't know.  You should be able to run PA 1.1 code for the
B132L on the C160.  If the same code runs slower on the C160, I would
first suspect that it's due to a difference in configuration (disks,
graphics, etc).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
