Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9149D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 08:18:16 -0600 (MDT)
Date: Thu, 11 Oct 2001 10:19:40 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Cc: willy@debian.org
Subject: Re: [parisc-linux] Glibc 2.2.4-2 No Optimizations = No Compliation
Message-ID: <20011011101940.B8106@megatonmonkey.net>
References: <20011011073101.B5637@megatonmonkey.net> <20011011144718.A22924@parcelfarce.linux.theplanet.co.uk> <20011011095913.A8106@megatonmonkey.net> <20011011150326.C22924@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011011150326.C22924@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Oct 11, 2001 at 03:03:26PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> Sometimes.  More importantly, gcc stops doing stupid things with -O1,
> particulalry shifting registers backwards and forwards with no net effect.
> 

I've not seen such mischieviously deviant behaviour from gcc :}

> 
> Not the case.  gcc will inline functions marked as such at -O1.  At -O3,
> it decides for itself to inline some things.
>

Ok.

Compiled with -O0 and I get undefined referancs to try_lock...
curse those inlined functions.

Back to -O1 and some debugging.

c.
