Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA24699
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 15:17:50 -0600
Date: Sat, 14 Oct 2000 16:18:56 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <200010142026.QAA01645@hiauly1.hia.nrc.ca>
Message-ID: <Pine.SOL.4.10.10010141601190.22986-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 14 Oct 2000, John David Anglin wrote:
> 
> Run the failing compilation with the gcc `-v' option to see the include search
> directories.
> 

Ah this seems to yield a bit more light..

It ignores about 8 non-existent dirs.. 
(I've added BDIR=/home/raj/parisc/gcc-build to help shorten my typing.. no
mouse. DEST is still /usr/parisc :)

$DEST/hppa1.1-linux/bin/include
$DEST/hppa1.1-linux/lib/include
$DEST/hppa1.1-linux/include
$BDIR/lib/gcc-lib/hppa1.1-linux/2.96/include
$BDIR/hppa1.1-linux/sys-include
$BDIR/hppa1.1-linux/include
$DEST/hppa1.1-linux/sys-include
$DEST/hppa1.1-linux/include

then outputs..

#include "..." search starts here:
#include <...> search starts here:
 .
 ../../../gcc/libio
 $BDIR/gcc/include
 $DEST/lib/gcc-lib/hppa1.1-linux/2.96/include

Well now, it doesn't seem to be reading $DEST/include, why is it not?
Seems strange that I be the only one to encounter this problem, given
the same set of simple instructions. As well, how do I fix this? 

In the Makefile under gcc-build it lists the includedir=${prefix}/include
and prefix as /usr/parisc, which looks correct.. ideas?

Thanks again,

-b
