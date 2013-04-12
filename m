From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Fri, 12 Apr 2013 13:25:28 -0700
Message-ID: <1365798328.1934.66.camel@dabdike>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
	 <201304121445.08948.vapier@gentoo.org> <1365794087.1934.50.camel@dabdike>
	 <201304121546.54478.vapier@gentoo.org>
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
In-Reply-To: <201304121546.54478.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2013-04-12 at 15:46 -0400, Mike Frysinger wrote:
> On Friday 12 April 2013 15:14:47 James Bottomley wrote:
> > On Fri, 2013-04-12 at 14:45 -0400, Mike Frysinger wrote:
> > > On Friday 12 April 2013 00:45:12 James Bottomley wrote:
> > > > On Thu, 2013-04-11 at 23:38 -0400, Mike Frysinger wrote:
> > > > > what do you think of this section for vdso(7) ?  i might have to
> > > > > split the "real" vdso arches from these others since there's a
> > > > > couple now (arm, bfin, parisc), and i think there might be more down
> > > > > the line (microblaze).
> > > > 
> > > > I've got to say, I really don't think this can be classified as a vdso.
> > > > For a vdso, the kernel exports an ELF object that can be linked
> > > > dynamically into any elf binary requiring it.  The ELF section
> > > > information provides full details and so vdso entries can be called by
> > > > symbol.
> > > 
> > > strictly speaking, sure, a vDSO is only a vDSO if it's an ELF (since the
> > > acronym is literally "virtual dynamic shared object").  however, i see
> > > the vdso as being a bit more of a flexible concept -- it's a place of
> > > shared code that the kernel manages and exports for all userspace
> > > processes. fundamentally, the point of the vDSO is to provide services
> > > to greatly speed up userspace.  in that regard, these mapped pages are
> > > exactly like vDSOs.
> > 
> > I don't entirely understand this classification.  If the kernel<->user
> > gateway becomes classified as a vdso, that covers our syscall interface
> > on every archtecture.  There's now no distinction between a vdso (which
> > may not even move to kernel mode) and a syscall.
> > 
> > I think the difference is that a syscall is a specific call to a known
> > kernel routine by number and it involves a transition to kernel mode.  A
> > vdso is an exported link object containing certain functions which may
> > or may not cause a trap to kernel mode when executed.  The distinction
> > is how you do the call.  For syscalls, you have to know the number and
> > the arguments.  For vdso you just have to know the symbol (and
> > obviously, the prototype for C code) and the kernel supplies the
> > implementation direct to the userspace binary.
> 
> i'm not fully versed in the parisc linux gateway page or how the architecture 
> is handling things, so i could be completely off here.  from reading the source 
> code, it *looked* like it was just a page of utility funcs that userspace 
> branches to without changing privilege modes or going through the full syscall 
> routines.

Oh, if that's the misunderstanding, then the gateway page is "special".
It actually has PAGE_GATEWAY bits set (this is linux terminology; in
parisc terminology it's Execute, promote to PL0)in the page map.  So
anything executing on this page executes with kernel level privilege
(there's more to it than that: to have this happen, you also have to use
a branch with a ,gate completer to activate the privilege promotion).
The upshot is that everything that runs on the gateway page runs at
kernel privilege but with the current user process address space
(although you have access to kernel space via %sr2).  For the 0x100
syscall entry, we redo the space registers to point to the kernel
address space (preserving the user address space in %sr3), move to wide
mode if required, save the user registers and branch into the kernel
syscall entry point.  For all the other functions, we execute at kernel
privilege but don't flip address spaces.  The basic upshot of this is
that these code snippets are executed atomically (because the kernel
can't be pre-empted) and they may perform architecturally forbidden (to
PL3) operations (like setting control registers).

James



