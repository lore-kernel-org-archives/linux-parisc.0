Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AF97482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 01:45:55 -0600 (MDT)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id BAA23843
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 01:45:53 -0600
Date: Sun, 16 Sep 2001 01:45:53 -0600 (MDT)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109160125430.22634-100000@lefou>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] linux and hp 735/125 fs corruption
List-ID: <linux-parisc.vger.kernel.org>

Hi,
I have an hp 735/125 on which I initially installed hp-ux 11.0.  That was
all fine and dandy, but I got tired of trying to figure out the insides of
hp-ux, so I finally just turned the thing off.

It seemed like it might be fun to install linux on the box, so I got a
file system and precompiled kernel (2.4.0-32)  from:
http://mkhppa1.esiee.fr/

I installed these following the instructions from the same site.  It went
along more or less well until I tried to copy the latest kernel source
over ssh to the hp box.  It copied about 90% and then threw an
"Input/output error".  At that point all the programs I tried with the
exception of 'ls' threw the same error.  These symptoms have been repeated
regularly.

I do not have any swap partions.  I have 300MB on the box.  I tried with
two different disks and two different 735's.  Fsck on the root partition
shows massive (but so far recoverable) file system corruption.

Things I can't do:
	complete apt-get update
	untar kernel source
	copile kernel source
	scp kernel source

Things I can do:
	login
	add new users, modify passwords
	ssh session
	vi /etc/fstab, /etc/hosts, etc
	make menuconfig (for kernel compile)

I am baffeled.  I haven't been able to find any information on this
subject, other than to note that 2.4.0 has been blamed for fs corruption
on some systems.

Any ideas?

thanks,
Sonny Cook
