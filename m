Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 830DA482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Sep 2001 23:18:20 -0600 (MDT)
Received: from localhost (nick@localhost)
	by ns.snowman.net (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA09205
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Sep 2001 01:18:19 -0400
Date: Wed, 5 Sep 2001 01:18:19 -0400 (EDT)
From: <nick@snowman.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010905051128.98221.qmail@web20210.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0109050116100.8790-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] installing linux on HP systems
List-ID: <linux-parisc.vger.kernel.org>

Hi, I've got a C180 and a 715 that I'm trying to install linux on.  The
C180 has various issues that I belive are being worked on, so I moved on
to the 715.  On the 715 I get errors allong the lines of:
Writing inode tables: done                            
Writing superblocks and filesystem accounting information: done
# 
# # EXT2-fs error (device sd(8,2)): ext2_readdir: bad entry in directory
#2: rec_len % 4 != 0 - offset=0, inode=1701996660, rec_len5

This happens every time I try and mount a partition.  Is the 715 scsi
unsupported as well?
	Nick
