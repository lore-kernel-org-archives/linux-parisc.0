Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FABB4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 19:42:24 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-239-223.pittpa.adsl.bellatlantic.net [151.201.239.223])
	by smtp5ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id CAA2648803
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 02:49:22 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A947C8D.334DFA76@neuronet.pitt.edu>
Date: Wed, 21 Feb 2001 21:42:21 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: PL <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting nfsroot-20001009.tar.gz
List-ID: <linux-parisc.vger.kernel.org>

I got linux-20010216.tar.gz and the kernel is not crashing. I've run
into into a boot problem. Ive added the nfsroot directory in the
/etc/fstab file. With options 'default', the init process stops when
trying to start 'portmapper', it just sits there, hitting CTRL-C
continues the boot process. If I add the option 'nolock' the portmapper
will be skipped.

Next, the init process will stop or hang when trying to start 'nscd', 
CTRL-C won't break it. I disabled that script also, and finally got the
whole boot to finish.

There are other programs that don't work either, 'tar' will just sit
there, as well as 'dpkg'.

Any suggestions? Thanks.

-- 
     Rafael
