Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CC72.dip.t-dialin.net [217.81.204.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C7EC482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 09:10:59 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id RAA09025
	for parisc-linux@parisc-linux.org; Mon, 4 Jun 2001 17:08:41 +0200
Date: Mon, 4 Jun 2001 17:08:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20010604170841.A8900@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr
List-ID: <linux-parisc.vger.kernel.org>

Hi,

maybe it just me, but I burned all three iso images from the France mirror
and none of it is bootable (tried on 712, C200 and J282). I get IPL checksum
error (C200/J282) or just dropping back to the bootprom (712). I could
mount them on my PC. The 0.5 ISO CD I've burned sometime ago works. So 
before more people burn coasters, could someone check, whether the images
are broken or I made an error buring the CDs.

Another question: I've tried the 64bit kernel on the C200 and got a
system not supported error. Is this a known problem or is the C200
really too old ? J282 (which AFAIK is older) booted the 64bit kernel 
just fine, but had some problems with the interrupt of the serial console
during install.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
