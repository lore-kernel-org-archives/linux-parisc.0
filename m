Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62962489A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 18:00:39 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308310000.UAA01375@hiauly3.hia.nrc.ca>
To: carlos@baldric.uwo.ca
Date: Sat, 30 Aug 2003 20:00:36 -0400 (EDT)
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030830161504.GE5194@systemhalted> from Carlos O'Donell at Aug "30," 2003 "12:15:04" pm
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

> On Fri, Aug 29, 2003 at 06:44:03PM -0400, John David Anglin wrote:
> > > > __asm(
> > > > 0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
> > > > 0x40008840:     ldi 2,r20                    !! FORK !!
> > > > );
> > > > 0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368
> > 
> > Looking at the kernel syscall code, it seems at first glance that
> > r19 is saved and restored.  Thus, the problem may be specific to fork.
> 
> The first place I went to was syscall.S and entry.S to see if r19 was
> saved and restored. It is infact saved and restored, _but_ there seems
> to be a case in the sys_fork_wrapper where r19 is written back as a temp
> slot (PT_XX struct).
> 
> linux-2.4/arch/parisc/kernel/entry.S
> 
>    2004         /* These are call-clobbered registers and therefore
>    2005            also syscall-clobbered (we hope). */
>    2006         STREG   %r2,PT_GR19(%r1)        /* save for child */
>    2007         STREG   %r30,PT_GR21(%r1)
> 
> This is done just before the call to 'sys_clone', but it's never used
> anywhere. The comment indicates that the author believed he had all
> right to use caller saves registers, and they should.

I don't fully understand this code but possibly PT_GR20 might be used
to save r2.  In the fork call for example, we know that this location
contains  __NR_fork.  This value gets restored to r20 in wrapper_exit.
I think the valued saved above is loaded into r2 here:

child_return:
	bl      schedule_tail, %r2
	nop

	LDREG   TASK_PT_GR19-TASK_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30),%r2
	b       wrapper_exit
	copy    %r0,%r28

I don't see where the %r30 value saved in PT_GR21 is used.

If a syscall is going to clobber registers, the appropriate clobbers
need to be added to the asm used for the syscall so that gcc doesn't
try to use these registers over the syscall.  Use of PT_GR19 appears
to have been a bad choice because of its special use in pic code.

Dave
