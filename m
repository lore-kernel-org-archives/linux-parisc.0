Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B01C4878
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Sep 2001 16:32:49 -0600 (MDT)
Date: Sun, 23 Sep 2001 18:33:57 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20010923183357.F3025@megatonmonkey.net>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net> <20010922015609.A14166@dogbert.localdomain> <20010922125826.C6488@megatonmonkey.net> <20010923160005.A30607@dogbert.localdomain> <20010923135550.B1512@megatonmonkey.net> <20010923231535.A5896@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010923231535.A5896@dogbert.localdomain>; from fullung@ilink.nis.za on Sun, Sep 23, 2001 at 11:15:36PM +0200
Subject: [parisc-linux] 720/50 - Out of options
List-ID: <linux-parisc.vger.kernel.org>

> Hello,
> 
> I've tried compiling a kernel with devfs, but I'm not having any luck.
> I'm using xc-latest from about a week ago, and make palo dies with the
> following message:
>

True. I just tried it on my xcompile box, and I get the same thing :)

Seems to be an issue with __set_bit and __test_and_clear_bit,
maybe I'll look into that tonight.

I used to be able to compile with devfs, guess it needs some work
to get up to speed with the recent changes.

I'm out of simple suggestions for you 720/50 :)

I'll see where those unaligned errors come from ...

c. 
