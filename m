From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sat, 22 Jul 2006 18:49:18 -0500
Message-ID: <200607221849.18925.mszick@morethan.org>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<119aab440607221029h1acda159mf4c4e5baca2f0c1e@mail.gmail.com>
	<44C2A23C.8000509@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44C2A23C.8000509@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat July 22 2006 17:10, Joel Soete wrote:
> 
> Carlos O'Donell wrote:
> >>         Q4: imho the most important: with 2 gcc where is the couple of 
> >> ssm/rsm that jejb introduced in his patch:
> > 
> > 
> > The *most* important piece of imformation is the pre-compiled source.
>     if (flags & 0x00000001) {
>      __asm__ __volatile__("ssm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
>      __asm__ __volatile__("":::"memory");
>      __asm__ __volatile__("rsm %0,%%r0\n" : : "i" (0x00000001) : "memory" );
>     } else
>      __asm__ __volatile__("":::"memory");
> 
> > You *must* determine that both paths of the if/else are different,
> > because if they are the same, then GCC is right to remove one of the
> > paths, and unconditionally call cpu_relax.
> > 

Note: That code is the same when either compiler is used;
_But_ as a separate problem...

My reading of the intent of that added code was:

Busy_Loop:
   If (Interrupts are disabled) {
      Enable interrupts;
      Cpu_relax; /* Long enough to recognize pending interrupts */
      Disable interrupts;
   } else {
      Cpu_relax;
   }

And my complaint was a matter of structure...

The assumption here is that the flag bit in an external variable
is always in-sync with the interrupt status bit in the register.

Obviously a false assumption, this routine is an example...

Inside the first if block, the status bit is changed but the external
variable bit is not.

A general purpose, like we don't know what state the interrupts
are in, and we don't want to trust an external flag bit;

Looks like:

Busy_Loop:
   Save current interrupt status to the external variable;
   Enable interrupts; /* a nop if already enabled */
   Cpu_relax; /* Long enough to recognize pending interrupts */
   Restore interrupt status from external variable;

Our redefining Cpu_relax to a pair of nops was for machines that
delay recognizing interrupts for an instruction after changing
the status bit.  We also included an asm comment in Cpu_relax
just in case we wanted to see that it had not gotten optimized away.

Same reason the mb() was redefined as an asm comment that could
be identified by inspection.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
