Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postal.sea.checkpoint.com (postal.sea.checkpoint.com [208.252.84.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCDF8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 11:10:56 -0600 (MDT)
Received: from cartman.sea.checkpoint.com (localhost [127.0.0.1])
	by postal.sea.checkpoint.com (8.9.3/8.9.3.RJ666.9) with ESMTP id KAA05286
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 10:08:58 -0700
From: marka@sea.checkpoint.com
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 18 Sep 2001 10:10:43 -0700 (Pacific Daylight Time)
Subject: Re: [parisc-linux] installing a native built kernel with 2.4.0 (.92
 dist).
In-Reply-To: <20010918163015.Q19441@linuxcare.com>
Message-ID: <Pine.WNT.4.33.0109181004310.3268-100000@nemo.dev.metainfo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Thanks for your help,

Ok, it turns out it is booting (the machine's so quiet it's hard to tell), and
not 'freezing' per-say at 'branching to kernel entry point 0x00100000'.  It's
simply not sending anything to ttyS0 any more after this point.  This seems to
be the 'swapped serial ports' issue mentioned earlier on this list.

--
Mark
