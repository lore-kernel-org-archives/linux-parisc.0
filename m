Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA21977
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 14:56:16 -0600
Received: from videotron.ca ([216.113.0.11]) by
          VL-MS-MR002.sc1.videotron.ca (Netscape Messaging Server 4.15)
          with ESMTP id G2N8U902.PEL for
          <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 16:56:33 -0400
Sender: fleet@mailserv2.iuinc.com
Message-ID: <39EE0E7D.5B1BC51D@videotron.ca>
Date: Wed, 18 Oct 2000 16:56:29 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] booting 712/60 with STI console
List-ID: <linux-parisc.vger.kernel.org>


Alright, I recompiled my kernel using dhd's config but I'm still getting
no where. No when I boot I get something like this...

Console: switching to color STI console 80x30
searching for byte mode STI ROMs
STI ROM from PDC at f0080000
found potential STI ROM at f0080000
STI word mode ROM at f0080000, ignored
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.1.99, my addressis
192.168.1.111
kmem_create: Forcing size word alignment - nfs_fh
Kernel panic: VFS: Unable to mount root fs on 01:00

And that's it. It is running cause I can ping it.
	Another thing is there anyone working on getting everthing to install
on a hard drive (self hoasting is what it is called?)? I noticed from
the palo docs that the only way to get everything on a hard drive is to
partition it and then install the kernel via palo from another comp (a
linux box). Is this still true? If not then I'd like to try and see if I
can get it working. Unless someone better qualified is working on it.

James

-- 
Can you discern the signs of the times? || www.danielrevelation.com
Do you see the storm fast approaching?  || www.sundaylaw.com
Is your future built on "The Rock"?     ||
www.bibleinfo.com/sc/toc_sc.html
