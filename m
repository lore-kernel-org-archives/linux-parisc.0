Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web5503.mail.yahoo.com (web5503.mail.yahoo.com [216.115.106.186])
	by dsl2.external.hp.com (Postfix) with SMTP id 242044A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 18:19:56 -0700 (MST)
Message-ID: <20010322011955.17416.qmail@web5503.mail.yahoo.com>
Date: Wed, 21 Mar 2001 17:19:55 -0800 (PST)
From: Robert Liesenfeld <xunil96@yahoo.com>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Init not found on 735/125?
List-ID: <linux-parisc.vger.kernel.org>

I'm much closer to being able to install palinux on my 735/125...at the moment, the main problem
I'm having is this:

VFS: Mounted root (nfs filesystem) readonly.
Kernel panic: No init found.  Try passing init= option to kernel.

The NFS root fs is on my boot server, in /tftpboot/192.168.2.18.  The kernel successfully gets its
address (.2.18), and appears to mount the directory just fine...any ideas why it can't find
/sbin/init?

I've even tried passing init=/sbin/init on the kernel commandline (using palo/mklifimage).

-R


__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
