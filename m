Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 710BB4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 16:54:16 -0700 (MST)
Subject: Re: [parisc-linux] Fun with RAID
To: grundler@cup.hp.com (Grant Grundler)
Date: Mon, 5 Feb 2001 23:15:08 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox),
	parisc-linux@lists.parisc-linux.org, grundler@milano.cup.hp.com
In-Reply-To: <200102052310.PAA02945@milano.cup.hp.com> from "Grant Grundler" at Feb 05, 2001 03:10:10 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14Puql-0004SW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I've pointed out to Matthew that using speculative loads (for PA2.0)
> would help to preload cachelines.

On the x86 athlon boxes it helps massively for memcpy performance too
as a lot of our page copies are not cache->cache. The other place Arjan found
was a big win which isnt yet mainstream is prefetching task structs in
the scheduler
