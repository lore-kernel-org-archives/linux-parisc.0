Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA24515
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 16:38:50 -0700
Received: (from pdbeal@localhost)
	by Ci271622-a.lusvil1.ky.home.com (8.9.3/8.9.3) id SAA25183
	for parisc-linux@thepuffingroup.com; Tue, 31 Oct 2000 18:43:07 -0500 (EST)
	(envelope-from pdbeal)
Date: Tue, 31 Oct 2000 18:43:06 -0500
From: Phillip Beal <pdbeal@bealz.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001031184306.A25163@Ci271622-a.lusvil1.ky.home.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 735 and Thin Lan
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've obtained two HP 735's and I'd like to try the linus port on them.
I have compiled a kernel, but it never boots the nfsroot disk.  It has
the same problem that the HP 755 that I've worked with.  However, it has
a different ethernet connection.  The 735 has a thin lan connection.
What network device should be used in the kernel to be able to use the
thin lan adapter?  Here's the info on the Thin lan:

Outfield Core LAN (802.3) (10) at 0xf0826000 versions 0x9, 0x0, 0x72,
0x0, 0x0

Thanks,
-- 
Phillip Beal
S+LUG Vice-President
