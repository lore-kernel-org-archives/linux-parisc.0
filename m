Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95059A4.dip.t-dialin.net [217.80.89.164])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8CBB4A19
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 13:16:44 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f1BKGdR09611
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Feb 2001 21:16:41 +0100
Date: Sun, 11 Feb 2001 21:16:39 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ASP Parallel port driver broken on HP9000/730 
In-Reply-To: <200102090338.TAA07555@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0102112112310.9410-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Feb 2001, Grant Grundler wrote:

> echo 0xe840c000=i | adb   says:
> 		BV              r0(r2)
> 
> GR02 is the most recent subroutine call return addr.
> (Typically the caller).
> 
> So look up c026e458 and c0246328 in your System.map.
> You can at least figure out about where it's crashing.

done that (I also checked that is is the correct System.map),
but there is no entry for c026e458 and c0246328 !!!
Also build a new kernel (and a new System.map), but
the same result :(

> (Hint: cvs co build-tools and look at a.c)

I did not tried this yet ...
 

greetings max
