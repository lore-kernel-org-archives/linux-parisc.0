Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id FAA31554
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 05:52:49 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 6EC865DD
	for <parisc-linux@puffin.external.hp.com>; Mon,  4 Dec 2000 07:55:23 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id FAA15582 for parisc-linux@puffin.external.hp.com; Mon, 4 Dec 2000 05:54:08 -0700 (MST)
Date: Mon, 4 Dec 2000 05:54:08 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200012041254.FAA15582@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: pci changes
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> we're getting close to merging -- just waiting for some replies from linus
> about some things we do which are slightly ugly and there's no obvious
> non-ugly way to do them.

What exactly are you talking about here? Are you attempting to get our
machine independent changes in at this time? I thought we had decided
that we were only going to send him the machine dependent part of the
tree at this time.

There are still issues that need to be resolved in the machine independent
code that will cause things to be done differently from the way we are
doing them now (e.g. stack direction, stack location, possibly some cache
flushing).  It does not make sense to try to merge the machine independent
code at this time in my opinion.

John Marvin
jsm@fc.hp.com
