Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59F9B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 12:16:23 -0600 (MDT)
Date: Wed, 5 Sep 2001 14:16:14 -0400 (EDT)
From: <nick@snowman.net>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing linux on HP systems
In-Reply-To: <20010905153917.M11744@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0109051415410.8790-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I only have one device connected (a single 1gig scsi disk), which appeared
to work fine in HP-UX.  Are there any debugging options I could/should
enable?
	Nick

On Wed, 5 Sep 2001, Richard Hirst wrote:

> On Wed, Sep 05, 2001 at 10:19:37AM -0400, Carlos O'Donell Jr. wrote:
> > > > Hi, I've got a C180 and a 715 that I'm trying to install linux on.  The
> > > > C180 has various issues that I belive are being worked on, so I moved on
> > > > to the 715.  On the 715 I get errors allong the lines of:
> > > > Writing inode tables: done                            
> > > > Writing superblocks and filesystem accounting information: done
> > > > # 
> > > > # # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
> > > > #2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5
> > > > 
> > > > This happens every time I try and mount a partition.  Is the 715 scsi
> > > > unsupported as well?
> > > 
> > > 715 scsi is supported, and works for many people.  Sorry, I don't know
> > > what might be causing your problem.
> > > 
> > > Richard
> > 
> > 
> > We generally insert scsi-wrangling-magic as kernel parameters:
> > 
> > sim700=noneg:0xff,nodisc:0xff
> > 
> > And it works beautifully after that.
> 
> Ah, yes, I'd forgotten about that issue.  That is potentially needed if
> you have more than one device active on the bus, at least.
> 
> Thanks,
>  Richard
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
