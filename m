Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C77A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 08:38:36 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 69ABEB00C; Wed,  5 Sep 2001 15:39:17 +0100 (BST)
Date: Wed, 5 Sep 2001 15:39:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, nick@snowman.net
Subject: Re: [parisc-linux] installing linux on HP systems
Message-ID: <20010905153917.M11744@linuxcare.com>
References: <20010905051128.98221.qmail@web20210.mail.yahoo.com> <Pine.LNX.4.21.0109050116100.8790-100000@ns> <20010905140052.J11744@linuxcare.com> <20010905101937.F22477@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010905101937.F22477@megatonmonkey.net>; from carlos@megatonmonkey.net on Wed, Sep 05, 2001 at 10:19:37AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 05, 2001 at 10:19:37AM -0400, Carlos O'Donell Jr. wrote:
> > > Hi, I've got a C180 and a 715 that I'm trying to install linux on.  The
> > > C180 has various issues that I belive are being worked on, so I moved on
> > > to the 715.  On the 715 I get errors allong the lines of:
> > > Writing inode tables: done                            
> > > Writing superblocks and filesystem accounting information: done
> > > # 
> > > # # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
> > > #2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5
> > > 
> > > This happens every time I try and mount a partition.  Is the 715 scsi
> > > unsupported as well?
> > 
> > 715 scsi is supported, and works for many people.  Sorry, I don't know
> > what might be causing your problem.
> > 
> > Richard
> 
> 
> We generally insert scsi-wrangling-magic as kernel parameters:
> 
> sim700=noneg:0xff,nodisc:0xff
> 
> And it works beautifully after that.

Ah, yes, I'd forgotten about that issue.  That is potentially needed if
you have more than one device active on the bus, at least.

Thanks,
 Richard
