Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA02147
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:13:25 -0700
Received: from whitetower.tamu.edu (dyna-0003.vpn.tamu.edu [172.16.32.3])
	by mail.tamu.edu (8.9.3/8.9.3) with ESMTP id OAA25944
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 14:15:13 -0600 (CST)
Message-Id: <4.3.0.20001115140420.00d20820@clavin.cs.tamu.edu>
Date: Wed, 15 Nov 2000 14:14:13 -0600
To: parisc-linux@thepuffingroup.com
From: Jack Perdue <j-perdue@tamu.edu>
Subject: Doh!!!  was Re: [parisc-linux] nfsroot - 712/60 - RPC - help
In-Reply-To: <4.3.0.20001115132700.00cc91b0@clavin.cs.tamu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>


Of course, as soon I collected all that info and sent it I,
in rereading, realized that I had put 192.68.1.11 in
palo/Makefile instead of 192.168.1.11.  Doh!

However, since the info is out there now, can someone
tell me what I need to resolve the following:

   [previous console output in previous mail]
   Switching from PDC console
   kmem_create: Forcing size word alignment - nfs_fh
   Looking up port of RPC 100003/2 on 192.168.1.11
   Looking up port of RPC 100005/2 on 192.168.1.11
   VFS: Mounted root (nfs filesystem) readonly.
   Kernel panic: No init found.  Try passing init= option to kernel.

jack
j-perdue@tamu.edu
