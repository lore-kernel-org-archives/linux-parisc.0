From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] coherent ops and mb() revisited
Date: Mon, 6 Sep 2004 05:24:44 -0400 (EDT)
Message-ID: <200409060924.i869OimP003155@hiauly1.hia.nrc.ca>
References: <20040906041952.GA17107@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@SteelEye.com,
 parisc-linux@parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040906041952.GA17107@colo.lackof.org> from "Grant Grundler" at
	Sep 6, 2004 00:19:52 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Actaully, I don't think it's irrelevant.  If a lock is contended for,
> re-ordering by gcc could excerbate the problem by adding additional
> instructions (good for the instruction pipeline) to the "critical
> section" (the period we actually hold the lock).
> 
> I know, lock contention is bad and it should never happen.
> Reality is some workload will contend for a lock. I want to
> have some confidence gcc is not making it any worse.
> This is why I'm asking about use of "memory" in the actual
> asm instruction that either acquire or release the lock
> instead of using mb().

I don't have any particular insight here beyond what's in the manual:

If your assembler instructions access memory in an unpredictable
fashion, add @samp{memory} to the list of clobbered registers.  This
will cause GCC to not keep memory values cached in registers across the
assembler instruction and not optimize stores or loads to that memory.
You will also want to add the @code{volatile} keyword if the memory
affected is not listed in the inputs or outputs of the @code{asm}, as
the @samp{memory} clobber does not count as a side-effect of the
@code{asm}.  If you know how large the accessed memory is, you can add
it as input or output but if this is not known, you should add
@samp{memory}.  As an example, if you access ten bytes of a string, you
can use a memory input like:

@example
@{"m"( (@{ struct @{ char x[10]; @} *p = (void *)ptr ; *p; @}) )@}.
@end example

Note that in the following example the memory input is necessary,
otherwise GCC might optimize the store to @code{x} away:
@example
int foo ()
@{
  int x = 42;
  int *y = &x;
  int result;
  asm ("magic stuff accessing an 'int' pointed to by '%1'"
       "=&d" (r) : "a" (y), "m" (*y));
  return result;     
@}
@end example

@noindent
If you write an @code{asm} instruction with no outputs, GCC will know
the instruction has side-effects and will not delete the instruction or
move it outside of loops.

The @code{volatile} keyword indicates that the instruction has
important side-effects.  GCC will not delete a volatile @code{asm} if
it is reachable.  (The instruction can still be deleted if GCC can
prove that control-flow will never reach the location of the
instruction.)  In addition, GCC will not reschedule instructions
across a volatile @code{asm} instruction.  For example:

@smallexample
*(volatile int *)addr = foo;
asm volatile ("eieio" : : );
@end smallexample

@noindent
Assume @code{addr} contains the address of a memory mapped device
register.  The PowerPC @code{eieio} instruction (Enforce In-order
Execution of I/O) tells the CPU to make sure that the store to that
device register happens before it issues any other I/O@.

Note that even a volatile @code{asm} instruction can be moved in ways
that appear insignificant to the compiler, such as across jump
instructions.  You can't expect a sequence of volatile @code{asm}
instructions to remain perfectly consecutive.  If you want consecutive
output, use a single @code{asm}.  Also, GCC will perform some
optimizations across a volatile @code{asm} instruction; GCC does not
``forget everything'' when it encounters a volatile @code{asm}
instruction the way some other compilers do.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
