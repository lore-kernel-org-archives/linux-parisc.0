Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from silly.cloud.net.au (co3002322-a.eburwd1.vic.optushome.com.au [203.164.64.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 164754869
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 06:20:58 -0600 (MDT)
Date: Wed, 3 Oct 2001 22:20:29 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FW SCSI on the D350
Message-ID: <20011003222029.B6451@silly.cloud.net.au>
References: <hamish@cloud.net.au> <20010928001354.A1519@silly.cloud.net.au> <200109280541.XAA27408@puffin.external.hp.com> <20010928010518.A12507@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010928010518.A12507@beavis.ybsoft.com>; from rbradetich@uswest.net on Fri, Sep 28, 2001 at 01:05:18AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 28, 2001 at 01:05:18AM -0600, Ryan Bradetich wrote:
> > Hamish Moffatt wrote:
> > > I'm trying to install the 0.9 release on a D350 server. The kernel
> > > recognises the standard SCSI, using the lasi7xxx driver, and finds
> > > the tape drive and the CD-ROM on that host. However, it doesn't
> > > find the Bluefish fast/wide SCSI host, so it doesn't find the
> > > four internal hard disks, which makes installation a little tough.
> 
> You need a newer kernel, and you should be able to see the SCSI
> card.  I'm not sure which -pa?? kernel, so just grab CVS head and
> that should be sufficient.

I got 2.4.9-pa30 from CVS and booted it up, and it found the Bluefish
card and the four SCSI drives. Neat! Thanks!

Unfortunately I stuffed up something else, and it couldn't load the
RAM disk, so I haven't been able to actually install it yet. But
it looks promising.


regards,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
