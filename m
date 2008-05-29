From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 20:15:32 -0400
Message-ID: <20080529001532.GF30501@phobos.i.cabal.ca>
References: <20080528234110.GD30501@phobos.i.cabal.ca> <20080529000059.9C6434E77@hiauly1.hia.nrc.ca> <20080529000219.GE30501@phobos.i.cabal.ca> <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 28, 2008 at 08:07:00PM -0400, Carlos O'Donell wrote:
> On Wed, May 28, 2008 at 8:02 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > I tried 4.4 from svn a few days (more like 2 weeks maybe) ago. Is that
> > recent enough or should I try 4.3-head as well (no problem to do.)
> 
> Yes, please try 4.3-head.
> 

Ok, the Debian version is pretty recent though.

kyle@shortfin:~/linux-2.6-gcc42$ hppa64-linux-gnu-gcc-4.3 -v
Using built-in specs.
Target: hppa64-linux-gnu
Configured with: ../src/configure --enable-languages=c --prefix=/usr
--libexecdir=/usr/lib --disable-shared --disable-nls --disable-threads
--disable-libgomp --disable-libmudflap --disable-libssp
--with-as=/usr/bin/hppa64-linux-gnu-as
--with-ld=/usr/bin/hppa64-linux-gnu-ld
--includedir=/usr/hppa64-linux-gnu/include --host=hppa-linux-gnu
--build=hppa-linux-gnu --target=hppa64-linux-gnu
Thread model: single
gcc version 4.3.1 20080523 (prerelease) (GCC) 
kyle@shortfin:~/linux-2.6-gcc42$ 

I'll build my xcompiler using 4.3-HEAD instead of HEAD and we'll see.
(the xcompiler fails the same way, so I'm confident it will be fine
building on my i386... all builds in this thread discussed so far have
been natively built.)

r, kyle
