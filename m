Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lufmech.rwth-aachen.de (karman.lufmech.RWTH-Aachen.DE [134.130.177.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91F53482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 08:33:06 -0600 (MDT)
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3AC9DF1A.6556BC29@lufmech.rwth-aachen.de>
Date: Tue, 03 Apr 2001 16:32:59 +0200
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs-gcc: howto build a 64-bit version?
References: <Pine.LNX.4.21.0104040001140.6476-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:

> > cc1: Internal compiler error in set_sizetype, at stor-layout.c:1673
>
> I don't see this error when either cross-compiling or natively
> boot-strapping gcc under hppa-linux.

I fear this type of bug.

>  It's possible your bootstrap compiler has bugs that are preventing a
> successful build.

I used the 32-bit version of cvs-gcc. So its gcc applied to itself.
It was recommended to use gcc for the 64-bit binutils
due to bugs in hp's cc (size of int). What else can I do?

building binutils with hp cc dies with:
cpp: "./bfd.h", line 141: error 4062: No 64 bit integer type available
cpp: "./bfd.h", line 141: error 4062: No 64 bit integer type available

Did You manage to bootstrap todays cvs 64-bit version
on a vanilla system?

another method:
I started with hp-cc/gcc-compiled binutils:

echo "int xxy_us_dummy;" >tmp-dum.c
./xgcc -B./
-B/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/bin/
-isystem
/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/include -S
tmp-dum.c
cc1: Internal compiler error in ?, at stor-layout.c:1673


Markus
