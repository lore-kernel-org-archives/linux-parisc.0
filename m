Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57660483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 12:55:32 -0600 (MDT)
Date: Sun, 21 Sep 2003 14:53:11 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: James.Bottomley@steeleye.com, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030921185311.GG6963@systemhalted>
References: <20030921154501.GF6963@systemhalted> <200309211639.h8LGdesh010888@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309211639.h8LGdesh010888@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Found the r19 problem!
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

> > Example (Assembly trace provided at the end):
> > 
> > getcwd: (Start of function)
> > 	stw r19,-20(sr0,sp)
> > 	...
> > syscall:
> > 	(Syscall with save/load r19 wrapper)
> > 	stw r19,-20(sr0,sp)
> > 	be,l 100(sr2,r0),%sr0,%r31
> > 	ldi 6e,r20
> > 	ldw -20(sr0,sp),r19
> 
> It would be better to use a general register for the save/restore.
> If you are going to use the slot in the frame marker, it probably
> isn't necessary to save r19 before every syscall.  GCC saves r19
> in the slot in the prologue of all pic functions.  However, we don't
> currently copy the value when when the function does a dynamic stack
> allocation.  That's easily fixed.

So use a caller saves register, place it in the clobbers, and let gcc
work around the usage (e.g. r4).
 
> > 	...
> > 	(Many insn later)
> > 	(stub) (dyncall) -> libpthread.so
> > 	-> libc.so
> 
> The above is an indirect call. r19 should be restored after the call
> if it is used after the call.

It is, but only after the asm(...) that lists r19 in the clobber.

> > 	(r19 not restored)
> > 	(Jump to syscall:)
> 
> It is likely that clobbering r19 in the syscall causes the restore
> of r19 to be deleted.  Because of the clobber, GCC believes that
> r19 is dead and the restore insn isn't needed.  I think you should
> be able to see this by looking at the rtl for the routine.  The save
> and restore of r19 in a call are split out after the GCC reload pass.
> 
> I'm still somewhat confused.  Isn't the syscall going to clobber
> r19?  Don't you need to save and restore r19 here, rather than in the
> wrapper?  There seems to be a call (i.e., you die in a linker call
> stub) before you get back to the wrapper to restore r19.

The presence of r19 in an asm(...) clobber seems to confuse GCC into 
deleting an r19 restore after a return from an interlibrary call. We die
in the linker call stub because it uses libpthread's r19, because GCC
deleted the scheduled restore. Why it deleted the restore is unknown to
me. The syscall wrapper makes sure the syscall doesn't trash r19, it
doesn't assure that the incoming r19 isn't already wrong :)

> > o GCC is confused by the r19 asm(...) clobber?
> 
> The management of r19 is very tricky.  It can't be exposed before
> reload as all uses of r19 are not known until that time.

Agreed, tricky to track down too.

c.
