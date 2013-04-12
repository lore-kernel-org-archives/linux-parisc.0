From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Thu, 11 Apr 2013 21:45:12 -0700
Message-ID: <1365741912.6982.8.camel@dabdike>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
	 <201304112155.46349.vapier@gentoo.org>
	 <BLU0-SMTP62F4273B01E0328ADCD7BE97C10@phx.gbl>
	 <201304112338.56618.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: John David Anglin <dave.anglin@bell.net>,
	Kyle McMartin <kyle@mcmartin.ca>,
	"Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
	linux-man <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201304112338.56618.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2013-04-11 at 23:38 -0400, Mike Frysinger wrote:
> On Thursday 11 April 2013 22:34:43 John David Anglin wrote:
> > On 11-Apr-13, at 9:55 PM, Mike Frysinger wrote:
> > > On Sunday 07 April 2013 14:48:42 John David Anglin wrote:
> > >> On 7-Apr-13, at 2:39 PM, Mike Frysinger wrote:
> > >>> just to be clear, the only insn you need is:
> > >>>   ble 0x100(%sr2, %r0);
> > >>> 
> > >>> the kernel docs say sr2 holds the kernel gateway page (so i guess
> > >>> 0x100 is a
> > >>> known offset into that).  the docs don't mention r0 that i can see,
> > >>> so i'm
> > >>> guessing it's one of those "always 0" registers ?
> > >> 
> > >> Yes.  There is also an entry at offset 0xb0 for light-weight-
> > >> syscalls.  Currently,
> > >> this implements an atomic CAS operation used for pthread support.
> > > 
> > > interesting.  sounds like a poor man's vDSO.  i'll document this the
> > > new
> > > vdso(7) man page.
> > 
> > Not exactly, the code runs on the gateway page which is in kernel space.
> > The main reason for doing the operation in kernel space is to prevent
> > processes from being preempted while executing in the lock region.  In
> > general,
> > parisc processes are not preempted on the gateway page.  There are
> > some subtleties regarding fault handling.
> 
> sure ... the Blackfin arch does a similar thing for providing fast atomic 
> primitives to userspace since the ISA can't.
> 
> what do you think of this section for vdso(7) ?  i might have to split the 
> "real" vdso arches from these others since there's a couple now (arm, bfin, 
> parisc), and i think there might be more down the line (microblaze).

I've got to say, I really don't think this can be classified as a vdso.
For a vdso, the kernel exports an ELF object that can be linked
dynamically into any elf binary requiring it.  The ELF section
information provides full details and so vdso entries can be called by
symbol.

In the parisc gateway page implementation, we have a set of "hidden"
primitives which the executable must know how to call (no self
description like a vdso).  This mechanism is identical to the original
intent of the x86 int <n> instruction (an instruction that traps into
the kernel and performs some primitive action but to use it, you have to
know which function corresponds to which value of <n>).

James


> .SS parisc (hppa) functions
> .\" See linux/arch/parisc/kernel/syscall.S
> .\" See linux/Documentation/parisc/registers
> The parisc port has a code page full of utility functions.
> Rather than use the normal ELF aux vector approach, it passes the address of
> the page to the process via the SR2 register.
> This is done to match the way HP-UX works.
> 
> Since it's just a raw page of code, there is no ELF information for doing
> symbol lookups or versioning.
> Simply call into the appropriate offset via the branch instruction, e.g.:
> .br
> ble <offset>(%sr2, %r0)
> .if t \{\
> .ft CW
> \}
> .TS
> l l.
> offset  function
> _
> 00b0    lws_entry
> 00e0    set_thread_pointer
> 0100    linux_gateway_entry (syscall)
> 0268    syscall_nosys
> 0274    tracesys
> 0324    tracesys_next
> 0368    tracesys_exit
> 03a0    tracesys_sigexit
> 03b8    lws_start
> 03dc    lws_exit_nosys
> 03e0    lws_exit
> 03e4    lws_compare_and_swap64
> 03e8    lws_compare_and_swap
> 0404    cas_wouldblock
> 0410    cas_action
> .TE
> .if t \{\
> .in
> .ft P
> \}
> 
> > There is support in glibc and libgcc for these calls.  The libgcc
> > implementation
> > in linux-atomic.c is very similar to that on arm.
> 
> interesting.  another arch to add :).
> -mike


