Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA32036
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 11:39:02 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter0.it-datacntr.louisville.edu (Postfix) with ESMTP id BB66424F0C
	for <parisc-linux@thepuffingroup.com>; Tue, 14 Nov 2000 13:40:50 -0500 (EST)
Date: Tue, 14 Nov 2000 13:40:24 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001114134023.B33756@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 735/755 and Kernel test10..
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've been working on the 735 and 755 that I has access to and so far
the systems booted the test6 kernel, but scrambled the console as soon
as init was run.  So, I figured I'd try the new test10 kernel that you
have added.  Both system boot, and then stop at this line:

branching to kernel entry point 0x00100000
Can't select default wide mode, PDC_PSW call does not work

What does the above actually mean?  How can I remove the PDC_PSW call
from the kernel so it can boot? I have plans to test this new kernel
image on a 715 later today. 

Thanks,
-- 
Phillip Beal
Electrical and Computer Engineering
S+LUG Vice-President
