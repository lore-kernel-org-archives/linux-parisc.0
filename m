Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9054371.dip.t-dialin.net [217.5.67.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F0E9482A
	for <parisc-linux@parisc-linux.org>; Wed, 13 Jun 2001 18:34:42 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id CAA11608
	for parisc-linux@parisc-linux.org; Thu, 14 Jun 2001 02:32:11 +0200
Date: Thu, 14 Jun 2001 02:32:10 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20010614023210.A11525@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Byte mode STI roms
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've played a little bit with the stifb on my C200 with a HCRX24 and got
the stifb to recognize it as valid card. My approach was to just get rid
of that funky STI_Uxx macros by copying the byte rom into memory and
adjusting the offsets. This way sticon-wmode.c and sticon-bmode.c are
nearly the same and with a little bit more tweaking I could get them
merged. 

So is there a deeper magic hidden why bmode is done the way it is, or 
should I clean up my code and check it in ?

Thomas.

PS: No, stifb doesn't work on the HCRX24, yet. It gets initalized, but
still doesn't show anything.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
