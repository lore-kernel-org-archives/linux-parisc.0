Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 369254880
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 09:36:47 -0600 (MDT)
Date: Sat, 30 Aug 2003 11:35:17 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
Message-ID: <20030830153516.GD5194@systemhalted>
References: <20030829200400.GF19341@systemhalted> <200308292203.SAA03224@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308292203.SAA03224@hiauly3.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Dave,

> An asm will not cause the restoration of %r19.  The compiler treats
> r19 as a fixed register when generating pic code.  The saving and
> restoring of the pic register across calls is something that the pa
> port does itself in the backend.  Clobbering r19 won't cause it
> to be restored.

I thought that listing it in the clobber would be the solution.

> In the case of syscalls, the compiler has no way of telling that
> you are making a "call".

Yes, glibc has begun using inlined macros rather than incuring the
penalty of a function call to get at the syscall. I _could_ cheat and
make the inlined code call a 'C' function which would force a restore,
but we then have _many_ more insn on the fast path (rather than just a
stw and ldw).
 
> > 0x40008838:     copy r4,r19  <---Restore----- r19 = 0x40020718
> 
> This is a restore after a call.

Correct. This is a delayed restore from a previous call.
 
> > __asm(
> > 0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
> > 0x40008840:     ldi 2,r20                    !! FORK !!
> > );
> > 0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368
> 
> There is no save and restore around the syscall as GCC doesn't know
> the asm does a call.  Clobbering r19 isn't an option in PIC code.
> Thus, either the syscall has to save and restore r19, or the kernel
> has to avoid clobbering r19.

I would vote for having the kernel avoid trashing r19, though that means
that the kernel has to do the stw/ldw, and wouldn't it be more
beneficial to do this in userspace and allow the kernel an extra
register to generate code with?
 
> You should be able to use a register.  The problem is how to do this
> in a nice way so that you don't have to save and restore r19 in non-pic
> code.

Glibc tells me if I'm in PIC code by setting -DPIC on the command line.
I'm planning on using "ifdef PIC" to optimize away the save and restore.
The issue really is that most programs are dynamically linked against
libc, and thus all their syscalls have to save and restore r19.
 
> Ouch, I am surprised that this hasn't had a bigger effect.

Me too. I really see this as a "We should have been doing this anyway"
and we aren't going to get away from this.

c.
