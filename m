Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA11067
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 18:03:14 -0600
Received: from sunapee.transcept.com (sunapee.transcept.com [129.86.50.245])
	by sunapee.transcept.com (8.9.3/8.9.3) with ESMTP id UAA18973
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 20:03:50 -0400
Date: Thu, 22 Jun 2000 20:03:50 -0400 (EDT)
From: Pavel Roskin <proski@gnu.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0006221948010.14277-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Busybox 0.45 released
List-ID: <linux-parisc.vger.kernel.org>

Hello!

I think that some of you may be interested that Busybox 0.45 has been
released. This version fixes too many bugs to list here.

Busybox is small, easy to cross-compile. It provides essential utilities
such as init, mount, telnet (now working) and other.

I tried the busybox binary from the "gonzo" filesystem. There is a problem
with "init" when it's a symlink to busybox - it complains about
insufficient memory (today's kernel from CVS). This is almost certainly a
kernel problem.

I would like to see the binary of busybox on the ftp server. By the way,
it would be nice to update the precompiled kernel - the latest kernel on
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/ is dated by
February 18, 2000.

Another side note - the list of modules on
http://www.thepuffingroup.com/parisc/cvs.html needs to be updated.

Regards,
Pavel Roskin
