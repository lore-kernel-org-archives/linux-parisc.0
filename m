Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob05.one.net.au (mail-ob05.one.net.au [61.12.0.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id 712F0482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 21:41:00 -0600 (MDT)
Received: Received: [from squeak.local (async134-ade-isp-4.nas.one.net.au [203.101.93.135])
	by mail-ob05.one.net.au  with SMTP id f3F3emW15591
	for <parisc-linux@parisc-linux.org>; Sun, 15 Apr 2001 13:40:49 +1000 (EST)]
From: amodra@one.net.au
Date: Sun, 15 Apr 2001 14:12:16 +0930
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem
Message-ID: <20010415141215.A25145@squeak.one.net.au>
References: <200104142218.QAA30044@puffin.external.hp.com> <E14oZf5-0005mU-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14oZf5-0005mU-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Sun, Apr 15, 2001 at 12:41:00AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Apr 15, 2001 at 12:41:00AM +0100, Alan Cox wrote:
> > Do other arches allow non-PIC .o's to be linked into a .so lib?
> 
> Generally - yes.

True, but it's not recommended.  The reason being that non-PIC code in
a shared lib will mean lib pages with relocations can't be shared between
processes should the library be loaded at a different virtual addresses.

--
Alan Modra
