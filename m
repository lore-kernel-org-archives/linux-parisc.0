Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA23044
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 12:39:29 -0600
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id OAA30471
	for <parisc-linux@thepuffingroup.com>; Wed, 9 Jun 1999 14:39:23 -0400
Date: Wed, 9 Jun 1999 14:39:23 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990609143718.25825A-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] making a bootable image
List-ID: <linux-parisc.vger.kernel.org>


I've committed my changes which basically fix up the kernel so you can
build it with 'make bootable', and the bootstrap code will be setup
correctly in a file called bootstrap.bin.

This handles all the ISL and LIF stuff that we shouldn't have to deal with
anymore.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team
