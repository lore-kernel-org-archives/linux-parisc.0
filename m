Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56AAC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 08:41:58 -0700 (MST)
Date: Tue, 25 Mar 2003 10:41:44 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, dave.anglin@nrc-cnrc.gc.ca,
	tausq@debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
Message-ID: <20030325154144.GN8436@systemhalted>
References: <20030324220130.GP31008@parcelfarce.linux.theplanet.co.uk> <200303251427.h2PERXxE029413@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303251427.h2PERXxE029413@hiauly1.hia.nrc.ca>
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

> I noticed that a couple of libstdc++ tests that used to fail because
> of the long double mismatch are fixed with 2.3.1-14 :)

Really? I didn't even put in patches for -14? :) This is all strictly
from upstream glibc.
 
> > > elf/vismain.out
> > > elf/neededtest.out
> > > elf/neededtest2.out
> > > elf/neededtest3.out
> > > elf/neededtest4.out
> > > elf/circleload1.out
> > > 
> > > - These have been around for a while, any idea about how to fix them?
> > 
> > They've certainly been around since I was hacking on glibc ...
> 
> Are you testing with 3.3?  Some elf tests in the binutils suite
> were failing because of the need to canonicalize function pointers.
> There were also some tests that failed because we absolutely need
> '-fPIC' for tests with shared libraries.  I'd be interested to know
> what's causing these.

I can rebuild it using 3.3 and see if this goes away. Right now I'm
building with 3.2.3. I sure hope getting rid of these is as easy as
building with 3.3!

On a second note, I've completely revamped the sysdep-cancel support
since I must have been smoking crack when I wrote it... so I'm going to
compile another round that should come out much better (hopefully
removing all the linuxthread failures).

Thanks for the feedback!

c.
