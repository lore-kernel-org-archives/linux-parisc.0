Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9051AAE.dip.t-dialin.net [217.5.26.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37316482D
	for <parisc-linux@parisc-linux.org>; Sun, 17 Jun 2001 08:01:00 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.9.3/8.9.3) id PAA06683
	for parisc-linux@parisc-linux.org; Sun, 17 Jun 2001 15:58:07 +0200
Date: Sun, 17 Jun 2001 15:58:07 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20010617155807.A6530@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] XFree86, sti bmode/wmode merge
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've greped the mailinglist archive, and didn't find anything, that someone
tried the Xfree86 server on parisc. So I did it and to my great surprise
it worked out of the box with stifb (ok, I had to tweak XF86Config a little
bit). Right now the gecko (712/80) to my right display a more of less
ugly Xserver with two Xterms and vtwm as window manager. That's pretty
cool.

I've finished merging byte and word mode sti rom handling and will check that 
in after the checkout is finished (pretty slow connection to pehc at the 
moment). STIfb still works in word mode (the gecko mentioned above runs 
the merged code) and I had a working fbcon on the C200 with a HCRX24 
yesterday. But there are still problems to solve with the HCRX (colors 
were wrong, right now it doesn't work anymore).

Question: I've found the cfb stuff for HP framebuffers in Xfree, but it
doesn't cover the Visualize-EG hardware. Any chance to get docs/code for 
that beast ? I'd like to show a B180 with X on LinuxTag in Stuttgart :-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
