Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ccd.cargoclaimsdirect.com (unknown [62.6.162.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAE27482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 10:51:22 -0600 (MDT)
Received: from ashcroft by ccd.cargoclaimsdirect.com with local (Exim 3.32 #1 (Debian))
	id 15tAso-0000re-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Oct 2001 17:46:30 +0100
Date: Mon, 15 Oct 2001 17:46:30 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011015174630.A3315@cargoclaimsdirect.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] LED device moves around on B160L
List-ID: <linux-parisc.vger.kernel.org>

Something weird is going on with the address of the LED device on my
B160L.

Here's a grep of the logs I've got:

elson:/var/log# zgrep "Linux version\|LED" messages* 
messages:Oct 15 15:55:42 nelson kernel: Linux version 2.4.9-pa57
(root@nelson) (gcc version 3.0.2 20010922 (Debian prerelease)) #16 Mon
Oct 15 15:48:33 BST 2001
messages:Oct 15 15:55:42 nelson kernel: LED display at f0190000
registered
messages.0:Oct  9 14:58:13 nelson kernel: Linux version 2.4.9-pa45
(root@nelson) (gcc version 3.0.2 20010922 (Debian prerelease)) #13 Tue
Oct 9 14:30:37 BST 2001
messages.0:Oct  9 14:58:13 nelson kernel: LED display at ffd0c000
registered
messages.0:Oct 10 13:34:23 nelson kernel: Linux version 2.4.9-pa45
(root@nelson) (gcc version 3.0.2 20010922 (Debian prerelease)) #13 Tue
Oct 9 14:30:37 BST 2001
messages.0:Oct 10 13:34:23 nelson kernel: LED display at ffd0c000
registered
messages.0:Oct 13 13:10:09 nelson kernel: Linux version 2.4.9-pa52
(root@nelson) (gcc version 3.0.2 20010922 (Debian prerelease)) #14 Sat
Oct 13 12:42:38 BST 2001
messages.0:Oct 13 13:10:09 nelson kernel: LED display at f0190001
registered
messages.1.gz:Sep 30 12:54:48 nelson kernel: Linux version 2.4.9-pa29
(root@nelson) (gcc version 3.0.2 20010825 (Debian prerelease)) #12 Sun
Sep 30 12:26:28 BST 2001
messages.1.gz:Sep 30 12:54:48 nelson kernel: PDC reported no LCD or LED.
messages.1.gz:Sep 30 12:54:48 nelson kernel: LED display at ffd0c000
registered

I think ffd0c000 is the correct address looks like it broke between pa45
and pa52.

Any thing I can do to debug this?

Cheers,
Scott
