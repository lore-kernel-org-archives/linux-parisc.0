Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0953482A
	for <parisc-linux@parisc-linux.org>; Tue, 12 Jun 2001 07:42:43 -0600 (MDT)
Date: Tue, 12 Jun 2001 09:43:28 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Pete <plaven@ozemail.com.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] clustering ??
Message-ID: <20010612094328.C1917@megatonmonkey.net>
References: <KHEOKDLGAPDONGNKGOKFAEEGCAAA.jha@xs4all.nl>; <20010611162132.A846@megatonmonkey.net> <3B2692AB.16421.92BF5D@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B2692AB.16421.92BF5D@localhost>; from plaven@ozemail.com.au on Tue, Jun 12, 2001 at 10:07:39PM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 12, 2001 at 10:07:39PM +1000, Pete wrote:
> > We have a cluster of ~48 715/50 Apollo systems.
> 
> Great!! :)  I have one in the shed that I need a serial cable for... :)
> 
> > Visit: http://www.baldric.uwo.ca/index.php3
> 
> Did that.. nice site... didn't quite find out what youa re planning on 
> with the cluster... then again I'm not the most observant...
> Pete.

Pete,

We used our first PPC cluster to enumerate Prime Alternating Knots
to 18 crossings. 
http://baldric.uwo.ca/article.php3?section=baldric&article=knots

After that, it's been in use, on and off by other students.

Our second cluster, the PA-RISC system, will be used for validating some
quantum gravity research (interesting stuff).

Along with some other pet projects.

We are currently still in the setup phase.

- Putting together root tarball to use as node install
- Get rsh to work

And yes, SSH will work as a direct replacement for RSH in MPICH.

However, I believed that SSH was currently broken on PA-RISC due to OpenSSL.

Haven't tried compiling non-open SSH :)
I think we might give it a shot tonight.


Cheers,
Carlos O'Donell
-------------------------
Baldric Project
http://www.baldric.uwo.ca
-------------------------
