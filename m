Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC4E94889
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 10:16:33 -0600 (MDT)
Date: Sat, 30 Aug 2003 12:15:04 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20030830161504.GE5194@systemhalted>
References: <200308292203.SAA03224@hiauly3.hia.nrc.ca> <200308292244.SAA29829@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308292244.SAA29829@hiauly3.hia.nrc.ca>
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

On Fri, Aug 29, 2003 at 06:44:03PM -0400, John David Anglin wrote:
> > > __asm(
> > > 0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
> > > 0x40008840:     ldi 2,r20                    !! FORK !!
> > > );
> > > 0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368
> 
> Looking at the kernel syscall code, it seems at first glance that
> r19 is saved and restored.  Thus, the problem may be specific to fork.

The first place I went to was syscall.S and entry.S to see if r19 was
saved and restored. It is infact saved and restored, _but_ there seems
to be a case in the sys_fork_wrapper where r19 is written back as a temp
slot (PT_XX struct).

linux-2.4/arch/parisc/kernel/entry.S

   2004         /* These are call-clobbered registers and therefore
   2005            also syscall-clobbered (we hope). */
   2006         STREG   %r2,PT_GR19(%r1)        /* save for child */
   2007         STREG   %r30,PT_GR21(%r1)

This is done just before the call to 'sys_clone', but it's never used
anywhere. The comment indicates that the author believed he had all
right to use caller saves registers, and they should.

Aflicted: sys_fork_wrapper, sys_clone_wrapper, sys_vfork_wrapper

I'm tempted to remove the store and load of call-clobbered registers
from our syscall path, push them into the glibc wrappers, and see what 
happens :)

c.
