Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C918482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 08:18:47 -0600 (MDT)
Date: Wed, 5 Sep 2001 10:19:37 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Cc: nick@snowman.net
Subject: Re: [parisc-linux] installing linux on HP systems
Message-ID: <20010905101937.F22477@megatonmonkey.net>
References: <20010905051128.98221.qmail@web20210.mail.yahoo.com> <Pine.LNX.4.21.0109050116100.8790-100000@ns> <20010905140052.J11744@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010905140052.J11744@linuxcare.com>; from rhirst@linuxcare.com on Wed, Sep 05, 2001 at 02:00:53PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > Hi, I've got a C180 and a 715 that I'm trying to install linux on.  The
> > C180 has various issues that I belive are being worked on, so I moved on
> > to the 715.  On the 715 I get errors allong the lines of:
> > Writing inode tables: done                            
> > Writing superblocks and filesystem accounting information: done
> > # 
> > # # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
> > #2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5
> > 
> > This happens every time I try and mount a partition.  Is the 715 scsi
> > unsupported as well?
> 
> 715 scsi is supported, and works for many people.  Sorry, I don't know
> what might be causing your problem.
> 
> Richard


We generally insert scsi-wrangling-magic as kernel parameters:

sim700=noneg:0xff,nodisc:0xff

And it works beautifully after that.

Cheers,
Carlos.
