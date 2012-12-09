From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [parisc] ptrace breakage
Date: Sun, 9 Dec 2012 16:44:08 +0000
Message-ID: <20121209164407.GF4939@ZenIV.linux.org.uk>
References: <20121209061614.GE4939@ZenIV.linux.org.uk>
 <1355048391.10297.3.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1355048391.10297.3.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 09, 2012 at 10:19:51AM +0000, James Bottomley wrote:

> > 	2) if you have let the tracee run with PTRACE_SYSCALL and
> > it had stopped, you can use PTRACE_POKEUSR to modify syscall number
> > (r20) and arguments 1--4 (r26--r23).  Modifications will have effect.
> > However, modifying arguments 5 and 6 (r22 and r21 resp.) works only
> > when process (32bit one) runs on 64bit host - on 32bit one it has no
> > effect.  AFAICS, the diff below should fix that one.
> > 
> > 	Comments?
> > 
> > diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> > index 86742df..5e05524 100644
> > --- a/arch/parisc/kernel/syscall.S
> > +++ b/arch/parisc/kernel/syscall.S
> > @@ -309,10 +309,13 @@ tracesys_next:
> >  	LDREG   TASK_PT_GR25(%r1), %r25
> >  	LDREG   TASK_PT_GR24(%r1), %r24
> >  	LDREG   TASK_PT_GR23(%r1), %r23
> > -#ifdef CONFIG_64BIT
> >  	LDREG   TASK_PT_GR22(%r1), %r22
> >  	LDREG   TASK_PT_GR21(%r1), %r21
> > +#ifdef CONFIG_64BIT
> >  	ldo	-16(%r30),%r29			/* Reference param save area */
> > +#else
> > +	stw     %r22, -52(%r30)                 /* 5th argument */
> > +	stw     %r21, -56(%r30)                 /* 6th argument */
> >  #endif
> 
> I'll defer to the glibc guys on this.  The code before you modified it
> is correct according to the ABI, but it does look like gate calls are
> done with 8 args in registers on 32 bit in which case the above would be
> correct.

Er...  What happens on PTRACE_SYSCALL path is that we reload the registers
clobbered by do_syscall_trace_enter().  Sure, on 32bit we'd already pushed
the arguments 5 and 6 on stack (originally from r22/r21), so they are not
clobbered.  However, this reload has a side effect - if whoever's tracing us
does PTRACE_POKEUSER to modify pt_regs, we end up with changed value reloaded.
What this patch does is making this behaviour consistent between 32bit and
64bit hosts.

BTW, note that if we e.g. end up restarting the syscall, the changes to r22
and r21 *will* have effect on the second pass on 32bit.  With the current
kernel.  The registers will be restored from pt_regs on the way out.
