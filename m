Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9051BC2.dip.t-dialin.net [217.5.27.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9CF18482A
	for <parisc-linux@parisc-linux.org>; Sun, 14 Oct 2001 12:48:50 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.11.6/8.11.6) id f9EImZq18596
	for parisc-linux@parisc-linux.org; Sun, 14 Oct 2001 20:48:35 +0200
Date: Sun, 14 Oct 2001 20:48:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20011014204835.A18545@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with onboard 715/100 framebuffer
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I have a small problem with my 715/100 (updated to PDC version 1.6), the 
onboard graphics doesn't work. I always get a blank screen and when booting
linux the sti debug output prints a screen size of 0x0 :-( Since I got this
machine with HCRX8Z installed it might be, that the onboard graphics has 
been disabled, but I haven't found to enable it again.

Maybe someone here could give me a hint either how to enable the onboard
framebuffer or a way how to find out, what's wrong (maybe the video ram
is bad or whatever).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
