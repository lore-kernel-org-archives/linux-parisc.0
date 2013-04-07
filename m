From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 7 Apr 2013 09:55:14 -0400
Message-ID: <20130407135514.GW12938@bombadil.infradead.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010632.41520.vapier@gentoo.org>
 <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
 <201304021917.17659.vapier@gentoo.org>
 <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mike Frysinger <vapier@gentoo.org>,
	linux-man <linux-man@vger.kernel.org>,
	Kyle McMartin <kyle@infradead.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 07, 2013 at 12:00:50PM +0200, Michael Kerrisk (man-pages) wrote:
> [Adding a few people to CC who may be able to help with Mike's doubts
> on PA-RISC; folks, if any of you could have a quick look at the parisc
> piece below, that would be helpful]
> 

The syscall number is in %r20, everything else looks correct. The
returned value is in %r28 and the args are %r26 through %r21.

--Kyle

> Mike,
> 
> On Wed, Apr 3, 2013 at 1:17 AM, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Tuesday 02 April 2013 02:54:39 Michael Kerrisk (man-pages) wrote:
> >> On Mon, Apr 1, 2013 at 12:32 PM, Mike Frysinger wrote:
> >> > On Monday 01 April 2013 05:29:11 Michael Kerrisk (man-pages) wrote:
> >> >> On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger wrote:
> >> >> > on a related topic, would it be useful to document the exact calling
> >> >> > convention for architecture system calls ?  from time to time, i need
> >> >> > to reference this, and i inevitably turn to a variety of sources to
> >> >> > dig up the answer (the kernel itself, or strace, or qemu, or glibc,
> >> >> > or uClibc, or lss, or other random places).  i would find it handy to
> >> >> > have all of these in a single location.
> >> >>
> >> >> Sounds like it would be useful to have that documented. Would you have
> >> >> a chance to write patches for that?
> >> >
> >> > should we do it in syscall(2) ?  or a dedicated man page ?
> >>
> >> It's a little hard to say until I see the shape of what comes. Can you
> >> provide a rough per-syscall example or two of what you expect to
> >> document? (Don't write too concrete a patch yet, until I can get a
> >> handle on what you intend.)
> >
> > this renders nicely i think.  it shows most of the stuff i'm interested in.
> > might be useful to add a dedicated section covering the clobbers in the
> > future.
> 
> Thanks for that. It looks good to me, and I have applied. But it
> renders too wide (wherever possible, I try to ensure that everything
> renders inside 80 columns), so I have split into tables, one with
> "instruction, NR, ret" and another with the arguments (arg1 to arg7).
> 
> Now, just to make 100% sure of your intention, the NR column would be
> better named "syscall #" (or similar), right? (I've made that change.)
> 
> > --- a/man2/syscall.2
> > +++ b/man2/syscall.2
> > @@ -79,6 +79,35 @@ and an error code is stored in
> >  .BR syscall ()
> >  first appeared in
> >  4BSD.
> > +.SS Architecture calling conventions
> > +Every architecture has its own way of invoking & passing arguments to the
> > +kernel.
> > +Note that the instruction listed below might not be the fastest or best way to
> > +transition to the kernel, so you might have to refer to the VDSO.
> 
> Mike, any chance that I could interest you in writing a vdso(7) man
> page? I've felt the lack of such a page for a while (it need not be
> too long), but am not deep enough into the details to write it easily
> (I am not sure if you are).
> 
> > +Also note that this doesn't cover the entire calling convention -- some
> > +architectures may indiscriminately clobber other registers not listed here.
> > +.if t \{\
> > +.ft CW
> > +\}
> > +.TS
> > +l l l l l l l l l l l.
> > +arch/ABI       insn    NR      ret     arg1    arg2    arg3    arg4    arg5    arg6    arg7
> > +_
> > +arm/OABI       swi NR; -       a1      a1      a2      a3      a4      v1      v2      v3
> > +arm/EABI       swi 0x0;        r7      r1      r1      r2      r3      r4      r5      r6      r7
> > +bfin   excpt 0x0;      P0      R0      R0      R1      R2      R3      R4      R5      -
> > +i386   int $0x80;      eax     eax     ebx     ecx     edx     esi     edi     ebp     -
> > +ia64   break 0x100000; r15     r10/r8  r11     r9      r10     r14     r15     r13     -
> > +.\" not sure about insn or NR
> > +.\" parisc     ble 0x100(%%sr2, %%r0); -       r28     r26     r25     r24     r23     r22     r21     -
> 
> PA-RISC folks, are you able to confirm/correct the above?
> 
> > +sparc/32       t 0x10; g1      o0      o0      o1      o2      o3      o4      o5      -
> > +sparc/64       t 0x6d; g1      o0      o0      o1      o2      o3      o4      o5      -
> > +x86_64 syscall;        rax     rax     rdi     rsi     rdx     r10     r8      r9      -
> > +.TE
> > +.if t \{\
> > +.in
> > +.ft P
> > +\}
> >  .SS Architecture-specific requirements
> >  Each architecture ABI has its own requirements on how
> >  system call arguments are passed to the kernel.
> 
> Cheers,
> 
> Michael
> 
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
> 
