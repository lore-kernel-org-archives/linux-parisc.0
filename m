Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tdl.com (tdl.com [206.180.224.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A3DF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 02:35:50 -0600 (MDT)
Received: (from randall@localhost)
	by tdl.com (8.9.3/8.9.3) id BAA30134
	for parisc-linux@lists.parisc-linux.org; Mon, 10 Sep 2001 01:25:02 -0700
Date: Mon, 10 Sep 2001 01:25:02 -0700
From: Randall Craig <randall@tdl.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010910012502.A30056@tdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ccio-dma error
List-ID: <linux-parisc.vger.kernel.org>

My computer frequently crashes with the error message:

 Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping resource

This is with kernel pa17.


This occurs during medium to heavy io. 



This has also caused my /var/lib/dbkg directory to be missing.

How can I rebuild it?
