Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA06530
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 11:15:14 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 792168BD
	for <parisc-linux@puffin.external.hp.com>; Thu,  7 Dec 2000 10:17:49 -0800 (PST)
Message-Id: <200012071817.KAA08546@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com, debian-hppa@lists.debian.org
Subject: Re: A500 status update 
In-reply-to: Your message of "Thu, 07 Dec 2000 09:16:25 PST."
             <E1443ib-0003sK-00@noam.fc.hp.com>
Date: Thu, 07 Dec 2000 10:17:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> This is a pretty big difference from my experience on c3k but I was using
> Friday's bits:

Another variable:  I rebuilt my own hppa64 XC from the latest gcc/binutils
I'll try taggart's latest XC bits on the next round.

> Maybe you have some older signal code in your tree?  I explicitly tested
> SIGALRM.

Not kernel tree. Very likely my NFS root is stale.


> I've had some problems with syslogd too, but nfsroot-latest it seems
> fine.

hmm....I have that.  nfsroot-latest.tar.gz -> nfsroot-20001009.tar.gz

> When I run hwclock by hand I get warnings from the ioctl() syscall
> converter about unknown ioctls, but no crash or anything.

ok. Perhaps it's time to re-enable that.

> There will
> possibly be a LOT of unknown ioctls to translate, and we owe thanks
> to Grant for turning on the skeleton of the ioctl converter stolen
> from sparc/mips (parisc64/kernel/ioctl32.c)

I didn't do that much!
You figured out the 64-bit function pointer crud! :^)
That was the only really b0rken part.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
