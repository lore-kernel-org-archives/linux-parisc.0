Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86BBA482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 08:21:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15edYa-0005jO-00; Wed, 05 Sep 2001 15:21:32 +0100
Date: Wed, 5 Sep 2001 15:21:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: nick@snowman.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing linux on HP systems
Message-ID: <20010905152132.D29327@parcelfarce.linux.theplanet.co.uk>
References: <20010905051128.98221.qmail@web20210.mail.yahoo.com> <Pine.LNX.4.21.0109050116100.8790-100000@ns>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0109050116100.8790-100000@ns>; from nick@snowman.net on Wed, Sep 05, 2001 at 01:18:19AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 05, 2001 at 01:18:19AM -0400, nick@snowman.net wrote:
> Writing inode tables: done                            
> Writing superblocks and filesystem accounting information: done
> # 
> # # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
> #2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5
> 
> This happens every time I try and mount a partition.  Is the 715 scsi
> unsupported as well?

What version of e2fsprogs do you have installed?

-- 
Revolutions do not require corporate support.
