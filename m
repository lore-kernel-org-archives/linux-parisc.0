From: "Christopher C. Chimelis" <chris@debian.org>
Subject: Re: [parisc-linux] Re: Compiling glide-2001.01.26 on hppa
Date: Tue, 27 Aug 2002 00:02:21 -0400 (EDT)
Message-ID: <Pine.LNX.4.21.0208270001180.28522-100000__42643.5312525884$1416621652$gmane$org@spawn.hockeyfiend.com>
References: <20020824223751.GA16590@systemhalted>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Randolph Chung <tausq@debian.org>,
	"B. Douglas Hilton" <bdhilton@charter.net>,
	debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020824223751.GA16590@systemhalted>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Try starting with the source for glide3-alpha.  It is the 64-bit branch of
the glide sources.  I tweaked them to compile ok on Alpha and they
shouldn't be hard to fix up for hppa as well.

C

On Sat, 24 Aug 2002, Carlos O'Donell wrote:

> > > cc -O6 -m486 -fomit-frame-pointer -funroll-loops \
> > > -fexpensive-optimizations -ffast-math -DBIG_OPT -I. \
> > > -I/usr/src/glide-2001.01.26/build-tree/glide2x/swlibs/include \
> > > -I/usr/src/glide-2001.01.26/build-tree/glide2x/cvg/include \
> > > -DENDB -DX11 -Wall -fPIC -DPIC -c -o fx64.o fx64.c
> > > 
> > > cc1: Invalid option `486'
> > > 
> > > 
> > > My question is, what incantation should I use on hppa to
> > > replace the '-O6 -m486 -f...' CFLAGS?
> > 
> > i would suggest just using "-O2" for now....
> > 
> > randolph
> > 
> 
> The issues revolves around the fact that the source tree and 
> assembly for some of pieces you want to build are meant for x86 boxes.
> Though from a cusory glance it looks like the .c files are present for
> these bits (so you can revert to those).
> 
> Right off the top:
> tvg/makefile.linux:CFLAGS = -O -m486 -fomit-frame-pointer $(LCDEFS) $(LCOPTS) $(LCINC)
> glide2x/sst1/init/initvg/makefile.unix:CFLAGS = -O -m486 -fomit-frame-pointer $(LCDEFS) $(LCOPTS) $(LCINC)
> glide2x/swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide2x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide2x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide2x/swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486
> glide3x/swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide3x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide3x/swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> glide3x/swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486
> swlibs/include/make/3dfx.linux.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> swlibs/include/make/3dfx.mak:CNODEBUG       = -O6 -m486 -fomit-frame-pointer -funroll-loops \
> swlibs/include/make/makefile.autoconf.bottom:GLIDE_DEBUG_GCFLAGS = -O6 -m486
> 
> These files will give you some grief and need to be changed; remove the -m486 bit.
> You either need to produce .dpatch's for the deb to use or stop building
> the deb and do it by hand with the upstream source.
> 
> You've got me all excited about seeing this work :) I have a Vodoo1 (Monster3D)
> PCI card that I might be tempted to ressurect.
> 
> Hope this helps. Sorry about there not being a _magic_ switch :)
> 
> c.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
