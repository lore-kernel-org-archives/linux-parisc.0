Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA32201
	for <parisc-linux@puffin.external.hp.com>; Sun, 1 Aug 1999 21:31:57 -0600
Date: Mon, 2 Aug 1999 05:32:39 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI?
Message-ID: <19990802053239.N13236@suse.de>
References: <19990801215001.W25925@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990801215001.W25925@mencheca.ch.genedata.com>; from Matthew Wilcox on Sun, Aug 01, 1999 at 09:50:01PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> For those interested; Linux syscalls now take the syscall number in r20,
> take arguments in r26-r21, zero r1, r19-r26, r29 and r31 on exit, preserve
> r3-r18, r27(dp) and r30(sp), clobber r2 and return the result in r28.

sounds rather strange but as long as gcc takes it as inline assembly ...

> ObRant: Why on earth define a register to be caller-saves but not allow it
> to contain an argument?  Why force it onto the stack?

An ABI that would specify too many argument registers would force the caller
to load them before the call and the callee to save them again because both
would need the additional argument registers.
