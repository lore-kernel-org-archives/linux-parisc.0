Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id C399F482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 17:39:33 -0600 (MDT)
Subject: Re: [parisc-linux] xfree86 build problem
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Sun, 15 Apr 2001 00:41:00 +0100 (BST)
Cc: amodra@one.net.au, parisc-linux@parisc-linux.org
In-Reply-To: <200104142218.QAA30044@puffin.external.hp.com> from "Grant Grundler" at Apr 14, 2001 04:18:47 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14oZf5-0005mU-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Anyway, after spending another two hours on the -fPIC problem, I'm
> starting to think the xfree86 lib build is broken by design for __hppa__.
> I'll send out another mail with a patch + recipe for building the libs.
> I'm pretty close to finding workarounds (not solutions) for the problems.

Did the patches I built to get XFree86 libs building not get as far as you.
I sent them to Paul (I believe)

> Do other arches allow non-PIC .o's to be linked into a .so lib?

Generally - yes.
