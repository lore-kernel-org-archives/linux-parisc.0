Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35312482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 12:16:10 -0600 (MDT)
Date: Wed, 5 Sep 2001 14:15:37 -0400 (EDT)
From: <nick@snowman.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing linux on HP systems
In-Reply-To: <20010905152132.D29327@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0109051414490.8790-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I am useing the debian narrow kernel, along with the attached ramdisk.  I
can check on the versions it contains.
	Nick

On Wed, 5 Sep 2001, Matthew Wilcox wrote:

> On Wed, Sep 05, 2001 at 01:18:19AM -0400, nick@snowman.net wrote:
> > Writing inode tables: done                            
> > Writing superblocks and filesystem accounting information: done
> > # 
> > # # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
> > #2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5
> > 
> > This happens every time I try and mount a partition.  Is the 715 scsi
> > unsupported as well?
> 
> What version of e2fsprogs do you have installed?
> 
> -- 
> Revolutions do not require corporate support.
> 
