Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA28725
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 10:58:40 -0600
Received: from cmail2.rsn.hp.com (cmail2.rsn.hp.com [15.99.101.1])
	by atlrel1.hp.com (Postfix) with ESMTP id 48E9D2693
	for <parisc-linux@thepuffingroup.com>; Tue,  5 Sep 2000 12:58:53 -0400 (EDT)
Date: Tue, 5 Sep 2000 12:02:28 -0500
From: Bob Pflederer <krp@rsn.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
Message-ID: <20000905120228.H999@localhost.localdomain>
References: <200009030329.VAA17641@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200009030329.VAA17641@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Sat, Sep 02, 2000 at 09:29:57PM -0600
List-ID: <linux-parisc.vger.kernel.org>

I noticed that John committed something this morning, so I tried it out
on my C180, and it works!  For the first time, the CVS kernel boots 
un-modified on my C180.  Odds are good that it will also work in C200+.

Thanks, John.

> 
> My fix will do a simple 3-4 assembly instruction test for PA2.0 in
> head.S, and then install the appropriate iva. This wastes 2K of memory
> having two iva's, but is a lot simpler to do in assembly very early
> in the boot process. I'll try to get this done by Tuesday morning
> (I work throughout the night Monday).
> 
> John Marvin
> jsm@fc.hp.com
> 
