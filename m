Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lufmech.rwth-aachen.de (karman.lufmech.RWTH-Aachen.DE [134.130.177.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65970482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 06:40:41 -0600 (MDT)
Sender: markus@lufmech.rwth-aachen.de
Message-ID: <3AC9C4C1.D6078033@lufmech.rwth-aachen.de>
Date: Tue, 03 Apr 2001 14:40:33 +0200
From: Markus Werle <markus@lufmech.rwth-aachen.de>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs-gcc: howto build a 64-bit version?
References: <Pine.LNX.4.21.0104032119230.6476-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:

> On Tue, 3 Apr 2001, Markus Werle wrote:
>
> > problems, but the 64-bit bootstrap
> > fails. Any help for creating a 64-bit version of g++ appreciated.
>
> I see you're trying to build for HPUX.  You will probably be better off
> tracking sourceware gcc, although I understand you've had some trouble
> there too.  :-(

Are You talking about thge redhat cvs tree?
Is that tree more up-to-date/applicable for hpux than puffin's?

> Since we don't have glibc for hppa64-linux, I really
> only support --languages=c for the 64 bit compiler at the moment.

the ICE error I reported is independent of  --enable-languages=c or more

  116  rm -rf *
  117  ../gcc/configure --host=hppa64-hp-hpux11.00
--prefix=/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF --with-gnu-as
--with-gnu-ld --enable-languages=c --enable-version-specific-runtime-libs
&& make -j4 bootstrap
  118  make bootstrap

ends with an ICE during bootstrap

[...]
echo "int xxy_us_dummy;" >tmp-dum.c
./xgcc -B./
-B/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/bin/
-isystem
/opt/FREE-SOFTWARE/puffin-gcc-20010403-ELF/hppa64-hp-hpux11.00/include -S
tmp-dum.c
cc1: Internal compiler error in set_sizetype, at stor-layout.c:1673
