Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id BAF43489B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 09:40:11 -0600 (MDT)
Date: Sun, 31 Aug 2003 11:38:38 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
Message-ID: <20030831153837.GJ5194@systemhalted>
References: <20030830161504.GE5194@systemhalted> <200308310000.UAA01375@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308310000.UAA01375@hiauly3.hia.nrc.ca>
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

> I don't fully understand this code but possibly PT_GR20 might be used
> to save r2.  In the fork call for example, we know that this location
> contains  __NR_fork.  This value gets restored to r20 in wrapper_exit.
> I think the valued saved above is loaded into r2 here:

So you say perhaps instead of PT_GR19 we use PT_GR20 and
TASK_PT_GR20? I think we can't though, because tracing the syscall
requires that GR20 continue to retain the syscall value. I think we can
use _any_ other caller-saves registers (including the last input for the
fork-ish calls e.g. GR21 or GR22?).
 
> child_return:
> 	bl      schedule_tail, %r2
> 	nop
> 
> 	LDREG   TASK_PT_GR19-TASK_SZ_ALGN-FRAME_SIZE-FRAME_SIZE(%r30),%r2
> 	b       wrapper_exit
> 	copy    %r0,%r28
> 
> I don't see where the %r30 value saved in PT_GR21 is used.

Me neither. Perhaps it's superfluous and can be used to retrieve r2 and
thus keep r19 safe.

> If a syscall is going to clobber registers, the appropriate clobbers
> need to be added to the asm used for the syscall so that gcc doesn't
> try to use these registers over the syscall.  Use of PT_GR19 appears
> to have been a bad choice because of its special use in pic code.

I've added all the caller-saves registers to our clobber lists when
making syscalls. Though, r19 being special, I've had to add "STW_PIC"
and "LDW_PIC" that do the saving and restore _only_ if we are compiled
PIC.

c.
