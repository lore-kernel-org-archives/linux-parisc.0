Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B6C9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 10:32:43 -0600 (MDT)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GETSMG02.L97 for
          <parisc-linux@lists.parisc-linux.org>; Tue, 12 Jun 2001 08:32:40 -0800
Received: from devnull.alaskatech.org ([24.237.5.207]) by
          mmp-2.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GETSMG01.W0Z for <parisc-linux@lists.parisc-linux.org>; Tue, 12
          Jun 2001 08:32:40 -0800
Date: Tue, 12 Jun 2001 08:32:39 -0800 (AKDT)
From: Tom <tom@Alaskatech.org>
To: PA-RISC Linux list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] clustering ??
In-Reply-To: <20010612094328.C1917@megatonmonkey.net>
Message-ID: <Pine.LNX.4.33.0106120829320.26952-100000@devnull.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 12 Jun 2001, Carlos O'Donell Jr. wrote:
[snip]
> And yes, SSH will work as a direct replacement for RSH in MPICH.
>
> However, I believed that SSH was currently broken on PA-RISC due to OpenSSL.
>
> Haven't tried compiling non-open SSH :)
> I think we might give it a shot tonight.

Not sure what "broken" may mean, but my 0.9 install has a working SSH
server running on it. Mine *was* installed with contrib and non-free
however, so it may be that a "pure" install doesn't have it.

If I remember right I was asked during the .deb install if I wanted to run
it as a server, answered yes and it's worked ever since (Same as a x86
Debian install). The 0.9 install sure does work better than the 0.6 one
did - no seg faults or errors...
