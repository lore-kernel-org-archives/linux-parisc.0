Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postal.sea.checkpoint.com (postal.sea.checkpoint.com [208.252.84.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id DACC9482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 15:55:26 -0600 (MDT)
Received: from cartman.sea.checkpoint.com (localhost [127.0.0.1])
	by postal.sea.checkpoint.com (8.9.3/8.9.3.RJ666.9) with ESMTP id OAA21131
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 14:53:03 -0700
From: marka@sea.checkpoint.com
To: parisc-linux@lists.parisc-linux.org
Date: Wed, 19 Sep 2001 14:55:13 -0700 (Pacific Daylight Time)
Message-ID: <Pine.WNT.4.33.0109191442050.5872-100000@nemo.dev.metainfo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] interesting problem in tty? telnetd? ls?
List-ID: <linux-parisc.vger.kernel.org>

I'm not sure where this problem is occuring, but I suspect it's telnetd.

telnet to your pa-risc linux box
cd to the root directory
execute 'ls -alR'

you'll lose your ptty and telnet session after a short while (seconds), but
never at the the same place during the listing.  This does not occur over the
serial console, but since that's only running at 9600 it may not be fast
enough for the drop to occur.

--
Mark
