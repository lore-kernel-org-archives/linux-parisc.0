Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ntserver.voltaire.com (unknown [212.150.138.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0B04482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 31 May 2001 10:54:01 -0600 (MDT)
Message-ID: <20083A3BAEF9D211BDB600805F8B14F3FCE997@NTSERVER>
From: Miri Groentman <mirig@voltaire.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 31 May 2001 19:50:59 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Subject: [parisc-linux] Returning from a blocking select call
List-ID: <linux-parisc.vger.kernel.org>

I=92m writing a program in which I=92m using select in order to wait =
for socket
i/o.=20
I=92m waiting infinitely on this select call (by passing NULL as =
timeout).
Is there any way in which I can return from a blocking select call, =
other
than receiving input?
Thanks
-Miri =20
