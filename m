Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 614A4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Aug 2001 10:33:25 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f7DGhGX22749
	for <parisc-linux@lists.parisc-linux.org>; Mon, 13 Aug 2001 12:43:16 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f7DGXtM22162
	for parisc-linux@lists.parisc-linux.org; Mon, 13 Aug 2001 12:33:55 -0400
Date: Mon, 13 Aug 2001 12:33:55 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] list of supported machine types
Message-ID: <20010813123355.D22022@megatonmonkey.net>
References: <8766bs5476.fsf@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8766bs5476.fsf@rover.gag.com>; from bdale@gag.com on Mon, Aug 13, 2001 at 10:12:45AM -0600
List-ID: <linux-parisc.vger.kernel.org>

>   I have a couple of HP systems flying around here, *counting* 9, different
>   models, which one will do and which won't?
> 
> The closest thing is http://www.parisc-linux.org/release-0.9/systems.html, but
> it isn't clear whether that list is still correct for 0.9.2?  
> 
> Bdale
>

Bdale,

A very good point. We have a cluster of 30x 712/50's running.
Although we have taken some unorthodox steps, like running ypbind
in debug mode so it doesn't crash, voodoo magic and x-compiled MPICH.

We also have a few 712/33's running, but we mostly gutted them for
parts. I'll see if I can rebuild one this week and test on it.

We have a single 712/60 that Byron Sonne gave us (Hi Bryon!) and
it ran without any problem. The 712/60 is happily living as Node23 
right now :)

Should we attempt to track usable .config's for a given machine type/setup?
Navigating the kernel config on the 712/50's is a bit like a minefield...
you enable the wrong thing and boom!

Cheers,
Carlos.

 
