Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29DAF4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 23:57:46 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 18wGTg-0004UU-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 01:58:08 -0500
Date: Fri, 21 Mar 2003 01:58:08 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030321065808.GC7182@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Implementing cancellable syscalls for PA in glibc 2.3.2
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

PA,

I _know_ in all my PA travels I've seen assembly to do these bits, but
currently my sleepy brain says "write the list, and collate tomorrow."

N.B. It must be assembly, it's GAS, and this will live in glibc, if you
really want to know I'm writing the cancellable syscall support so we
can have a building 2.3.2 :)

---
Task A: Get single thread pointer.

	mfctl cr27, r4;
	* Then I need to load r4->p_header.multiple_threads somehow?*
	* I don't really know if I can just load the struct offset  *
	* without worrying that GCC's padded things...              *

	* Also need to check if this value is non-zero, subtract 1? *

Task B: Save space on the stack.

	stwm r4, STACKSPACE(sp);

Task C: Restore space from stack.

	ldwm -STACKSPACE(sp), r4;

Task D: Push an arg onto the stack.

	stw r2[6543], OFFSET(sp);
	* Remembering that it's 4 bytes per store *

Task E: Get an arg from the stack.

	ldw -OFFSET(sp), r2[6543];
---

Comments and help is welcome :)

c.
