Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA31149
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 06:10:30 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 7952821
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 08:12:44 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id GAA25238 for parisc-linux@puffin.external.hp.com; Tue, 21 Nov 2000 06:11:29 -0700 (MST)
Date: Tue, 21 Nov 2000 06:11:29 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011211311.GAA25238@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: CVS linux Vs. -test10
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> > I had dinner with Bdale Garbee last night and one of two things he made
> > clear was we need to unfork from debian and linus's tree in order to move
> > forward. All our CVS branches need to become obsolete or "local sandboxes"
> > of the respective upstream partners. Feeding kernel bits upstream will
> > bring a new level of visibility (and *HELP*) to the parisc-linux port.
>
> that's true.  last time we discussed this several people were unhappy
> with the idea of sending our current work to Linus.  Is anyone unhappy
> with doing this now?
>

Are we suggesting that we populate include/asm-parisc* and arch/parisc*
WITHOUT the machine independent changes in the rest of the tree?
If that is the case, I guess I don't object, although I would want
to make sure that Linus knew the state of the code, and that it would
not work without a patch containing changes to the machine independent
part, and that followup patches to these branches are likely to be
huge. We should also add a README in arch/parisc that explains the
above (and where to get patches, how to access CVS, etc.). We also
need someone to set up an automatic nightly? patch generator.

I certainly don't want to try to get the machine independent changes in
yet, since we still have some major issues to fix/clean there, and I doubt
Linus would want them at this time anyway.

John Marvin
jsm@fc.hp.com
