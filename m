Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C7C3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 02:39:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7F6F7B00C; Fri,  7 Sep 2001 09:39:56 +0100 (BST)
Date: Fri, 7 Sep 2001 09:39:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: nick@snowman.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing linux on HP systems
Message-ID: <20010907093956.C19441@linuxcare.com>
References: <20010905153917.M11744@linuxcare.com> <Pine.LNX.4.21.0109051415410.8790-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0109051415410.8790-100000@ns>; from nick@snowman.net on Wed, Sep 05, 2001 at 02:16:14PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 05, 2001 at 02:16:14PM -0400, nick@snowman.net wrote:
> I only have one device connected (a single 1gig scsi disk), which appeared
> to work fine in HP-UX.  Are there any debugging options I could/should
> enable?

So you are installing from the network I guess (cdrom would be a second
device).  You should try the scsi-wrangling-magic as Carlos suggests,
just in case.

Richard

> > On Wed, Sep 05, 2001 at 10:19:37AM -0400, Carlos O'Donell Jr. wrote:
> > > We generally insert scsi-wrangling-magic as kernel parameters:
> > > 
> > > sim700=noneg:0xff,nodisc:0xff
> > > 
> > > And it works beautifully after that.
