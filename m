Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA13108
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 19:29:28 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id 5A0E6602
	for <parisc-linux@puffin.external.hp.com>; Mon,  4 Dec 2000 21:32:03 -0500 (EST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA04167
	for parisc-linux@puffin.external.hp.com; Mon, 4 Dec 2000 18:31:21 -0800 (PST)
Date: Mon, 4 Dec 2000 18:31:21 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200012050231.SAA04167@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] fault.c b0rken
List-ID: <linux-parisc.vger.kernel.org>



fault.c: In function `do_page_fault':
fault.c:137: warning: passing arg 3 of `find_vma_prev' from incompatible pointer type
fault.c:181: incompatible types in assignment
make[2]: *** [fault.o] Error 1
make[2]: Leaving directory `/linux/pa32/linux/arch/parisc/mm'

Neither 32- nor 64-bit builds work.
Willy needed to get some sleep...as do I.
Anyone have time to look at this?

thanks,
grant

Recent changes:
revision 1.23
date: 2000/12/05 01:15:11;  author: willy;  state: Exp;  lines: +1 -1

suddenly realised i got the return code of expand_stack the wrong way round.
time for bed said zebedee.
----------------------------
revision 1.22
date: 2000/12/05 01:06:01;  author: willy;  state: Exp;  lines: +9 -26

use the ia64 find_vma_prev (located in mm/mmap.c -- how they got that
one past linus, i'll never know) instead of pa_find_vma.  should speed
up tasks using malloc debuggers by a factor of 100 or more.
----------------------------
revision 1.21
date: 2000/12/04 16:59:22;  author: willy;  state: Exp;  lines: +1 -23

More stack direction fixes.

Take stack_growsup out of arch/parisc/mm/fault.c and put it into
include/linux/mm.h, conditionalised on ARCH_STACK_GROWSUP.  Move the
check for the vma auto-grows flag into the stack_growsup functions.
Check removed from most callers (some have to check something else
between those two checks).
