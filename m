Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id VAA04578
	for <hppa-linux@sod.res.cmu.edu>; Wed, 17 Mar 1999 21:13:14 -0500
Received: from netscape.com (h-205-217-237-46.netscape.com [205.217.237.46])
	by burrow.puffingroup.com (8.8.7/8.8.7) with ESMTP id WAA00825
	for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999 22:17:58 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id SAA21136
	for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999 18:12:16 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8RQ4H00.7K6 for <hppa-linux@puffingroup.com>; Wed, 17 Mar 1999
          18:12:17 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F0616F.D8B86BAD@netscape.com>
Date: Wed, 17 Mar 1999 21:14:07 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] kernel stuff
List-ID: <linux-parisc.vger.kernel.org>

Two questions:
1) Why is there not a complete kernel checked into CVS?  It's going to
be a major nightmare if we don't control the entire tree and when we
merge forward to new Linus versions, etc.
[shaver@loonie parisc-linux]$ cvs -d
:pserver:shaver@sod.res.cmu.edu:/home/cvs/hppa co linux
cvs server: Updating linux
cvs server: Updating linux/arch
cvs server: Updating linux/arch/parisc
cvs server: Updating linux/arch/parisc/hp
U linux/arch/parisc/hp/machines.h
cvs server: Updating linux/arch/parisc/hp/boot
U linux/arch/parisc/hp/boot/Makefile
U linux/arch/parisc/hp/boot/mkipl.c
U linux/arch/parisc/hp/boot/mklifhdr.c
[shaver@loonie parisc-linux]$

2) What version should I unpack under the bits that _are_ in the tree?

Mike

-- 
291958.32 246858.49
