Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D353482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 05:36:01 -0600 (MDT)
Received: Received: [from squeak.local (async138-ade-isp-2.nas.one.net.au [203.101.90.139])
	by mail-ob03.one.net.au  with SMTP id f4GBZu021526
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 May 2001 21:35:57 +1000 (EST)]
From: amodra@one.net.au
Date: Wed, 16 May 2001 21:10:20 +0930
To: Mark Kettenis <kettenis@science.uva.nl>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010516211020.M14368@squeak.one.net.au>
References: <200105160850.f4G8oer12233@debye.wins.uva.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105160850.f4G8oer12233@debye.wins.uva.nl>; from kettenis@science.uva.nl on Wed, May 16, 2001 at 10:50:40AM +0200
Subject: [parisc-linux] Re: hppa-linux libgcc
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 16, 2001 at 10:50:40AM +0200, Mark Kettenis wrote:
>    When building shared libs, hppa-linux needs to link against the static
>    version of libgcc to pick up millicode routines.  hppa-linux doesn't
>    currently support a shared libgcc because millicode functions cannot
>    be exported from a shared lib due to the ABI (linker and dynamic linker
>    really).  To successfully use a shared libgcc, we'd need to link against
>    _both_ libgcc_s.so and libgcc.a, which is a pain.
> 
> Did you consider using a linker script for libgcc_s.so instead of the
> usual symbolic link to libgcc_s.so.0?

No.  I mainly considered fixing the linker to support calls to millicode
in shared libs, but didn't get one of those round tuits.  :-(

>  The contents of libgcc_s.so
> would be something like:
> 
>   GROUP ( libgcc_s.so.0 libgcc.a )
> 
> Glibc uses a similar trick (take a look at /usr/lib/libc.so), and it
> seems to work fine.

Thanks.  That's a good idea.
