Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c007.snv.cp.net (c007-h012.c007.snv.cp.net [209.228.33.219])
	by dsl2.external.hp.com (Postfix) with SMTP id 2B75D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 May 2001 20:35:09 -0600 (MDT)
Message-Id: <5.1.0.14.0.20010520213045.029610c0@mail.execpc.com>
Date: Sun, 20 May 2001 21:35:01 -0500
To: parisc-linux@lists.parisc-linux.org
From: Tom Hansen <tomh@execpc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Problems booting .61 ISO on 715/75
List-ID: <linux-parisc.vger.kernel.org>

I have just downloaded the 0.61 ISO:

    palinux-0.6-32STI.iso.gz

from the HP site, burned a CD, and booted from the CD on my 715/75 Apollo, 
160MB, Toshiba 5701 CD-ROM. I'm using the built-in console, I don't have a 
serial console.

After what appears to be a successful start to the boot sequence (it 
identifies devices OK, etc.) it gets as far as the line:

    Console: colour dummy device 80x25

After this line is displayed, the CD is accessed for about 2 or 3 more 
seconds, after which everything stops.

Any ideas?


--
Tom Hansen
tomh@execpc.com
