From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
	compiling ruby1.9
Date: Thu, 18 Dec 2008 10:05:14 -0500
Message-ID: <20081218150514.GA8535@bombadil.infradead.org>
References: <4949812D.7080608@gmx.de> <20081218070340.GF30438@bombadil.infradead.org> <20081218130940.137190@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218130940.137190@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 18, 2008 at 02:09:40PM +0100, Helge Deller wrote:
> -------- Original-Nachricht --------
> > On Wed, Dec 17, 2008 at 11:46:05PM +0100, Helge Deller wrote:
> > > The Debian bugzilla has a long thread about kernel crashes when
> > > compiling ruby1.9 on hppa. This kernel bug led even to discussions if
> > > hppa should be dropped for lenny.
> > > See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=478717 for details.
> > > 
> > > It's really easy to reproduce the bug, and it generates this backtrace
> > > (interestingly two backtraces):
> > 
> > When does it die? My ruby1.9 is building through to the tests (where
> > it's hanging without crashing...)
> 
> If it does not happen directly for you, just try a few times/cycles, e.g. make, make clean in the build directory.
> Even killing the hanging miniruby processes can make the kernel die (when my patch wasn't applied). With the patch it stays hanging.
>

Aside from the testsuite hanging it seems to be building fine for me no
matter how many times I let it go...

making ruby1.9
make[1]: Entering directory `/home/kyle/src/ruby1.9-1.9.0.2'
cc -fno-strict-aliasing -g -g -O2 -O2 -g -Wall -Wno-parentheses  -fPIC
-L.  -rdynamic -Wl,-export-dynamic   main.o  -lruby1.9 -lpthread -lrt
-ldl -lcrypt -lm   -o ruby1.9
make[1]: Leaving directory `/home/kyle/src/ruby1.9-1.9.0.2'

Let me debootstrap on another machine and try it there, sigh.
