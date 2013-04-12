From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Fri, 12 Apr 2013 12:14:47 -0700
Message-ID: <1365794087.1934.50.camel@dabdike>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
	 <201304112338.56618.vapier@gentoo.org> <1365741912.6982.8.camel@dabdike>
	 <201304121445.08948.vapier@gentoo.org>
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
In-Reply-To: <201304121445.08948.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-04-12 at 14:45 -0400, Mike Frysinger wrote:
> On Friday 12 April 2013 00:45:12 James Bottomley wrote:
> > On Thu, 2013-04-11 at 23:38 -0400, Mike Frysinger wrote:
> > > what do you think of this section for vdso(7) ?  i might have to split
> > > the "real" vdso arches from these others since there's a couple now
> > > (arm, bfin, parisc), and i think there might be more down the line
> > > (microblaze).
> > 
> > I've got to say, I really don't think this can be classified as a vdso.
> > For a vdso, the kernel exports an ELF object that can be linked
> > dynamically into any elf binary requiring it.  The ELF section
> > information provides full details and so vdso entries can be called by
> > symbol.
> 
> strictly speaking, sure, a vDSO is only a vDSO if it's an ELF (since the 
> acronym is literally "virtual dynamic shared object").  however, i see the 
> vdso as being a bit more of a flexible concept -- it's a place of shared code 
> that the kernel manages and exports for all userspace processes.  
> fundamentally, the point of the vDSO is to provide services to greatly speed 
> up userspace.  in that regard, these mapped pages are exactly like vDSOs.

I don't entirely understand this classification.  If the kernel<->user
gateway becomes classified as a vdso, that covers our syscall interface
on every archtecture.  There's now no distinction between a vdso (which
may not even move to kernel mode) and a syscall.

I think the difference is that a syscall is a specific call to a known
kernel routine by number and it involves a transition to kernel mode.  A
vdso is an exported link object containing certain functions which may
or may not cause a trap to kernel mode when executed.  The distinction
is how you do the call.  For syscalls, you have to know the number and
the arguments.  For vdso you just have to know the symbol (and
obviously, the prototype for C code) and the kernel supplies the
implementation direct to the userspace binary.

> thus i think it's appropriate to document these "fixed code" regions that many 
> arches export (ARM, Blackfin, Itanium, Microblaze, PA-RISC) in the same man 
> page as the vdso.  especially since (currently) arches do one or the other, 
> but not both.

I really see these as a type of lightweight syscall.  You use the
syscall prototype (call by number with known arguments) but the call may
not necessarily transition to kernel mode proper to handle the function.

> > In the parisc gateway page implementation, we have a set of "hidden"
> > primitives which the executable must know how to call (no self
> > description like a vdso).  This mechanism is identical to the original
> > intent of the x86 int <n> instruction (an instruction that traps into
> > the kernel and performs some primitive action but to use it, you have to
> > know which function corresponds to which value of <n>).
> 
> would it be useful to document all of them ?  or just the ones that userspace 
> actively uses (like syscall/cas) ?  or should all of this be recorded in the 
> kernel's Documentation/parisc/ subdir and just have the man page refer people 
> there (like it does for ARM & Blackfin currently) ?

I'm not sure.  For x86 they're in include/asm/traps.h.  I think the only
ones we really use are int3 for breakpoint, int4 for overflow and int80
for legacy syscall.

James



