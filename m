Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95055C6.dip.t-dialin.net [217.80.85.198])
	by dsl2.external.hp.com (Postfix) with ESMTP id 928264A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Feb 2001 18:39:17 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f191d8d25749
	for <parisc-linux@lists.parisc-linux.org>; Fri, 9 Feb 2001 02:39:09 +0100
Date: Fri, 9 Feb 2001 02:39:08 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102090236360.25675-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] problems compiling STI support
List-ID: <linux-parisc.vger.kernel.org>

If I enable STI console support and/of STI fbcon support,
I got the following error:

error: can't find sti.h

well, I don't have any sti.h in the kernel source (current CVS).

Well, hope that helps!

cu max
