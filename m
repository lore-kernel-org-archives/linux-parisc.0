From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] syscall restart block.
Date: Sun, 12 Sep 2004 14:45:54 -0400
Message-ID: <20040912184553.GT1854@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


jda,

Oh, I realized today we still have a hole in the way we handle
restartable syscalls. Normally the restarter function is placed in a
function descriptor, a stack trampoline is laid down, the user process
is allowed to return, execute the stack trampoline with the modified
syscall number (indicating restart), upon entry to the kernel the
restart function is executed with arugments. 

The problem is that we should in general disable restartable syscalls as
we walk the userspace return trampoline. If the user took a signal
during the trampoline walk, the signal handler could execute a
restartable syscall, and if that syscall was interrupted, the restorer
function would be changed (there is only one entry for a restorer, they
aren't chained). This means that you technically call the wrong syscall
when you unwind from the signal that you took on the stack trampoline.

If we move stack trampolines to the gateway pagethen signals can't be
delivered to the returning process during the trampoline walk (signals
are not allowed to be delivered for processes on the gateway page). So
it fixes our hole too.

It also allows us to interpret PT_GNU_STACK properly, since the kernel
no longer needs to execute a trampoline on the users stack. The
toolchain can now correctly mark the stack as non-exec.

I only just realized we still had this hole and it might manifest itself
under heavy signal load.

Randolph, comments?
Does this analysis sound correct?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
