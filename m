Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA32537
	for <parisc-linux@puffin.external.hp.com>; Sun, 1 Aug 1999 22:12:57 -0600
To: Philipp Rumpf <prumpf@suse.de>
cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 02 Aug 1999 05:32:39 +0200.
             <19990802053239.N13236@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 01 Aug 1999 22:12:27 -0600
Message-ID: <31287.933567147@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <19990802053239.N13236@suse.de>you write:
  > > For those interested; Linux syscalls now take the syscall number in r20,
  > > take arguments in r26-r21, zero r1, r19-r26, r29 and r31 on exit, preserv
  > e
  > > r3-r18, r27(dp) and r30(sp), clobber r2 and return the result in r28.
  > 
  > sounds rather strange but as long as gcc takes it as inline assembly ...
  > 
  > > ObRant: Why on earth define a register to be caller-saves but not allow i
  > t
  > > to contain an argument?  Why force it onto the stack?
  > 
  > An ABI that would specify too many argument registers would force the 
caller
  > to load them before the call and the callee to save them again because both
  > would need the additional argument registers.
At function entry the compiler copies all parameters passed in registers into
pseudo-registers.

Those pseudo registers are then subject to normal register allocation.  ie,
the compiler can allocate it into a call saved register, into a stack slot
(and bring it into a register where needed) or into a call clobbered register
and save/restore it around calls based on which of the options minimizes
cost.

In fact, if you examine the PA64 ABI, it uses %r19-%r26 for parameters,
%r28 for the structure value return address and %r29 for the outgoing arg
pointer, %r2 for the return address, %r1 is a scratch for long calls.  That
leaves just %r31 as the only call-clobbered register which is not uses for
passing parameters or not clobbered on the call path itself.

There's no benefit to not using those call clobbered registers for parameter
passing other than to save a little stack space (you have a register flush to
fixed areas in the frame inside varargs/stdarg functions).

jeff
