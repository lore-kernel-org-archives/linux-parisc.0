Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 229194879
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 18:10:25 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AUFEy-0007PN-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 20:03:40 -0500
Date: Wed, 10 Dec 2003 20:03:40 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031211010340.GH15502@systemhalted>
References: <20031210224026.33A39494275@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031210224026.33A39494275@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 10, 2003 at 03:40:26PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	03/12/10 15:40:25
> 
> Modified files:
> 	include/asm-parisc: compat.h rt_sigframe.h siginfo.h ucontext.h 
> 
> Log message:
> Cleanup for non-native thread signals, and ensure that during 64-bit builds everything works too.

You may have noticed the following:

  8 #define SIGRETURN_TRAMP 4
  9 #define SIGRESTARTBLOCK_TRAMP 5 
 10 #define TRAMP_SIZE (SIGRETURN_TRAMP + SIGRESTARTBLOCK_TRAMP)
 11 
 12 struct rt_sigframe {
 13         /* XXX: Must match trampoline size in arch/parisc/kernel/signal.c 
 14                 Secondary to that it must protect the ERESTART_RESTARTBLOCK
 15                 trampoline we left on the stack (we were bad and didn't 
 16                 change sp so we could run really fast.) */
 17         unsigned int tramp[TRAMP_SIZE];
 18         struct siginfo info;
 19         struct ucontext uc;
 20 };

And wondered "Why do people write XXX: followed by some scary sounding
stuff?" Here is the part where we clarify what this means.

When Randolph wrote the ERESTART_RESTARTBLOCK code he used a stack
trampoline to rewrite the syscall entry into the kernel with a different
syscall number. This stack trampoline is *unprotected* and the stack
pointer is not adjusted.

If one were to take a signal while executing the ERESTART_RESTARTBLOCK
stack trampoline the signal's frame would destroy the trampoline. Instead
we *notch* 5 more words out of the front of the signal frame to protect a
possible ERESTART_RESTARTBLOCK trampoline. The signal code used to do
exactly the same thing before, it had it's own notch for the sigreturn
trampoline on the stack. Thus now we protect both trampolines.

What if you took another ERESTART_RESTARTBLOCK signal while walking the
last ERESTART_RESTARTBLOCK trampoline? Well that scenario isn't allowed
to happen, and according to Linux we have to disable
ERESTART_RESTARTBLOCK until we are back in the kernel handling the
restart. We still haven't fixed this last bit.

c.
