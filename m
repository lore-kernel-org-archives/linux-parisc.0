Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D2A3482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Aug 2002 16:40:13 -0600 (MDT)
Date: Sat, 24 Aug 2002 18:37:51 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <tausq@debian.org>
Cc: "B. Douglas Hilton" <bdhilton@charter.net>,
	debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20020824223751.GA16590@systemhalted>
References: <3D67C8AC.2080309@charter.net> <20020824180137.GB25592@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020824180137.GB25592@tausq.org>
Subject: [parisc-linux] Re: Compiling glide-2001.01.26 on hppa
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > cc -O6 -m486 -fomit-frame-pointer -funroll-loops \
> > -fexpensive-optimizations -ffast-math -DBIG_OPT -I. \
> > -I/usr/src/glide-2001.01.26/build-tree/glide2x/swlibs/include \
> > -I/usr/src/glide-2001.01.26/build-tree/glide2x/cvg/include \
> > -DENDB -DX11 -Wall -fPIC -DPIC -c -o fx64.o fx64.c
> > 
> > cc1: Invalid option `486'
> > 
> > 
> > My question is, what incantation should I use on hppa to
> > replace the '-O6 -m486 -f...' CFLAGS?
> 
> i would suggest just using "-O2" for now....
> 
> randolph
> 

The issues revolves around the fact that the source tree and 
assembly for some of pieces you want to build are meant for x86 boxes.
Though from a cusory glance it looks like the .c files are present for
these bits (so you can revert to those).

Right off the top:
tvg/makefile.linux:CFLAGS = -O -m486 -fomit-frame-pointer $(LCDEFS) $(LCOPTS) $(LCINC)
glide2x/sst1/init/initvg/makefile.unix:CFLAGS = -O -m486 -fomit-frame-pointer $(LCDEFS) $(LCOPTS) $(LCINC)
glide2x/swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide2x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide2x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide2x/swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486
glide3x/swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide3x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide3x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
glide3x/swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486
swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486

These files will give you some grief and need to be changed; remove the -m486 bit.
You either need to produce .dpatch's for the deb to use or stop building
the deb and do it by hand with the upstream source.

You've got me all excited about seeing this work :) I have a Vodoo1 (Monster3D)
PCI card that I might be tempted to ressurect.

Hope this helps. Sorry about there not being a _magic_ switch :)

c.
