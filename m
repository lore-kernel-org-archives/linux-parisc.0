Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postal.sea.checkpoint.com (postal.sea.checkpoint.com [208.252.84.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92827482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 16:13:55 -0600 (MDT)
Received: from cartman.sea.checkpoint.com (localhost [127.0.0.1])
	by postal.sea.checkpoint.com (8.9.3/8.9.3.RJ666.9) with ESMTP id PAA28717
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 15:12:07 -0700
From: marka@sea.checkpoint.com
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 17 Sep 2001 15:13:40 -0700 (Pacific Daylight Time)
In-Reply-To: <Pine.NEB.4.33.0109172318580.16734-100000@www2.scram.de>
Message-ID: <Pine.WNT.4.33.0109171459100.1080-100000@nemo.dev.metainfo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] installing a native built kernel with 2.4.0 (.92 dist).
List-ID: <linux-parisc.vger.kernel.org>

I've successfully installed and upgraded with the .92 distro, but I'm having
trouble getting a natively built kernel with this distro to load.

the load will either freeze at 'branching to kernel entry point' or
on the last time I rebuilt and copied, it complained:

Couldn't grok your kernel executable format
failed to load kernel

this is with kernel-latest and palo-latest from Sep 7 on a b180l

I select PA7300LC on 'make oldconfig' (this sets CONFIG_PA7100LC=y in
.config).

Any tips from the pros on building and installing -latest natively?  I'd
really like to get the fixes in 2.4.9, and there must be something more
interesting that needs to be done than copying/renaming lifimage over to /boot
and updating palo.conf and re-running palo.

-mark
