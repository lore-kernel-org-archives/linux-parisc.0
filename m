Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA00712
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 06:54:17 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id 27BDD2A6
	for <parisc-linux@puffin.external.hp.com>; Mon,  4 Dec 2000 06:56:52 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id GAA16592 for parisc-linux@puffin.external.hp.com; Mon, 4 Dec 2000 06:55:36 -0700 (MST)
Date: Mon, 4 Dec 2000 06:55:36 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012041355.GAA16592@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: pci changes
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Alan wants to put some of our independnt parts in too.  I'm just sorting
> out the stack direction and location issues in the way Linus wants
> it done.

Well, here are some of the issues I would like to see addressed:

1) When I last checked, the stack growth fix only fixed one of the locations
   that cared about stack direction. There were others that were not fixed.
   Are you going to fix them?

2) The current fix duplicated machine independent code (expand_stack
   and find_vma), modified them, and placed them into the machine
   dependent code. The problem with that is that whenever changes are
   made to expand_stack and/or find_vma, we have to notice that and
   port the fixes, since whoever makes the changes is not likely to
   notice our special versions. I was hoping that we could get some
   support for stacks that grow up in the machine independent code
   so that they are visible.

3) I hope that we will have some control of the stack location in the
   machine dependent code. I would like to be able to place the stack
   near the top of memory, and have the location based on the stack
   size limit (rlim[RLIMIT_STACK].rlim_max).

4) The top of memory for user space is currently 0xc0000000, but I hope
   to change that to 0xffffe000 in the next month or two.

5) To make it clear "why" the code is different, I was hoping that
   any #ifdef's in the machine independent code for stack grows up
   changes would be something like #ifdef STACK_GROWS_UP, rather than
   #ifdef parisc. Then STACK_GROWS_UP would be set for parisc. This
   way, when people are making changes to the code, they will understand
   what the different code is for, rather than wondering why parisc
   has that code change. Also, it would help all those other future
   architectures with stacks that grow up when they port Linux :-).

I would appreciate it if you would keep us informed regarding discussions
between you and Linus regarding this issue.

John Marvin
jsm@fc.hp.com
