Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA21209
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 17:24:24 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 759267ED
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 17:24:10 -0600 (MDT)
Date: Fri, 25 Aug 2000 17:23:06 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200008252323.RAA22968@udlkern.fc.hp.com>
To: amodra@puffin.external.hp.com
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 64 bit linker problem?
List-ID: <linux-parisc.vger.kernel.org>


> Another 64-bit gotcha: in arch/parisc64/kernel/entry.S:start_parisc_asm
> the 'b start_parisc' is branching through a stub and failing miserably.
> Linker problem?

Just some more information. The "b start_parisc" appears to branch to
what should be a stub entry. There is nothing there, i.e. it is all
zero's, so we get a break instruction trap.

John Marvin
jsm@fc.hp.com
