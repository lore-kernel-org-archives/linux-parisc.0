Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr14.vic-remote.bigpond.net.au (mr14.vic-remote.bigpond.net.au [24.192.1.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id E11474A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 00:53:26 -0700 (MST)
Received: from customware.com.au (CPE-144-132-17-132.vic.bigpond.net.au [144.132.17.132])
	by mr14.vic-remote.bigpond.net.au (Pro-8.9.3/8.9.3) with ESMTP id SAA03785
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 18:53:18 +1100 (EDT)
From: penfold@customware.com.au
Received: (from penfold@localhost)
	by customware.com.au (8.9.3/8.8.7) id SAA15254
	for parisc-linux@lists.parisc-linux.org; Sun, 11 Feb 2001 18:53:13 +1100
Message-Id: <200102110753.SAA15254@customware.com.au>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 11 Feb 2001 18:50:42 +1100 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tar, spinlocks and 715 and 720
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I there was discussion about tar locking up on 715 and the consesus was
that it was spinlock related and due to an alignment issue.

Was this fixed?

Is/Was it a kernel or glibc problem?

As far as I can tell, this is causing dpkg to lock up also -
tiki2:/artemis/install/debian-hppa# ps -H
  PID     TTY                 TIME           CMD
  167     ttyS0             00:00:00       rpciod
  102     ttyS0             00:00:37       sh
  307     ttyS0             00:00:02         dpkg
  310     ttyS0             00:00:01           dpkg-deb
  311     ttyS0             00:00:00             dpkg-deb <defunct>
  312     ttyS0             00:00:01             gzip
  313     ttyS0             00:00:01             tar
  340     ttyS0             00:00:04         ps
tiki2:/artemis/install/debian-hppa#

tar on its own also locks up.

thanks,

- Damian
penfold@customware.com.au
