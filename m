Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63A814848
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Aug 2003 09:30:34 -0600 (MDT)
Date: Sun, 31 Aug 2003 11:29:00 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: randolph@tausq.org, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
Message-ID: <20030831152900.GI5194@systemhalted>
References: <200308292203.SAA03224@hiauly3.hia.nrc.ca> <200308292244.SAA29829@hiauly3.hia.nrc.ca> <20030830161504.GE5194@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030830161504.GE5194@systemhalted>
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

> 
> Aflicted: sys_fork_wrapper, sys_clone_wrapper, sys_vfork_wrapper
> 
> I'm tempted to remove the store and load of call-clobbered registers
> from our syscall path, push them into the glibc wrappers, and see what 
> happens :)

What happens when your stack changes on the route back from the
syscall?

	stw r19, -32(sp)
	/* clone */
	ldw -32(sp), r19

Obviously I could add a "if parent then ldw -32(sp),r19", but the child,
not having the same stack would be hard pressed if r19 changed during
the syscall. Although, I think I see that in glibc the child's function
is called via $$dyncall and I assume that might fixup r19 for the child.

Do any other syscalls change the stack on return? I can only really
think of all the fork-ish type syscalls doing that sort of stuff.

c.
