From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Non-executable stack?
Date: Sun, 12 Sep 2004 14:37:48 -0400
Message-ID: <20040912183748.GR1854@baldric.uwo.ca>
References: <20040912143555.GN1854@baldric.uwo.ca>
	<20040912161009.GQ28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>,
 James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912161009.GQ28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

> Do you mean on the architecture? Yes, you can. afaik, hpux has a 
> non-executable stack.

Yes, on the architecture. Ah, if HPUX has it then it makes it feasible.
 
> > The only thing that currently comes to mind is that we have return paths
> > from the signal handler as stack code. This is very easy to fix, just
> > put the code statically on the gateway page and allow the user to jump
> > through that back into the kernel.
> 
> do you mean in general, or just in the kernel? do you really mean only
> marking the stack non-executable, or also the heap?

I'm worried about the following case:

a. You compile your program with gcc, a new toolchain, and it emits
   a PT_GNU_STACK that says the stack shouldn't have prot exec.

b. We rely on the stack having prot exec for a kernel signal return
   path.

These two things are mutually exclusive :(
 
> We have various bits of trampolines in a number of applications that 
> could potentially live on the stack. libffi comes to mind....  and
> probably other code that needs to call between languages.

I think I've seen the following listed reasons:

1. GCC uses executable stacks for function trampolines for nested
   functions?

2. Linux uses executable user stacks for signal handling.

3. Functional programming languages, and some other programs, rely on
   executable stacks for run-time code generation.

The 2. is the only worry I have, gcc should be emitting PT_GNU_STACK
properly for the rest.

> why do you want to do this?  because of the direction our stack grows,
> stack overflow protection is not as useful on pa.... not that you cannot
> do stack-smashing attacks on pa, of course...

Well, technically using PT_GNU_STACK we should already support a marked
stack as non-exec if the toolchain generated the requirement. So when
you compile libffi or weird languages gcc will generate the right heaver
value for PT_GNU_STACK and the kernel does the right thing.

Perhaps what I should say clearly is "we need to move our return
trampolines off the stack."

It also fixes the bug we have with the syscall restart block, where if a
restart is issued while we walk the stack trampoline it will clobber the
previous restart. We never fixed this bug.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
