Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postal.sea.checkpoint.com (postal.sea.checkpoint.com [208.252.84.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA805482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 13:34:35 -0600 (MDT)
Received: from cartman.sea.checkpoint.com (localhost [127.0.0.1])
	by postal.sea.checkpoint.com (8.9.3/8.9.3.RJ666.9) with ESMTP id MAA07199
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 12:32:37 -0700
From: marka@sea.checkpoint.com
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 18 Sep 2001 12:34:26 -0700 (Pacific Daylight Time)
Subject: Re: [parisc-linux] installing a native built kernel with 2.4.0 (.92
 dist).
In-Reply-To: <20010918200438.T19441@linuxcare.com>
Message-ID: <Pine.WNT.4.33.0109181230530.3268-100000@nemo.dev.metainfo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 18 Sep 2001, Richard Hirst wrote:
> That should be fixed in the latest kernel source, please let us know
> if it is still broken on your box.

lo and behold it is fixed, thanks! broken in pa17 and fixed in pa22.

Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
ttyS00 at iomem 0xffd05800 (irq = 154) is a 16550A
ttyS01 at iomem 0xfff83800 (irq = 74) is a 16550A

--
Mark
