Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id GAA32352
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 06:24:10 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 142vQp-00008u-00; Mon, 04 Dec 2000 13:13:23 +0000
Date: Mon, 4 Dec 2000 13:13:23 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: pci changes
Message-ID: <20001204131323.D24826@parcelfarce.linux.theplanet.co.uk>
References: <200012041254.FAA15582@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012041254.FAA15582@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Dec 04, 2000 at 05:54:08AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 04, 2000 at 05:54:08AM -0700, John Marvin wrote:
> > we're getting close to merging -- just waiting for some replies from linus
> > about some things we do which are slightly ugly and there's no obvious
> > non-ugly way to do them.
> 
> What exactly are you talking about here? Are you attempting to get our
> machine independent changes in at this time? I thought we had decided
> that we were only going to send him the machine dependent part of the
> tree at this time.

Alan wants to put some of our independnt parts in too.  I'm just sorting
out the stack direction and location issues in the way Linus wants
it done.

> There are still issues that need to be resolved in the machine independent
> code that will cause things to be done differently from the way we are
> doing them now (e.g. stack direction, stack location, possibly some cache
> flushing).  It does not make sense to try to merge the machine independent
> code at this time in my opinion.
> 
> John Marvin
> jsm@fc.hp.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

-- 
Revolutions do not require corporate support.
