Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA23003
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 14:15:32 -0700
Received: from cancun.rose.hp.com (cancun.rose.hp.com [15.43.234.191])
	by palrel1.hp.com (Postfix) with ESMTP id 1B3D410D2
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Jan 2001 13:19:11 -0800 (PST)
Received: (from cmoore@localhost)
	by cancun.rose.hp.com (8.9.3 (PHNE_21697)/8.9.3 SMKit7.02) id NAA29050
	for parisc-linux@thepuffingroup.com; Mon, 15 Jan 2001 13:28:34 -0800 (PST)
From: "Chris Moore" <cmoore@cancun.rose.hp.com>
Message-Id: <1010115132833.ZM29048@cancun.rose.hp.com>
Date: Mon, 15 Jan 2001 13:28:33 -0800
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] More 735 boot woes
List-ID: <linux-parisc.vger.kernel.org>

Hello again,

Thanks to the people who provided me with kernels (Phillip, and whoever
loaded a new one to the FTP site - Andrew?  Grant?).
I now have two fairly new kernels that both do the same thing - and
it's the same problem mentioned earlier this month by Aleksandr
Konstantinov.  I get as far as "parport_initialize_chip: initialize
bidirectional-mode".  Then I get an HPMC.

The isr.ior at the time of the HPMC indicates I'm at
parport_PS2_supported+0x64.
Also the register dump shows the HPA of the Outfield Core Centronics
interface in registers r6, r25, and r26.  I can't get much further
without (yet) being able to build kernels, but it looks like these kernels
don't like the Outfield Core Centronics.  I'd suspect that it was just
my system having bad hardware except that it sounds like at least one
other person has seen the same HPMC.

Has anyone else seen this problem on a 735?  Anyone have a fix?

Thanks,

Chris Moore
