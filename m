Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6922482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 13:15:10 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id VAA11697
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Sep 2001 21:15:08 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Mon, 3 Sep 2001 21:15:01 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010903211501.A14562@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs newbie
List-ID: <linux-parisc.vger.kernel.org>

I'd like to find out what kernel started this ominous
'Trace/breakpoint trap' on running 'make mrproper' in my linux-source
directory.

2.4.0 (from the 0.9.2 iso) didn't, 2.4.9-pa13 does.

I've rebrowsed all archives to this list, and I haven't found a good
recipe for 'downgrading' with cvs. I have cvs installed. I have the
recommended .cvsrc from the list. I have a 64 kBaud connection on which
I pay for each minute. I have downloaded linux-20010831.tar.gz, and
untarred it as /home/jurriaan/linux/.

How do I downgrade that linux-tree to say 2.4.5-pa1 or some other
release? I believe this 'Trace/breakpoint trap' thing can be found, and
I have the time to search for it - but how to I get older kernels?

[As an aside: how I would love to have puffin.external.hp not only have
tarballs of the latest kernels, but also day-to-day patchfiles for the
last 2 months or something like that.]

Thanks,
Jurriaan
-- 
Beam me up, Scotty. This planet sucks!
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.00 0.00
