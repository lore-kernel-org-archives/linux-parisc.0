Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA24395
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 18:04:33 -0600
From: willy@thepuffingroup.com
Date: Thu, 18 May 2000 21:04:35 -0400
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] move to 2.3.99pre8?
Message-ID: <20000518210435.B28590@thepuffingroup.com>
References: <20000518171449.E20055@thepuffingroup.com> <20000518234102.B2592@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000518234102.B2592@alpha.franken.de>; from Thomas Bogendoerfer on Thu, May 18, 2000 at 11:41:02PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 18, 2000 at 11:41:02PM +0200, Thomas Bogendoerfer wrote:
> On Thu, May 18, 2000 at 05:14:49PM -0400, willy@thepuffingroup.com wrote:
> > 
> > i just thought i'd throw out a feeler to see what people think about
> > moving to 2.3.99pre8.  it seems reasonably stable to me, but I haven't
> > tried root nfs yet.  i have some conflicting things to work on right now,
> > but how would people feel about having friday 26th may as migration day?
> 
> is it really necessary to sync again ? I don't see it helping us, or
> is there some bugs in pre1, we need to get tid of ?

There aren't any pressing bugs that I'm aware of (please shout if anyone
knows otherwise).  However, we don't want to diverge too much from Linus'
tree, as it makes later merges more painful.  We last merged around March
26th at the puffinfest, so it's been 2 months -- I personally feel that's
about the maximum length of time we should leave it before the changes
become too painful to merge.
