Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from patty.levels.unisa.edu.au (patty.levels.unisa.edu.au [130.220.36.156])
	by dsl2.external.hp.com (Postfix) with ESMTP id 432CF482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 May 2001 06:41:47 -0600 (MDT)
Date: Sat, 5 May 2001 22:11:43 +0930 (CST)
From: Alan Modra <alan@SPRI.Levels.UniSA.Edu.Au>
To: Jeffrey A Law <law@redhat.com>
Cc: <gcc-bugs@gcc.gnu.org>, <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.30.0105052051010.7143-100000@mullet.itr.unisa.edu.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] pa __builtin_return_addr
List-ID: <linux-parisc.vger.kernel.org>

Hi Jeff,
  I stumbled on this one a couple of hours ago, and haven't figured out
a good fix yet.

cat >builtin_ret.c <<EOF
void *foo (void) { return __builtin_return_address (0); }
EOF
gcc -O -S -mno-space-regs builtin_ret.c

gives (trimming somewhat)
foo:
        bv %r0(%r2)
        ldw -20(%r30),%r28	# Oops, we never stored r2 at -20(%r30)

The fix I have in mind is to add some communication between
builtins.c:expand_builtin_return_addr and pa.c:hppa_expand_prologue.
eg. add a field to struct machine_function, and set it in
pa.c:return_addr_rtx to indicate that r2 must be saved.


A similar problem occurs with
cat >builtin_frame.c <<EOF
void *foo (void) { return __builtin_frame_address (1); }
EOF
gcc -O -S builtin_frame.c

foo:
        bv %r0(%r2)
        ldw 0(%r30),%r28	# Oops, we haven't saved a frame pointer.

We ought to be able to make __builtin_frame_address (n) work reliably for
n = 0 and n = 1 by something similar to the fix I'm proposing for the
return address problem.  ie. set a "frame_pointer_needed" flag in
struct machine_function.

-- 
Alan Modra
