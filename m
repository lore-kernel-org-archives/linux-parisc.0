Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id MAA27914
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 12:22:34 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id ED6AC5DE
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 14:24:46 -0500 (EST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id LAA18808
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 11:23:41 -0800 (PST)
Message-Id: <200011201923.LAA18808@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] CVS linux Vs. -test10 
In-reply-to: Your message of "Sat, 18 Nov 2000 07:24:54 PST."
             <20001118072454.C30151@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 20 Nov 2000 11:23:40 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
...
> >      * fs/nfs/read.c: probably unnecessary hack for broken parisc64 gcc
> 
> we certainly don't want to send it upstream, but we don't want to take it
> out until the bug is fixed.  is fixing that bug on the webshite todo list?

It's fixed. I was able to NFS boot my A180 and install  palinux-0.5.iso
bits on the SCSI disk. I've reverted the change to the LINUS_240_TEST10
version.

> >      * include/linux/wait.h: parisc debugging -- should be removed
> 
> yeah, that can die now.

Is anyone else already doing this?

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
