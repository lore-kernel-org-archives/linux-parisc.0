Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22252482A
	for <parisc-linux@parisc-linux.org>; Sat, 15 Sep 2001 00:14:47 -0600 (MDT)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GJOXCN00.ZI4 for
          <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 22:14:47 -0800
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GJOXCO03.E7A for <parisc-linux@parisc-linux.org>; Fri, 14 Sep
          2001 22:14:48 -0800
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA17342
	for <parisc-linux@parisc-linux.org>; Fri, 14 Sep 2001 22:08:16 -0800
Date: Fri, 14 Sep 2001 22:08:16 -0800 (AKDT)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109142153120.25368-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Odd X display
List-ID: <linux-parisc.vger.kernel.org>

First of all, big thanks to all for the latest patches to the kernel. It
appears that my 715/100 is *finally* completely working - keyboard
included. Even XF86 works now, except for a weird display. It appears that
the color depth or refresh is wrong, but I'm not sure how it can be. The
monitor is a HP A1097C, 1280x1024x8, 78.125/72.008 h/v refresh. I'm using
fbdev for the driver, the boot shows that as the detected frame buffer...
But I get a semi-scrambled display. (Not like I'm out of refresh, more
like the color depth is wrong...) Unreadable, no mouse... I thought at
first I had a bad window manager, but it happens with KDE, icewm,
enlightenment and fvwm95.

My config and boot can be seen at ftp://ftp.alaskatech.org/XF86Config-4
and ftp://ftp.alaskatech.org/dmesg.txt if they'll help. I don't recall
anything like this being posted on here yet, so I'm thinking it's
something in my config that's wrong, and that I don't recognize since most
of what I do is x86, not PA-RISC...

Any help much appreciated.
