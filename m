Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD125482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 May 2001 10:23:16 -0600 (MDT)
Received: from slagheap.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA24927
	for <parisc-linux@lists.parisc-linux.org>; Sun, 6 May 2001 09:23:15 -0700 (PDT)
To: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
Cc: gcc-bugs@gcc.gnu.org, parisc-linux@lists.parisc-linux.org
Reply-To: law@redhat.com
From: law@redhat.com
In-reply-to: Your message of Sat, 05 May 2001 22:11:43 +0930.
             <Pine.LNX.4.30.0105052051010.7143-100000@mullet.itr.unisa.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 06 May 2001 09:25:38 -0700
Message-ID: <20603.989166338@slagheap.cygnus.com>
Sender: law@cygnus.com
Subject: [parisc-linux] Re: pa __builtin_return_addr
List-ID: <linux-parisc.vger.kernel.org>

  In message <Pine.LNX.4.30.0105052051010.7143-100000@mullet.itr.unisa.edu.au>y
ou write:
  > Hi Jeff,
  >   I stumbled on this one a couple of hours ago, and haven't figured out
  > a good fix yet.
  > 
  > cat >builtin_ret.c <<EOF
  > void *foo (void) { return __builtin_return_address (0); }
  > EOF
  > gcc -O -S -mno-space-regs builtin_ret.c
  > 
  > gives (trimming somewhat)
  > foo:
  >         bv %r0(%r2)
  >         ldw -20(%r30),%r28	# Oops, we never stored r2 at -20(%r30)
  > 
  > The fix I have in mind is to add some communication between
  > builtins.c:expand_builtin_return_addr and pa.c:hppa_expand_prologue.
  > eg. add a field to struct machine_function, and set it in
  > pa.c:return_addr_rtx to indicate that r2 must be saved.
The "right" way to handle this would be to have return_addr_rtx return
%r2 in the case where %r2 isn't ever saved into the stack.  However, I
don't know if we can reliably determine if %r2 is saved into the stack
at the point where we call return_addr_rtx.

If we can't reliably make that determination, then we can just force
%r2 to be saved into the stack if we ever call __builtin_return_address.

  > A similar problem occurs with
  > cat >builtin_frame.c <<EOF
  > void *foo (void) { return __builtin_frame_address (1); }
  > EOF
  > gcc -O -S builtin_frame.c
  > 
  > foo:
  >         bv %r0(%r2)
  >         ldw 0(%r30),%r28	# Oops, we haven't saved a frame pointer.
  > 
  > We ought to be able to make __builtin_frame_address (n) work reliably for
  > n = 0 and n = 1 by something similar to the fix I'm proposing for the
  > return address problem.  ie. set a "frame_pointer_needed" flag in
  > struct machine_function.
I disagree about the solutoin for this one.  I believe it should be 
possible to derive the frame address from the stack pointer fairly
easily since the difference between the stack and frame pointer is
a constant.

jeff
