Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA25224
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 15:29:31 -0600
Message-Id: <200010142130.RAA07016@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Troubles following the 'recipe'
To: raj@cerias.purdue.edu (Brian Poole)
Date: Sat, 14 Oct 2000 17:30:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.SOL.4.10.10010141601190.22986-100000@basm.cerias.purdue.edu> from "Brian Poole" at Oct 14, 2000 04:18:56 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Ah this seems to yield a bit more light..
> 
> It ignores about 8 non-existent dirs.. 
> (I've added BDIR=/home/raj/parisc/gcc-build to help shorten my typing.. no
> mouse. DEST is still /usr/parisc :)
> 
> $DEST/hppa1.1-linux/bin/include
> $DEST/hppa1.1-linux/lib/include
> $DEST/hppa1.1-linux/include
> $BDIR/lib/gcc-lib/hppa1.1-linux/2.96/include
> $BDIR/hppa1.1-linux/sys-include
> $BDIR/hppa1.1-linux/include
> $DEST/hppa1.1-linux/sys-include
> $DEST/hppa1.1-linux/include
> 
> then outputs..
> 
> #include "..." search starts here:
> #include <...> search starts here:
>  .
>  ../../../gcc/libio
>  $BDIR/gcc/include
>  $DEST/lib/gcc-lib/hppa1.1-linux/2.96/include
> 
> Well now, it doesn't seem to be reading $DEST/include, why is it not?
> Seems strange that I be the only one to encounter this problem, given
> the same set of simple instructions. As well, how do I fix this? 
> 
> In the Makefile under gcc-build it lists the includedir=${prefix}/include
> and prefix as /usr/parisc, which looks correct.. ideas?

Did you install gcc?  The include paths are a bit different if it isn't
installed.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
