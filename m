Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F69D482A
	for <parisc-linux@parisc-linux.org>; Sun, 26 Aug 2001 10:00:46 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GION5201.J5P for
          <parisc-linux@parisc-linux.org>; Sun, 26 Aug 2001 08:00:39 -0800
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GION5300.P0B for <parisc-linux@parisc-linux.org>; Sun, 26 Aug
          2001 08:00:39 -0800
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id HAA13404
	for <parisc-linux@parisc-linux.org>; Sun, 26 Aug 2001 07:55:46 -0800
Date: Sun, 26 Aug 2001 07:55:46 -0800 (AKDT)
From: Tom <tom@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0108260741370.1919-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Kernel building
List-ID: <linux-parisc.vger.kernel.org>

I've been trying to get a newer kernel installed but am not having much
luck. Followed the directions on parisc-linux.org to build it, which have
worked fine, but for some reason the kernels refuse to boot. The palo
readme file says it should automagically boot when placed in the correct
location... My palo.conf had '2/vmlinux-2.4.0' as the boot kernel, which
I then changed to '2/vmlinux-2.4.9' (partition 2 is /boot once mounted),
ran palo (no errors, identified 2/vmlinux-2.4.9 as the new kernel),
rebooted - and I get the error that the system can't grok the kernel
executable format and then a 'failed to boot' message.

The earlier thread on whether or not 'make palo' was needed came to mind,
but since I was leaving it overnight to compile anyway I didn't care how
much time it took.

Got this same error a couple kernels ago (2.4.6?) and went back to 2.4.0,
since it wasn't really causing any problems. This is starting to get
irritating, though. The system is a 715/100, 128MB, 4.3G HD. Started as
0.9 and 'apt-get' upgraded to whatever's current now. I *did* have to
'apt-get install gcc', though - even though dselect said it was already
installed, the system couldn't find gcc, but the apt-get installed it as
if it wasn't there. Weird...

Anyway, any and all input appreciated!
