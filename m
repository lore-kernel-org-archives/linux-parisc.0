Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA12187
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 18:53:30 -0600
Received: from sunapee.transcept.com (sunapee.transcept.com [129.86.50.245])
	by sunapee.transcept.com (8.9.3/8.9.3) with ESMTP id UAA25919
	for <parisc-linux@thepuffingroup.com>; Thu, 22 Jun 2000 20:54:08 -0400
Date: Thu, 22 Jun 2000 20:54:08 -0400 (EDT)
From: Pavel Roskin <proski@gnu.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0006222049530.16942-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Where is umount syscall?
List-ID: <linux-parisc.vger.kernel.org>

Hello!

linux-2.3/include/asm-parisc/unistd.h doesn't define __NR_umount for some
reason. Other architectures define it.

Regards,
Pavel Roskin
