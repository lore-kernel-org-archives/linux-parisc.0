Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45E8A489E
	for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 10:49:34 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f8OHDZG27183
	for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 13:13:35 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f8OGnVa10730
	for parisc-linux@parisc-linux.org; Mon, 24 Sep 2001 12:49:31 -0400
Date: Mon, 24 Sep 2001 12:49:31 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924124931.B10662@megatonmonkey.net>
References: <20010924132145.B8726@dogbert.localdomain> <Pine.NEB.4.33.0109241435300.9317-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0109241435300.9317-100000@www2.scram.de>; from jochen@scram.de on Mon, Sep 24, 2001 at 02:36:17PM +0200
List-ID: <linux-parisc.vger.kernel.org>

> 
> > After your changes (making case 18 fall through to case 28), I get the
> > following happy-and-warm-and-fuzzy message:
> 
> As i said, the second patch didn't work for me, as well. The first one
> (fall through to case 26) did.
> 
> Cheers,
> Jochen
>

There has been a lot of recent work on adding the unaligned 
handlers that were missing.  I think that previously, most of 
the handlers for the older CPU's hadn't been written... now that
they are there, the fallthrough case has more support.

I'm glad that Albert got his system working.
(Crosses fingers)

Someone should look into incorporating that kludge for the 720/50
machines.

Where are the oracles of the CVS? :)

c. 
