Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA02476
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 10:39:57 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13yHNh-0007iG-00; Tue, 21 Nov 2000 17:38:57 +0000
Date: Tue, 21 Nov 2000 17:38:57 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: CVS linux Vs. -test10
Message-ID: <20001121173857.B28902@parcelfarce.linux.theplanet.co.uk>
References: <200011211311.GAA25238@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011211311.GAA25238@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Tue, Nov 21, 2000 at 06:11:29AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 06:11:29AM -0700, John Marvin wrote:
> Are we suggesting that we populate include/asm-parisc* and arch/parisc*
> WITHOUT the machine independent changes in the rest of the tree?

Yes.

> If that is the case, I guess I don't object, although I would want
> to make sure that Linus knew the state of the code, and that it would
> not work without a patch containing changes to the machine independent
> part, and that followup patches to these branches are likely to be
> huge. We should also add a README in arch/parisc that explains the
> above (and where to get patches, how to access CVS, etc.). We also
> need someone to set up an automatic nightly? patch generator.

Agreed.  The patch generation is not a big deal to arrange.

> I certainly don't want to try to get the machine independent changes in
> yet, since we still have some major issues to fix/clean there, and I doubt
> Linus would want them at this time anyway.

Certainly none of the stack direction changes.  Some of the MI stuff is
arguably stuff we could put in.

-- 
Revolutions do not require corporate support.
