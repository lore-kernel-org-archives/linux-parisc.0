Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD905478C.dip.t-dialin.net [217.5.71.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0FA1482A
	for <parisc-linux@parisc-linux.org>; Thu, 21 Jun 2001 14:52:58 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id WAA10836
	for parisc-linux@parisc-linux.org; Thu, 21 Jun 2001 22:50:16 +0200
Date: Thu, 21 Jun 2001 22:50:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20010621225016.A10091@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] misc stuff
List-ID: <linux-parisc.vger.kernel.org>

Hi,

with the new changes to io.h enabling of HPPA_IOREMAP is really deadly. There
are some ioremap in drivers missing. The diff below gets my 712 up again.
I guess placing the ioremap to sim700.c would be better, wouldn't it ?
And I'm not sure about the size for the ioremap.

Ok, next issue. I've tried the ps2 mouse patch and it's working for me,
so how about commiting it ?

And finally I've tested the harmony driver. I don't know whether /dev/dsp 
should be always little endian, but I had to convert the .wav files to big 
endian before hearing anything usefull. So should /dev/dsp take native
endian or little endian ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
