Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C0004830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Sep 2003 15:02:37 -0600 (MDT)
Date: Fri, 12 Sep 2003 17:00:51 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>,
	Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030912210051.GL4732@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Signal handlers in glibc 2.3.2
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

tausq, jejb,

Another tall order, and I'm calling for help on this one. The recently
fixed glibc seems to be having issues with restarting after being
interrupted.

Latest glibc 2.3.2 patches are here:
http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz
Broken test is distilled here:
http://www.baldric.uwo.ca/~carlos/tst-timer.tar.gz

The test does very very little. We setup a timer to call a signal
handler after a 2 second expiry, then we proceed to call nanosleep with
a 3 second expiry.

./run.sh ./tst-timer
Before nanosleep(...) call
Signal handler
./run.sh: line 3:  5500 Segmentation fault

You see that we enter nanosleep, enter the kernel, sleep, event timer
expires and raises signal, signal handler runs.

At this point the following is supposed to happen:
Branch back to stack and make another syscall into the kernel
(trampoline we put there to make it back to rt_sigreturn, see signal.c).
...
At this point I'm a bit confused by the semantics, would one of you care
to help me understand what happens from there back to userspace. I know
we eventually have to get back to where nanosleep was called (since it
was interrupted and now needs to be restarted).
...
So we enter the syscall code in syscall.S execute syscall 173 which
jumps to 'sys_rt_sigreturn' in signal.c. From here we unwind the stack
to get an rt_sigframe structure (which I assume was written into the
stack before calling the signal handler). Take the current signal set
from there and recalc pending signals. Then there is a bit of magic to
restore the current stack pointer, which seems to me is where the
problem lies since frame->uc.uc_mcontext on a 64-bit box probably won't
be right because we copied it wrong. There are a few other things that
might be wrong too, but this is a start. I'm enabling signal debugging
and building a new kernel. I assume that the sigsegv is caused by the
kernel trying to __copy_from_user something invalid.

Any thoughts or comments would be more than appreciated.

Cheers,
Carlos.
