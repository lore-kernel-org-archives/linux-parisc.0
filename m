Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12E53482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 22:34:24 -0600 (MDT)
Date: Wed, 17 Oct 2001 00:35:49 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Randolph Chung <randolph@tausq.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc builds!
Message-ID: <20011017003549.B11826@megatonmonkey.net>
References: <20011016210925.H537@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011016210925.H537@tausq.org>; from randolph@tausq.org on Tue, Oct 16, 2001 at 09:09:25PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> As it turns out there was a binutils bug that seems to be causing the
> glibc build failures. it was also affecting mips. the binutils bug is
> fixed in the upcoming (tomorrow) -3 release.
> 
> glibc is building on my box now. I will upload RSN.
> 
> Thanks to Ryan Murray <rmurray@debian.org> for the heads up!
> 
> For those of you interested in looking at glibc, there are some warnings
> in atomicity.h (we don't have a hppa-specific one) and some of the
> linuxthreads tests are failing. Patches will be much appreciated :)
>

This is excellent!

Where can I get the details on the binutils bug?
 
I've read the bug-binutils and binutils-cvs and I don't
see anything out of the ordinary (though it's easy to lose track).

c.
