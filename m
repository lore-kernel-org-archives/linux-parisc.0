Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 679364829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 00:08:30 -0600 (MDT)
Message-Id: <200209220543.g8M5hxl6003856@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] malloc limits
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 22 Sep 2002 01:43:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020921223352.C64324829@dsl2.external.hp.com> from "Grant Grundler" at Sep 21, 2002 04:33:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I'll assume this is happening on the A500 (PA2.0) and wonder if it's
> a signed/unsigned bug. Look closely at how PA2.0 extends register
> values and make sure code is treating addresses and sizes as unsigned.

This is the code that adds the chunk pointer plus size of chunk and
then tries to load the size of the next check:

0x402611d4 <chunk_free+32>:     add,l r25,ret1,r31
0x402611d8 <chunk_free+36>:     ldw 4(sr0,r31),r20

The add is a 64-bit add on a PA2.0 machine, so the result won't be
signed extended.  My understanding is that the upper 32-bits are
truncated when the PSW W bit is zero.  So, it isn't obvious to
me how this can be a signed/unsigned bug unless it is in the
kernel.

> > I haven't been successful debugging the code directly.  I can get the
> > code to seg fault by setting SIG37 to nostop noprint, but the debugger
> > seems to think the fault occurs following the INLINE_SYSCALL in
> > __sigsuspend.  However, the address points to an ldi instruction
> > which can't seg fault, so I don't know what's up.
> 
> Not all instructions trap precisely. FP ops definitely do not and
> I thought a few others didn't either.
> 
> I'm wondering what happens when unaligned access should segfault.
> Does the unaligned code handle check for that?
> I'll take a quick look at that code path.

There is definitely something strange with this program.  It doesn't
seg fault 100% of the time.  This suggests either a timing/lock problem
or something that isn't being properly initialized.  I don't know
how to debug it under gdb because it seems to change the way traps
are handled.  When I set a break, it appears that the code under test
catches the trap instead of gdb.  The system also dumps core.

I've tried setting breaks in chunk_free and __pthread_mutex_lock
where the unaligned faults occur with a condition matching the
unaligned pointer value which i see in /var/log/debug.  However,
I get the following:

Program received signal SIGTRAP, Trace/breakpoint trap.
0x4021e114 in __sigsuspend (set=0x25)
    at ../sysdeps/unix/sysv/linux/sigsuspend.c:45
45        return INLINE_SYSCALL (rt_sigsuspend, 2, CHECK_SIGSET (set), _NSIG / 8);
(gdb) info proc
process 20194
cmdline = '/home/dave/pthread2.x0g'
warning: unable to read link '/proc/20194/cwd'
warning: unable to read link '/proc/20194/exe'

dave     20193 20041  0 21:41 pts/2    00:00:02 gdb pthread2.x0g
dave     20194 20193  0 21:43 pts/2    00:00:00 /home/dave/pthread2.x0g
dave     20199 20194  0 21:46 pts/2    00:00:00 [pthread2.x0g <defunct>]

I tried setting follow-fork-mode to child but it doesn't seem to follow
the child.

I don't think fp exceptions are involved.

I can see in debug that two traps occur associated with each run.  They
are both type 15 (Data TLB Miss Fault) and they seem to both occur at
the same location.

The program pthread2.x0g is in my home directory on gsyprf11.  If you
want to try it, it probably best to set

  LD_LIBRARY_PATH=/home/dave/opt/gnu/lib

It may take several tries to get it to seg fault.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
