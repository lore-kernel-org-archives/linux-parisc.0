Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 147244A19
	for <parisc-linux@parisc-linux.org>; Mon, 19 Mar 2001 21:43:49 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14fDzo-0007Ct-00
	for parisc-linux@parisc-linux.org; Tue, 20 Mar 2001 04:43:48 +0000
Date: Tue, 20 Mar 2001 04:43:48 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010320044348.K7479@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Efficient Pthread Implementation
List-ID: <linux-parisc.vger.kernel.org>

Pthreads needs a way to find the address of the thread control structure
for the task which is currently running.  If we use fixed instead of
floating stacks, and don't tell it to use a different stack (unsure
what circumstances will cause this to happen, or the advantages of
configuring pthreads to use floating stacks), then everything is fine,
we can simply take the stack pointer, mask it with the stack size and
get the answer we were looking for.

If we use a different stack, then it scans the various stacks looking
to see which stack contains this stack pointer, unless the architecture
specifies a better way to find it.  x86 uses one of the segment registers,
ia64 uses a register specified in the ABI.  I propose we could use %cr27.
It's readable from userspace, and we could have a 2-insn stub on the
gateway page which sets %cr27 as necessary.  We then have to switch its
value across context switch, which doesn't seem like a big deal to me.

Comments?  Better ideas?

-- 
Revolutions do not require corporate support.
