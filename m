Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1BF05485B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Sep 2001 07:45:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15hWoC-0001ib-00; Thu, 13 Sep 2001 14:45:36 +0100
Date: Thu, 13 Sep 2001 14:45:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Bent Wagner <psy@get2net.dk>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] AUI on 725-100
Message-ID: <20010913144536.J2618@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0109130021290.1097-100000@psy.bronderslev.dk> <20010913135132.I2618@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010913135132.I2618@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Sep 13, 2001 at 01:51:32PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 13, 2001 at 01:51:32PM +0100, Matthew Wilcox wrote:
> On Thu, Sep 13, 2001 at 12:28:31AM +0200, Bent Wagner wrote:
> > I do have a netcard, a 100VG but it gives compiler errors
> > if i select it in the kernel configuration.

Ah, it uses isa_readl, et al.  So either we implement those functions or
just port the driver to use ioremap + readl.  I believe that the isa_*
functions are going away in 2.5, so we may as well port this driver.
As I say though, the WAX EISA adapter driver is mostly unwritten at this
point, so you'll have to wait a few weeks before it's done.

-- 
Revolutions do not require corporate support.
