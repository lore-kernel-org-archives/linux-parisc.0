Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 534CF485E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Aug 2003 16:03:06 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308292203.SAA03224@hiauly3.hia.nrc.ca>
To: carlos@baldric.uwo.ca
Date: Fri, 29 Aug 2003 18:03:00 -0400 (EDT)
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030829200400.GF19341@systemhalted> from Carlos O'Donell at Aug "29," 2003 "04:04:00" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
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

> I'm sending this to the list so it gets recorded on archive. Our problem
> right now it that we don't properly restore r19 after an __asm()
> statement even if the clobber contains r19. Or rather gcc doesn't
> schedule the restore to occur at the right time.

An asm will not cause the restoration of %r19.  The compiler treats
r19 as a fixed register when generating pic code.  The saving and
restoring of the pic register across calls is something that the pa
port does itself in the backend.  Clobbering r19 won't cause it
to be restored.

In the case of syscalls, the compiler has no way of telling that
you are making a "call".

> What does this mean for glibc, well it means that ld.so's first fork
> corrupts the PIC register r19 aka LTP, and the subsequent import stub
> for a function call fails (SIGSEGV). What is effected in glibc?
> The following:
> 	- INTERNAL_SYSCALL (Macro syscall)
> 	- INLINE_SYSCALL (Macro syscall)
> 	- syscall(...) (C version)
> 	- DO_CALL (Assembly wrapper syscall)
> Explicitly storing and loading r19 around the syscall e.g. inside the
> __asm() statement works around the problem. I do not want to have to
> stw/ldw since it costs a lot in performance, we know now to look at gcc
> for help. Perhaps I will use this as a temporary measure to release
> glibc 2.3.2 for debian so we keep testing moving.
> 
> This problem has a number of interesting heisenbugs:
> 	- If the kernel decides not to scratch in r19 then you're okay.
> 	- If the compiler version scheduled r19 restore differently then
>           you're okay.

> 0x40008838:     copy r4,r19  <---Restore----- r19 = 0x40020718

This is a restore after a call.

> __asm(
> 0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
> 0x40008840:     ldi 2,r20                    !! FORK !!
> );
> 0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368

There is no save and restore around the syscall as GCC doesn't know
the asm does a call.  Clobbering r19 isn't an option in PIC code.
Thus, either the syscall has to save and restore r19, or the kernel
has to avoid clobbering r19.

> Preprocessed source for ptfork.c at:
> http://www.baldric.uwo.ca/~carlos/ptfork.E
> You'll see the INLINE_SYSCALL in __pthread_fork on line 8137.
> 
> I would like to not that I might have made _many_ errors, but the simple
> stw/ldw r19 fix passes all the glib thread tests so I think its a step
> in the right direction.

You should be able to use a register.  The problem is how to do this
in a nice way so that you don't have to save and restore r19 in non-pic
code.

Ouch, I am surprised that this hasn't had a bigger effect.

Dave
